from config import database
#from Crypto.Cipher import AES
from Crypto.Hash import MD5
from config import helpers
import time



def getUsers():
	c = database.conn.cursor()
	c.execute("SELECT * FROM users")
	database.conn.commit()
	data = []
	for r in c.fetchall():
		data.append(r)
	return data


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
		else:
			msg ={"status":"failed", "message": "Please provide correct email and username combination"}
	else:
		msg = {"status":"failed","message":"Invalid user"}
	database.conn.commit()
	return msg