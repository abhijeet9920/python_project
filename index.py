from bottle import get, post, request, run, template, static_file, redirect
from classes import controller
import bottle
import bottle_session
import os
import time




app = bottle.app()
plugin = bottle_session.SessionPlugin()
app.install(plugin)

@get('/')
def index(session):
    return template('views/index.tpl')

#############################################
#----Registration & Login Routes-------------
#############################################

###Normal User
@get('/user/login')
def userlogin(session):
    #Login page
    return template('views/userLogin.tpl')

@get('/user/register')
def userreg(session):
    #Login page
    if session['msg'] != '' and session['status'] != '':
    	msg = session['msg']
    	classs = session['status']
    	session['status'] = ''
    	session['msg'] = ''
    else:
    	msg = ''
    	classs = ''
    return template('views/userRegistration.tpl', classname=classs, msg=msg)

@post('/user/post')
def postuserreg(session):
	users = controller.insertUser(request, 'user')
	session['status'] = users['status']
	session['msg'] = users['msg']
	redirect('/user/register')

@post('/user/login/post')
def postuserlogin(session):
	users = controller.logIn(request, 'user')
	return users

@get('/user/findfile')
def find(session):
	return template('views/userSearch.tpl')




###Data owner 
@get('/owner/login')
def ownerlogin(session):
    #Login page
    return template('views/dataLogin.tpl')

@get('/owner/register')
def ownerreg(session):
    #Login page
    if session['msg'] != '' and session['status'] != '':
    	msg = session['msg']
    	classs = session['status']
    	session['status'] = ''
    	session['msg'] = ''
    else:
    	msg = ''
    	classs = ''
    return template('views/dataownerRegistration.tpl', classname=classs, msg=msg)

@post('/owner/post')
def postownerreg(session):
    users = controller.insertUser(request, 'dataowner')
    session['status'] = users['status']
    session['msg'] = users['msg']
    redirect('/owner/register')

@post('/owner/login/post')
def postownerlogin(session):
    users = controller.logIn(request, 'dataowner')
    return users

@get('/owner/upload')
def showuploadpage(session):
	return template('views/uploaddata.tpl')

@post('/owner/upload')
def postupload(session):
	title = request.forms.get('title')
	keywords = request.forms.get('keywords')
	upload = request.files.get('documents')
	name, ext = os.path.splitext(upload.filename)
	if title != "":
		fname = "%s%s"%(title,ext)
	else:
		fname = upload.filename
	fname = "%s_%s"%(time.strftime('%Y-%m-%d_%H:%M:%S'),fname)
	save_path = "%s/uploads"%(os.getcwd())
	if not os.path.exists(save_path):
		os.makedirs(save_path)
	file_path = "{path}/{file}".format(path=save_path, file=fname)
	upload.save(file_path)
	filesv = controller.saveFile(file_path,1, keywords)
	return filesv


#Generate secret key
@post('/getkey')
def sendkey(session):
    secret = controller.sendSecret(request)
    return secret



#You can configure host, port and debug as per your requirements
bottle.debug(True)
port = os.getenv("PORT", 8000)
run(host='localhost', port=8000, debug=True)