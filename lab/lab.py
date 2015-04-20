import sqlite3 as lite
import logging
import argparse

#TODO Logging
#TODO Environment Variables

#set logging 
logging.basicConfig(filename='lab.log', level=logging.INFO)

parser = argparse.ArgumentParser()
parser.add_argument("lab_action", help="What user intends to do", type = str) 	
args = parser.parse_args()	
print(args.lab_action)		



def execute(command):
    # start with con, in case connection can't be made
    con = None
    #attempt connection
    con = lite.connect('C:/sqlite/lab_db.db')
    with con:
        cursor = con.cursor()
        cursor.execute(command)
    if con:
        con.close()
     