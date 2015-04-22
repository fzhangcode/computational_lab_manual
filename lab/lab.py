import os
import sqlite3 as lite
import logging
import argparse

# TODO Logging
# TODO Environment Variables

# set logging
logging.basicConfig(filename='lab.log', level=logging.INFO)

# parser = argparse.ArgumentParser()
# parser.add_argument("lab_action", help="What user intends to do", type=str)
# args = parser.parse_args()
# print(args.lab_action)

dbfile = os.getenv('LABDB', None)
if dbfile is None:
    logging.error("Could not locate lab database. Check that LABDB environment variable is set to database location.")


def execute(command):
    ''' Executes a sql command string on the lab database.
    :param command: the sql command string
    :return:
    '''

    # connect to sqlite3 database
    con = lite.connect(dbfile) or None

    with con:
        cursor = con.cursor()
        cursor.execute(command)
    if con:
        con.close()
        
#list all tags
def list_tags():
    execute("SELECT * FROM tags;")

#list all records
def list_records():
    execute("SELECT * FROM records;")

if __name__ == "__main__":

    # Attempt to connect to lab database
    conn = lite.connect(dbfile)
    c = conn.cursor()

    # Create table
    c.execute('''CREATE TABLE stocks
             (date text, trans text, symbol text, qty real, price real)''')

    # Insert a row of data
    c.execute("INSERT INTO stocks VALUES ('2006-01-05','BUY','RHAT',100,35.14)")

    # Save (commit) the changes
    conn.commit()

    # We can also close the connection if we are done with it.
    # Just be sure any changes have been committed or they will be lost.
    conn.close()
    
    
