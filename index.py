from bottle import get, post, request, run, template
from classes import controller


@get('/')
def index():
    #Home page
    return template('views/index.tpl')

#############################################
#----Registration & Login Routes-------------
#############################################

###Normal User
@get('/user/login')
def index():
    #Login page
    return template('views/userLogin.tpl')

@get('/user/register')
def index():
    #Login page
    return template('views/userRegistration.tpl')

@post('/user/post')
def index():
	users = controller.insertUser(request, 'user')
	return users 

@post('/user/login/post')
def index():
    return "User login" 


###Data owner 
@get('/owner/login')
def index():
    #Login page
    return template('views/dataLogin.tpl')

@get('/owner/register')
def index():
    #Login page
    return template('views/dataownerRegistration.tpl')

@post('/owner/post')
def index():
    users = controller.insertUser(request, 'dataowner')
    return users

@post('/owner/login/post')
def index():
    return "Owner login"


#You can configure host, port and debug as per your requirements
run(host='localhost', port=8000, debug=True)