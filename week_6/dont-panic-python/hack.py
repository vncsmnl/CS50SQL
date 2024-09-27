from cs50 import SQL

# Connect to the SQLite database
db = SQL("sqlite:///dont-panic.db")

# Prompt the user to enter a new password
password = input("Enter a password: ")

# Update the administrator's password using a prepared statement
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)

print("Hacked!")
