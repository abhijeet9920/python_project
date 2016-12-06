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
			helpers.sendMail(email,sub, message)
			query = 'INSERT INTO login values (%d, "%s", "%s")'%(uid,secret,time.strftime('%Y-%m-%d %H:%M:%S'))
			c.execute(query)
			#msg = status
			msg = {"status":"success", "message":"A secret key is sent, Please check your mail"}
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
	sql = 'SELECT a.*, b.created_at as login_on from users a join login b on a.id=b.userid where a.email="%s" AND a.username="%s" AND a.password="%s" AND a.usertype="%s"AND b.secret="%s"'%(email,uname,pwd, utype,secret)
	loggedinusers = []
	c.execute(sql)
	loggedinusers = c.fetchone()
	if loggedinusers:
		return {"status":"success", "msg":"User found", "id":loggedinusers[0], "email":loggedinusers[1], "type":loggedinusers[3],"uname":loggedinusers[7]}
	else:
		return {"status":"failed", "msg":"Please enter proper secret key, email and password combination"}


def saveFile(path, user, keys):
	splited = path.split('/')
	siz = len(splited)
	fname = splited[siz-1]
	c = database.conn.cursor()
	try:
		sql = 'INSERT INTO files values (NULL,"%s", "%s","%s","%d","%s")'%(keys,fname,path,user,time.strftime('%Y-%m-%d %H:%M:%S'))
		c.execute(sql)
		database.conn.commit()
		return {"status":"success", "msg":"New file added", "class":"alert alert-success"}
	except:
		return {"status":"failed", "msg":"Failed to store file in database", "class":"alert alert-danger"}


def getFiles(name):
	c = database.conn.cursor()
	if name != '':
		sql = "SELECT a.id, a.path, a.filename, a.created_at, concat(b.fname, ' ',b.lname), a.keywords from files as a JOIN users as b on a.uploadby = b.id where a.filename like '%{0}%' or a.keywords like '%{1}%'".format(name,name);
		print(sql)
	else:
		sql = "SELECT a.id, a.path, a.filename, a.created_at, concat(b.fname, ' ',b.lname), a.keywords from files as a JOIN users as b on a.uploadby = b.id";
	c.execute(sql);
	cur = c.fetchall()
	database.conn.commit()
	return cur


def checkIfmail(email):
	c = database.conn.cursor()
	sql = "SELECT count(email) from users where email = '%s'"%(email)
	user = []
	c.execute(sql);
	user = c.fetchone()
	if user[0] > 0:
		return {"status":True, "msg":"user exists"}
	else:
		return {"status":False,"msg":"user not found"}


def getFiles(id):
	c = database.conn.cursor()
	sql = "SELECT * from files where uploadby = %d"%(id);
	c.execute(sql)
	data = c.fetchall();
	print(data)
	return data