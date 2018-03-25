# todo frontend
  main page template
  add map to front
  add search(?)
  add googleapi call

# todo backend
  add doc name(?)
  fix issue w/ missing address

* get providers by type
select p.*, t.* from providers p
inner join type_providers tp on p.id = tp.provider_id
inner join types t on t.id = tp.type_id
where t.type ilike 'Dental'
and city ilike 'minneapolis'

* get providers by subtype
select p.*, s.*
from providers p
inner join type_providers tp on p.id = tp.provider_id
inner join types t on t.id = tp.type_id
inner join subtype_types st on st.type_id = t.id
inner join subtypes s on s.id = st.subtype_id
where t.type ilike 'Dental'
and city ilike 'minneapolis'


* existing type_ids from system
3 - Anesthesiology
4 - Audiology Services
105 - Autism - Early Intensive Developmental Behavioral Intervention
102 - Billing Services
6 - Chemical Dependency Treatment Services
7 - Child &amp; Teen Checkup Clinic
10 - Chiropractic Services
100 - Clinics
101 - Day Training &amp; Habilitation (DT&amp;H)
11 - Dental
17 - Emergency Medical
19 - Family Planning Services
23 - Home and Community Based Services (general)
24 - Home Health Care
25 - Hospice Providers
26 - Hospital
28 - Indian Health Service
29 - Individual Education Plan/School Districts
31 - Intermediate Care Facility/DD
32 - Long Term Care
33 - Medical Specialties
34 - Medical Specialties/Durable Medical Equipment
35 - Mental Health
42 - Nursing Services
103 - Nutrition Services
44 - Occupational Therapist
47 - Optical Services
53 - Pathology &amp; Lab
56 - Personal Care Services
57 - Pharmacy
59 - Physical Therapy
61 - Physician Assistants
60 - Physician Services
62 - Podiatrist
64 - Private Duty Nursing Services
69 - Regional Treatment Center
70 - Rehabilitation Agency
71 - Renal Dialysis Services
73 - Special Transportation
74 - Speech Pathologist
75 - Surgery
77 - Waiver Service Providers
