import os
import sys
import json
import urllib
import base64
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
            attribute, value = parse_line(line, counter)
            data[attribute] = value
            counter += 1
    print providers

def parse_line(line, counter):
    if counter == 0:
        attribute = 'name'
        value = line.strip()

    return [attribute, value]

#         loop over line and regex for data...


#         data['name'] = title
#         data['address1'] = blah1
#         data['address2'] = blah2

#     dentists.append(data)

#     return dentists


# def main():
#     file = read_txt_file('dental_clinic')
#     parse_file(file)

# if __name__ == '__main__':
#     main()

my_file = read_providers_file('./dental_clinic_mn.txt')
parse_file(my_file)