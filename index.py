from bottle import get, post, request, run, template
from classes import controller


@get('/')
def index():
    #Home page
    return template('views/index.tpl')

############################################################################

@get('/user/login')
def index():
    #Login page
    return template('views/userLogin.tpl')

############################################################################

@get('/user/register')
def index():
    #Login page
    return template('views/userRegistration.tpl')

############################################################################

@post('/user/post') # or @route('/user/post', method='POST')
def index():
	users = controller.insertUser(request, 'user')
	return users 

############################################################################


@get('/owner/login')
def index():
    #Login page
    return template('views/dataLogin.tpl')

############################################################################

@get('/owner/register')
def index():
    #Login page
    return template('views/dataownerRegistration.tpl')

############################################################################

@post('/owner/post') # or @route('/user/post', method='POST')
def index():
    users = controller.insertUser(request, 'dataowner')
    return users

############################################################################

#You can configure host, port and debug as per your requirements
run(host='localhost', port=8000, debug=True)