from __future__ import print_function

import argparse
import re
import os

def check_title(notebook):
    ''' Checks that the first line contains a valid title. '''

    # A title is YYYY-MM-DD TITLE
    result1 = re.match(r'#\W\d{4}-\d{2}-\d{2}\W\w+', notebook)
    result2 = re.match(r'\d{4}-\d{2}-\d{2}\W.+\n=+', notebook)
    assert( result2 is not None or result2 is not None), "Title string does not match YYYY-MM-DD TITLE format."
    
    
def check_heading(notebook, heading):
    ''' Checks that heading exists and is properly formatted. '''
    
    # Check that the heading exists and is properly formatted as H1
    result1 = re.match(r'#\s%s' % heading, notebook)
    result2 = re.search('%s\s+-+' % heading, notebook)
    assert( result1 is not None or result2 is not None), "%s heading does not match format." % heading
    
def notebook_good(filename):
    ''' Returns True if notebook format is good and False otherwise.'''
    
    try:
        assert(os.path.isfile(notebookFile)), "Notebook file does not exist"
    except AssertionError, msg:
        print(msg, end="...")
        return False
    
    with open(filename, 'r') as f:
        notebook = f.read()
        
        try:
            check_title(notebook)
            check_heading(notebook, "Purpose")
            check_heading(notebook, "Conclusions")
            check_heading(notebook, "Background")
            check_heading(notebook, "Materials and Equipment")
            check_heading(notebook, "Experimental Protocol")
            check_heading(notebook, "Results")
            check_heading(notebook, "Archived Samples")
            check_heading(notebook, "Archived Computer Data")
        except AssertionError, msg:
            print(msg, end="...")
            return False
        else:
            return True

def extract_title(notebookFile):
    ''' Returns the date and title from a notebook file. '''
    with open(notebookFile, 'r') as f:
        titleLine = f.readline()
        m = re.search(r'(\d{4}-\d{2}-\d{2})\W(.+)', titleLine)
    return m.groups()

if __name__ == "__main__":
    #parser = argparse.ArgumentParser()
    #parser.add_argument("resultsFolder")
    #args = parser.parse_args()
    
    # Extract the folders that are formatted as an experiment
    folderList = filter(lambda x: os.path.isdir(x) and re.search(r'\d{4}-\d{2}-\d{2}.*',x),
                        os.listdir('.') )
    
    with open('toc.md', 'w') as toc:
        for folder in folderList:
            notebookFile = os.path.join(folder,'Notebook.md')
        
            print("Testing %s..." % notebookFile , end="")
            if notebook_good(notebookFile):
                print("PASSED.")
                (nbDate, nbTitle) = extract_title(notebookFile)
                #toc.write("* [%s %s](%s)\n" %(nbDate, nbTitle, 
                #    os.path.abspath(notebookFile) ))
                toc.write("* [%s %s](%s)\n" %(nbDate, nbTitle, notebookFile) )
            else:
                print("FAILED.")
        
        