import cgitb
cgitb.enable()

# Connect to the database.
import pymysql

conn = pymysql.connect(
    db='remilda',
    user='root',
    passwd='root',
    host='localhost'
)

# c = conn.cursor()