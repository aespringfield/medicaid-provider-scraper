import os
import sys
import json
import urllib
import base64
import requests

def search_twitter(path):
    # read file..


def parse_file(file):
    counter = 0
    dentists = []
    data = {}
    for each line in file:


        loop over line and regex for data...


        data['name'] = title
        data['address1'] = blah1
        data['address2'] = blah2

    dentists.append(data)

    return dentists


def main():
    file = read_txt_file('dental_clinic')
    parse_file(file)

if __name__ == '__main__':
    main()
