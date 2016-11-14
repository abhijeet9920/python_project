import cgitb
cgitb.enable()

# Connect to the database.
import pymysql

conn = pymysql.connect(
    db='remilda',
    user='root',
    passwd='root',
    host='localhost')

c = conn.cursor()

c.execute("SELECT * FROM users")
conn.commit()

# Print the contents of the database.
print([(r[0], r[1]) for r in c.fetchall()])
