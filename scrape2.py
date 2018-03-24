import os
import sys
import json
import urllib
import base64
import re
# import requests

def read_providers_file(path):
    # read file..
    providers_file = open(path)
    return providers_file

def parse_file(file):
    counter = 0
    providers = []
    data = {}
    for line in file:
        if line == '\n':
            providers.append(data)
            data = {}
            counter = 0
        else:
            if parse_line(line, counter):
                attribute, value = parse_line(line, counter)
                data[attribute] = value
            counter += 1
    return providers

def parse_line(line, counter):
    if counter == 0:
        attribute = 'name'
    elif counter == 1:
        attribute = 'street_address'
    elif counter == 2:
        attribute = 'city/state/zip'
    elif counter == 3:
        attribute = 'phone'
    else:
        attribute = 'something else'
    value = line.strip()
    return [attribute, value]

def check_regex(line, data):
    if re.compile('PO BOX|p.o. box').match(line):
        return data
    if re.compile('^STE').match(line):
        data['street_address'] += ' ' + line.strip()
    if re.compile('\s\d{5}$').match(line):
        city, state, zip_code = line.replace(',', '').split(' ')
        data['city'] = city
        data['state'] = state
        data['zip_code'] = zip_code
    else:
        print ('no match')
        return data
    print (data)
    return data


    # handle other regex matching

# my_file = read_providers_file('./dental_clinic_mn.txt')
# parse_file(my_file)

check_regex('MINNETONKA, MN 55305', {})