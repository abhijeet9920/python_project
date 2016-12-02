import random
import string
from config import mails
import sendgrid
import os
from sendgrid.helpers.mail import *

def random_string(length):
    pool = string.ascii_uppercase + string.ascii_lowercase + string.digits
    return ''.join(random.choice(pool) for i in range(length))


def sendMail(to_addr_list, subject, message):
    sg = sendgrid.SendGridAPIClient(apikey=mails.apikey)
    from_email = Email("test@example.com")
    subject = "Hello World from the SendGrid Python Library!"
    try:
        to_email = Email(to_addr_list)
        content = Content("text/html", message)
        mail = Mail(from_email, subject, to_email, content)
        response = sg.client.mail.send.post(request_body=mail.get())
        print(response.status_code)
        print(response.body)
        print(response.headers)
        return {"status":"success", "message":"A secret key is sent, Please check your mail", "code":response.status_code, "body":response.body}
    except Exception as e:
        return {"status":"fail","message":"Failed to send key, invalid mail setup"}