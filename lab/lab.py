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
        

def list_tags():
    ''' Executes a sql command string on the tag table in the database.
    :param command: 
    :return: All elements in the tags table
    '''
    execute("SELECT * FROM tags;")

#list all records
def list_records():
    ''' Executes a sql command string on the records table in the database.
    :param command: 
    :return: All elements in the records table
    '''
    execute("SELECT * FROM records;")

#Search for all files with a tag
def search_files_given_tag(tag):
    ''' Searches and returns all files associated with given tag
    :param command: tag (files associated with)
    :return: All files associate with tag
    '''
    record_key_list = []
    final_list = []
    # start with con, in case connection can't be made
    con = None

    #attempt connection, ENV VARIABLE***
    con = lite.connect('C:/sqlite/lab_db.db')    
    with con:
        #Get the tags key
        cursor = con.cursor()    
        cursor.execute("SELECT key FROM tags WHERE text = '%s'" % tag)
        tag_key = cursor.fetchall()
        key_parsed = tag_key[0][0]

        # Go to record_tag table
        cursor.execute("SELECT record_key FROM record_tag WHERE tag_key = %d" % key_parsed)
        record_keys_found = cursor.fetchall()
        ## get all the files with that key
        for i in range(len(record_keys_found)):
            key_to_append = record_keys_found[i][0]
            record_key_list.append(key_to_append)
   
        ##Use the record key to find the record
        for record in range(len(record_key_list)):
            cursor.execute("SELECT location FROM records WHERE key = %d" % record_key_list[record])
            final = cursor.fetchall()
            final_list.append(final) 

        #p\Print results
        print "\nSearch results"
        for result in final_list:
            print str(result)

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
    
    
