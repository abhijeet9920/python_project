from config import database
#from Crypto.Cipher import AES
from Crypto.Hash import MD5
from config import helpers


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
	query = 'INSERT INTO users values (NULL, "%s", "%s","%s", "%s", "%s", "%s", "%s", "%s")'%(fname,lname,utype,address,phone,email, uname, pwd)
	#print(query)
	c.execute(query)
	database.conn.commit()
	return "New user added successfully"


def sendSecret(req):
	uname = req.forms.get('username');
	email = req.forms.get('email');
	secret = helpers.random_string(64)
	c = database.conn.cursor()
	sql = "SELECT id from users where email='%s' AND username='%s'"%(email,uname)
	users = []
	c.execute(sql)
	database.conn.commit()
	users = c.fetchone()
	if users:
		uid = users[0]
		if uid != 0:
			msg ={"status":"success", "message": "User is found"}
		else:
			msg ={"status":"failed", "message": "Please provide correct email and username combination"}
	else:
		msg = {"status":"failed","message":"Invalid user"}
	return msg