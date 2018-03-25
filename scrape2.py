import re
import os
import sys
from provider_files_config import provider_files

import database.types as types_model
import database.subtypes as subtypes_model
import database.providers as providers_model
import database.type_providers as type_providers_model
import database.subtype_types as subtype_types_model

def parse_all_providers(provider_files):
    all_providers = []
    for file in provider_files:
        file_path = os.path.join('./', 'provider_files', file['name'])
        providers = read_and_parse_file(file_path, file['provider_type'], file['provider_subtype'])
        all_providers += providers
    return all_providers

def read_and_parse_file(path, provider_type, provider_subtype):
    file = read_file(path)
    return parse_file(file, provider_type, provider_subtype)

def read_file(path):
    with open(path) as f:
        file = [line for line in f]
    return file

def parse_file(file, provider_type, provider_subtype):
    file_includes_doctor_name = includes_doctor_name(file)
    counter = 0
    providers = []
    data = {}
    for line in file:
        if line == '\n':
            data['type'] = provider_type
            data['subtype'] = provider_subtype
            providers.append(data)
            data = {}
            counter = 0
        else:
            parse_line(line, data, counter, file_includes_doctor_name)
            counter += 1
    return providers

def includes_doctor_name(file):
    if not re.compile(r'\w+').search(file[0]):
        return includes_doctor_name(file[1:])
    else:
        if re.compile(r'^[a-z]+\s[a-z]+(\s[a-z]+)+$', re.IGNORECASE).match(file[0]) and re.compile(r'^[a-z]+\s*\w*', re.IGNORECASE).match(file[1]):
            return True
        else:
            return False

def parse_line(line, data, counter, file_includes_doctor_name):
    if counter == 0:
        if file_includes_doctor_name:
            data['doctor_name'] = parse_doctor_name(line)
        else:
            data['provider_name'] = line.strip()

    elif counter == 1:
        if file_includes_doctor_name:
            data['provider_name'] = line.strip()
        else:
            check_regex(line, data)
    else:
        check_regex(line, data)
    return data

def parse_doctor_name(line):
    names = line.strip().split(' ')
    return ' '.join(names[1:] + [names[0]])

def check_regex(line, data):
    if re.compile('(?i)PO BOX|(?i)p.o. box').match(line):
        return data
    if re.compile(r'^\d+\s\w+').match(line):
        data['street_address'] = line.strip()
    elif re.compile('^STE').match(line):
        if 'street_address' in data:
            data['street_address'] += ' ' + line.strip()
    elif re.compile(r'\s\d{5}$').search(line):
        city, state_and_zip = line.split(',')
        state, zip_code = state_and_zip.strip().split(' ')
        data['city'] = city
        data['state'] = state
        data['zip_code'] = zip_code
    elif re.compile(r'(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}').search(line):
        data['phone'] = line.strip()
    elif re.compile('(?i)Critical access provider').match(line):
        data['critical_access_provider'] = True
    elif re.compile('(?i)Specialty').match(line):
        data['specialty'] = line.replace(':', '').replace('Specialty', '').strip()
    else:
        data['other_info'] = line.strip()
    return data


def insert_into_db(providers):
    counter = 0
    for provider in providers:
        counter += 1
        if counter % 100 == 0:
            print ('loading db: {}'.format(counter))

        # this should be in a transaction... meh
        type_id = types_model.upsert_type(provider)
        subtype_id = subtypes_model.upsert_subtype(provider)
        provider_id = providers_model.upsert_provider(provider)
        providers_model.update_provider(provider, provider_id[0])
        type_providers_model.upsert_type_provider(type_id[0], provider_id[0])
        subtype_types_model.upsert_subtype_type(subtype_id[0], type_id[0])


def main():
    providers = parse_all_providers(provider_files)
    insert_into_db(providers)

if __name__ == '__main__':
    main()
