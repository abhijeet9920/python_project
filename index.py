from bottle import get, post, request, run, template, static_file, redirect, static_file
from classes import controller
import bottle
import bottle_session
import os
import time
import cgi
import re


app = bottle.app()
plugin = bottle_session.SessionPlugin()
app.install(plugin)

@ get('/')
def index(session):
    return template('views/index.tpl')

###################################################################################################

# -- -- -- --Login view for user & POST Login-- -- -- -- -- -- -- -- -- -- -- -- -
@get('/user/login')
def userlogin(session): #Login page
    return template('views/userLogin.tpl')

@ post('/user/login/post')
def postuserlogin(session):
    users = controller.logIn(request, 'user')
    return users


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
    name = request.GET.get('fname') if request.GET.get('fname') else '';
    files = controller.getFiles(name);
    return template('views/userSearch.tpl', files = files)


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
    return users


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
    if session['msg'] != ''and session['clsname'] != '':
        msg = session['msg']
        classname = session['clsname']
        session['status'] = ''
        session['msg'] = ''
    else :
        msg = ''
        classname = ''
    return template('views/uploaddata.tpl', classname = classname, msg = msg)

@ post('/owner/upload')
def postupload(session):
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
    filesv = controller.saveFile(file_path, 1, keywords)# upload.save(file_path)
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


#################################################################################################
#You can configure host, port and debug as per your requirements
bottle.debug(True)
# host = os.getenv("HOST", '0.0.0.0')
# port = os.getenv("PORT", 5000)
port = os.getenv("PORT", 8000)
host = os.getenv("HOST", 'localhost')
run(host = host, port = port, debug = True)