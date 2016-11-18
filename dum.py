import random
import string
from config import database

c = database.conn.cursor()
sql = "SELECT * from users where email='abhijeet@ambab.com' AND username='abhi9920'"
users = []
c.execute(sql)
print("Executing sql")
database.conn.commit()
for r in c.fetchall():
	print(r)
	users.append(r.id)
print(users)

quit()

def random_string(length):
    pool = string.ascii_letters + string.digits
    return ''.join(random.choice(pool) for i in xrange(length))


print(random_string(16))
print(random_string(32))
print(random_string(64))


##########################

import random, string
x = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(16))
print(x)
