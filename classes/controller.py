from config import database
#from Crypto.Cipher import AES
from Crypto.Hash import MD5
from config import helpers
import time



def insertUser(req, utype):
	fname = req.forms.get("fname")
	lname = req.forms.get("lname")
	address = req.forms.get("address")
	phone = req.forms.get("phone")
	email = req.forms.get("email")
	uname = req.forms.get("uname")
	pwd = req.forms.get("pwd")
	c = database.conn.cursor()
	try:
		query = 'INSERT INTO users values (NULL, "%s", "%s","%s", "%s", "%s", "%s", "%s", "%s")'%(fname,lname,utype,address,phone,email, uname, pwd)
		c.execute(query)
		database.conn.commit()
		return {"status":"success", "msg":"New user added"}
	except:
		return {"status":"failed", "msg":"Looks like error, don't worry we will resolve it soon"}


def sendSecret(req):
	uname = req.forms.get('username');
	email = req.forms.get('email');
	secret = helpers.random_string(64)
	c = database.conn.cursor()
	sql = "SELECT id from users where email='%s' AND username='%s'"%(email,uname)
	users = []
	c.execute(sql)
	users = c.fetchone()
	if users:
		uid = users[0]
		if uid != 0:
			message = "<h2>%s <b>%s,</b></h2> %s\n%s\n<span style='color:blue;'>%s</span>"%("Welcome",uname,"Thank you for login to our system","Use following key to login",secret)
			sub = "Your secret key for login on %s"%(time.strftime('%A, %d %b %Y %I:%M %p'))
			status = helpers.secretKeyMail(email,sub, message)
			query = 'INSERT INTO login values (%d, "%s", "%s")'%(uid,secret,time.strftime('%Y-%m-%d %H:%M:%S'))
			c.execute(query)
			msg = status
			#msg = {"status":"success", "message":"A secret key is sent, Please check your mail"}
		else:
			msg ={"status":"failed", "message": "Please provide correct email and username combination"}
	else:
		msg = {"status":"failed","message":"Invalid user"}
	database.conn.commit()
	return msg



def logIn(req, utype):
	email = req.forms.get('email')
	uname = req.forms.get('uname')
	pwd = req.forms.get('pwd')
	secret = req.forms.get('secret')
	c = database.conn.cursor()
	sql = 'SELECT a.id as userid, a.email as email, a.username as uname, b.created_at as login_on from users a join login b on a.id=b.userid where a.email="%s" AND a.username="%s" AND a.password="%s" AND a.usertype="%s"AND b.secret="%s"'%(email,uname,pwd, utype,secret)
	loggedinusers = []
	c.execute(sql)
	loggedinusers = c.fetchone()
	if loggedinusers:
		print(loggedinusers)
		return {"status":"success", "msg":"User found", "id":loggedinusers[0], "email":loggedinusers[1]}
	else:
		return {"status":"failed", "msg":"Please enter proper secret key, email and password combination"}