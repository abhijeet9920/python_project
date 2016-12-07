from bottle import get, post, request, run, template, static_file, redirect, static_file
from classes import controller
import bottle
import bottle_session
import os
import time
import cgi
import re
from beaker.middleware import SessionMiddleware

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': './data',
    'session.auto': True
}

sesapp = SessionMiddleware(bottle.app(), session_opts)


app = bottle.app()
plugin = bottle_session.SessionPlugin()
app.install(plugin)

@ get('/')
def index():
    session = bottle.request.environ.get('beaker.session')
    print(session.get('logged'));
    if session.get('logged'):
        return template('views/index.tpl', session=session.get('logged'))
    else:
        return template('views/index.tpl', session='')

###################################################################################################

# -- -- -- --Login view for user & POST Login-- -- -- -- -- -- -- -- -- -- -- -- -
@get('/user/login')
def userlogin(session): #Login page
    return template('views/userLogin.tpl')

@ post('/user/login/post')
def postuserlogin():
    users = controller.logIn(request, 'user')
    s = bottle.request.environ.get('beaker.session')
    s['logged'] = users
    s.save()
    redirect('/')


#-- -- -- --Register view for user & POST register save-- -- -- -- -- -- -- -- -- -- --
@get('/user/register')
def userreg(session): #Login page
    if session['msg'] != '' and session['status'] != '':
        msg = session['msg']
        classs = session['status']
        session['status'] = ''
        session['msg'] = ''
    else :
        msg = ''
        classs = ''
    return template('views/userRegistration.tpl', classname = classs, msg = msg)


@ post('/user/post')
def postuserreg(session):
    users = controller.insertUser(request, 'user')
    session['status'] = users['status']
    session['msg'] = users['msg']
    redirect('/user/register')


# -- -- -- -- -- -Search file-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
@get('/user/findfile')
def find(session):
    login = bottle.request.environ.get('beaker.session')
    if login.get('logged'):
        name = request.GET.get('fname') if request.GET.get('fname') else '';
        files = controller.getFilesforsearch(name);
        user = login.get('logged')
        return template('views/userSearch.tpl', files = files, session=user)
    else:
        redirect('/user/login')


# -- -- -- -- -- -- -- -Download searched files-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
@post('/download')
def downloafile():
    name = request.forms.get('name')
    path = request.forms.get('path')
    newpath = path.split(name);
    try:
        return static_file(name, root = newpath[0], download = name)
    except:
        return {
            "status": "failed",
            "msg": "File not found"
        };

###################################################################################################

#-- -- -- --Login view for owner & POST Login-- -- -- -- -- -- -- -- -- --
@get('/owner/login')
def ownerlogin(session): #Login page
    return template('views/dataLogin.tpl')


@ post('/owner/login/post')
def postownerlogin(session):
    users = controller.logIn(request, 'dataowner')
    s = bottle.request.environ.get('beaker.session')
    s['logged'] = users
    s.save()
    redirect('/')


#-- -- -- --Register view for owner & POST register save-- -- -- -- -- -- -- -- -- -- --
@get('/owner/register')
def ownerreg(session): #Login page
    if session['msg'] != '' and session['status'] != '':
        msg = session['msg']
        classs = session['status']
        session['status'] = ''
        session['msg'] = ''
    else :
        msg = ''
        classs = ''
    return template('views/dataownerRegistration.tpl', classname = classs, msg = msg)


@ post('/owner/post')
def postownerreg(session):
    users = controller.insertUser(request, 'dataowner')
    session['status'] = users['status']
    session['msg'] = users['msg']
    redirect('/owner/register')


# -- -- -- --Upload view for owner & POST upload-- -- -- -- -- -- -- -- -- -- --
@get('/owner/upload')
def showuploadpage(session):
    login = bottle.request.environ.get('beaker.session')
    if login.get('logged'):
        if session['msg'] != ''and session['clsname'] != '':
            msg = session['msg']
            classname = session['clsname']
            session['status'] = ''
            session['msg'] = ''
        else :
            msg = ''
            classname = ''
        user = login.get('logged')
        files = controller.getFiles(user['id'])
        print(files);
        return template('views/uploaddata.tpl', classname = classname, msg = msg, login=user, files=files)
    else:
        redirect('/owner/login')

@ post('/owner/upload')
def postupload(session):
    login = bottle.request.environ.get('beaker.session')
    loggeduser = login.get('logged');
    title = request.forms.get('title')
    keywords = request.forms.get('keywords')
    upload = request.files.get('documents')
    name, ext = os.path.splitext(upload.filename)
    if title != "":
        fname = "%s%s" % (title, ext)
    else :
        fname = upload.filename
    fname = "%s_%s" % (time.strftime('%Y-%m-%d_%H:%M:%S'), re.sub(r"\s+", '-', fname))
    save_path = "%s/uploads" % (os.getcwd())
    if not os.path.exists(save_path):
        os.makedirs(save_path)
    file_path = "{path}/{file}".format(path = save_path, file = fname)
    upload.save(file_path)
    filesv = controller.saveFile(file_path, loggeduser['id'], keywords)# upload.save(file_path)
    session['clsname'] = filesv['class']
    session['msg'] = filesv['msg']
    redirect('/owner/upload')

#################################################################################################
#-- -- -- -- -Generate secret key-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
@post('/getkey')
def sendkey(session):
    secret = controller.sendSecret(request)
    return secret

#################################################################################################

#-- -- -- -- -- -- --Show loader gif only for ajax purpose-- -- -- -- -- -- -- -- -- -- -- -- -
@get('/loader')
def showloader():
    return static_file('loader.gif', root = os.getcwd());

@post('/checkemail')
def checkIfexist():
    email = request.forms.get('email')
    exists = controller.checkIfmail(email)
    return exists


@get('/logout')
def logout():
    session = bottle.request.environ.get('beaker.session')
    session.delete()
    redirect('/')



#################################################################################################
#You can configure host, port and debug as per your requirements
bottle.debug(True)
host = os.getenv("HOST", '0.0.0.0')
port = os.getenv("PORT", 5000)
# port = os.getenv("PORT", 8000)
# host = os.getenv("HOST", 'localhost')
run(app=sesapp ,host = host, port = port, debug = True)