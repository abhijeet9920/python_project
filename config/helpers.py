import random
import string

def random_string(length):
    pool = string.ascii_uppercase + string.ascii_lowercase + string.digits
    return ''.join(random.choice(pool) for i in range(length))


def sendMails():
	return "Mail sent. Check your inbox"