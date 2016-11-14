from config import database

c = database.conn.cursor()


c.execute("SELECT * FROM users")
database.conn.commit()

# Print the contents of the database.
print([(r[0], r[1]) for r in c.fetchall()])