from bottle import get, post, request, run, template, redirect
from classes import controller
import bottle
import bottle_session

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
def index(session):
    #Login page
    return template('views/userLogin.tpl')

@get('/user/register')
def index(session):
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
def index(session):
	users = controller.insertUser(request, 'user')
	session['status'] = users['status']
	session['msg'] = users['msg']
	redirect('/user/register')

@post('/user/login/post')
def index(session):
    return "User login" 


###Data owner 
@get('/owner/login')
def index(session):
    #Login page
    return template('views/dataLogin.tpl')

@get('/owner/register')
def index(session):
    #Login page
    return template('views/dataownerRegistration.tpl')

@post('/owner/post')
def index(session):
    users = controller.insertUser(request, 'dataowner')
    return users

@post('/owner/login/post')
def index(session):
    return "Owner login"


#Generate secret key
@post('/getkey')
def index(session):
    secret = controller.sendSecret(request)
    return secret

#You can configure host, port and debug as per your requirements
bottle.debug(True)
run(host='localhost', port=8000, debug=True)