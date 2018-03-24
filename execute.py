from scrape2 import read_and_parse_file
import os

provider_files = [
    {
        'name':          'acupuncture_acupuncture_services.txt',
        'provider_type':      'Acupuncture',
        'provider_subtype':   'Acupuncture Services'

    },
    {
        'name':          'chiropractic_services_chiropractic_services.txt',
        'provider_type':      'Chiropractic Services',
        'provider_subtype':   'Chiropractic Services'

    },
    {
        'name':          'clinics_clinics.txt',
        'provider_type':      'Clinics',
        'provider_subtype':   'Clinics'

    },
    {
        'name':          'clinics_clinics.txt',
        'provider_type':      'Clinics',
        'provider_subtype':   'Clinics'

    },
    {
        'name':          'clinics_primary_resources_sliding_fee.txt',
        'provider_type':      'Clinics',
        'provider_subtype':   'Primary Resources Sliding Fee'

    },
    {
        'name':          'dental_dental_clinic.txt',
        'provider_type':      'Dental',
        'provider_subtype':   'Dental Clinic'

    },
    {
        'name':          'mental_health_mental_health_therapists.txt',
        'provider_type':      'Mental Health',
        'provider_subtype':   'Mental Health Therapists'

    },
    {
        'name':          'mental_health_psychiatry.txt',
        'provider_type':      'Mental Health',
        'provider_subtype':   'Psychiatry'

    },
    {
        'name':          'physical_therapy_physical_therapist.txt',
        'provider_type':      'Physical Therapy',
        'provider_subtype':   'Physical Therapist'

    },
]

def parse_all_providers(provider_files):
    all_providers = []
    for file in provider_files:
        file_path = os.path.join('./', 'provider_files', file['name'])
        providers = read_and_parse_file(file_path, file['provider_type'], file['provider_subtype'])
        all_providers += providers
    return all_providers

print (parse_all_providers(provider_files))