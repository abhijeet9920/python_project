from config import database
#from Crypto.Cipher import AES
from Crypto.Hash import MD5


def getUsers():
	c = database.conn.cursor()
	c.execute("SELECT * FROM users")
	database.conn.commit()
	data = []
	for r in c.fetchall():
		data.append(r)
	return data


def insertUser(req):
	fname = req.forms.get("fname")
	lname = req.forms.get("lname")
	address = req.forms.get("address")
	phone = req.forms.get("phone")
	email = req.forms.get("email")
	uname = req.forms.get("uname")
	pwd = req.forms.get("pwd")
	c = database.conn.cursor()
	query = 'INSERT INTO users values (NULL, "%s", "%s", "%s", "%s", "%s", "%s", "%s")'%(fname,lname,address,phone,email, uname, pwd)
	#print(query)
	c.execute(query)
	database.conn.commit()
	return "New user added successfully"