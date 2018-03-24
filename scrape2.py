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
    if re.compile('(?i)PO BOX|(?i)p.o. box').match(line):
        print ('it\'s a po box')
        return data
    if re.compile('^STE').match(line):
        data['street_address'] += ' ' + line.strip()
    if re.compile(r'\s\d{5}$').search(line):
        city, state, zip_code = line.replace(',', '').split(' ')
        data['city'] = city
        data['state'] = state
        data['zip_code'] = zip_code
    if re.compile(r'(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}').search(line):
        data['phone'] = line.strip()
    if re.compile('(?i)Critical access provider').match(line):
        data['critical_access_provider'] = True
    else:
        print ('no match on ' + line)
        return data
    print (data)
    return data


    # handle other regex matching

# my_file = read_providers_file('./dental_clinic_mn.txt')
# parse_file(my_file)

check_regex('MINNETONKA, MN 55305', {})
check_regex('(952) 935-8420', {})
check_regex('P.o. BOX 209', {})
check_regex('critical access provider', {})