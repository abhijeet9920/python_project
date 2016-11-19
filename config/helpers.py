import random
import string
from config import mails


def random_string(length):
    pool = string.ascii_uppercase + string.ascii_lowercase + string.digits
    return ''.join(random.choice(pool) for i in range(length))


def secretKeyMail(to_addr_list, subject, message):
    from_addr = mails.sender
    msg = "From: %s\nTo: %s\nSubject: %s\n\n%s"%(from_addr, to_addr_list, subject, message)
    server = mails.smtplib.SMTP(mails.server)
    server.starttls()
    try:
	    server.login(mails.username, mails.password)
	    msg = "From: %s\nTo: %s\nSubject: %s\n\n%s"%(from_addr, to_addr_list, subject, message)
	    server.sendmail(from_addr, to_addr_list, msg)
	    server.quit()
	    return {"status":"success", "message":"A secret key is sent, Please check your mail"}
    except Exception as e:
    	return {"status":"fail","message":"Failed to send key, invalid SMTP setup"}