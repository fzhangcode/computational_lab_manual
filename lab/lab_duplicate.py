import sqlite3 as lite
import logging
import argparse
import os

#TODO Logging
#TODO Environment Variables

#set logging 
logging.basicConfig(filename='lab.log', level=logging.INFO)

#parser = argparse.ArgumentParser()
#parser.add_argument("lab_action", help="What user intends to do", type = str) 	
#args = parser.parse_args()	
#print(args.lab_action)		



#Allow user to execute sqlite command
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
     
#Add a data file to records table
def add_data_file(file):
    execute("INSERT INTO records(")
    execute(
#Add a tag to tag table

#Add a link to record_tag

#Search for all files with a tag
def search_files_given_tag(tag):
    # start with con, in case connection can't be made
    con = None

    #attempt connection, ENV VARIABLE***
    con = lite.connect('C:/sqlite/lab_db.db')    
    with con:
        cursor = con.cursor()    
        cursor.execute("SELECT key FROM tags WHERE text = '%s'" % tag)
        tag_key = cursor.fetchall()
        key_parsed = tag_key[0][0]

        # Go to relational table
        cursor.execute("SELECT record_key FROM record_tag WHERE tag_key = %d" % key_parsed)
        record_keys_found = cursor.fetchall()
        ## get all the files with that key
        for i in range(len(record_keys_found)):
            key_to_append = record_keys_found[i][0]
            record_key_list.append(key_to_append)
   
        ##Find records
        for record in range(len(record_key_list)):
            animal_search = cursor.execute("SELECT location FROM records WHERE key = %d" % record_key_list[animal])
            final = cursor.fetchall()
            final_list.append(final) 

        #print results
        print "\nSearch results"
        for result in final_list:
            print str(result)


#Search for all tags given a record

#list all tags
def list_tags():
    execute("SELECT * FROM tags;")

#list all records
def list_records():
    execute("SELECT * FROM records;")