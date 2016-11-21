from bottle import get, post, request, run, template
from classes import controller
import bottle
import bottle_session

app = bottle.app()
plugin = bottle_session.SessionPlugin()
app.install(plugin)


@get('/seesession')
def index(session):
    user_name = session.get('name')
    if user_name is not None:
        return "Hello, %s"%user_name
    else:
        return "I don't recognize you."

@get('/set/:user_name')
def set_name(session,user_name=None):
    if user_name is not None:
        session['name']=user_name
        return "I recognize you now."
    else:
        return "What was that?"

@get('/clearsession')
def index(session):
    session['name']='';
    return "You are logged out"


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
    return template('views/userRegistration.tpl')

@post('/user/post')
def index(session):
	users = controller.insertUser(request, 'user')
	return users 

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