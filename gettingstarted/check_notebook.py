#!/usr/bin/python
# Filename: check_notebook.py
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
    
    with open(args.filename, 'r') as f:
        notebook = f.read()
        
        check_title(notebook)
        check_heading(notebook, "Purpose")
        check_heading(notebook, "Conclusions")
        check_heading(notebook, "Background")
        check_heading(notebook, "Materials and Equipment")
        check_heading(notebook, "Experimental Protocol")
        check_heading(notebook, "Results")
        check_heading(notebook, "Archived Samples")
        check_heading(notebook, "Archived Computer Data")
    return True
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("filename")
    args = parser.parse_args()
    
    print("Testing %s..." % args.filename, end="")
    if notebook_good(args.filename) is True:
        print("PASSED.")
    else:
        print("FAILED.")
        
    