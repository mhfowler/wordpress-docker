#!/usr/bin/python

import sys, re

wpconfigfilename = sys.argv[1]

with open(wpconfigfilename, "r") as f:
    matches =  [l for l in f.readlines() if re.match(".*table_prefix.*", l)] 

    if(len(matches) > 0):

        m = re.search(".*table_prefix.*=.*'(.*)'", matches[0])

        print(m.groups(0)[0])


    
