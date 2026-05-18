.print "----------------------top_level.sql--------------------------------------"


.read drop_all.sql

.read create_companies.sql
.read create_addresses.sql
.read create_education_types.sql
.read create_jobs.sql
.read create_persons.sql
.read create_education_places.sql
.read create_persons_jobs.sql
.read create_persons_educ_places.sql
.read create_ed_place_ed_types.sql

.read load_companies.sql
.read load_addresses.sql
.read load_education_types.sql
.read load_jobs.sql
.read load_persons.sql
.read load_education_places.sql
.read load_persons_jobs.sql
.read load_persons_educ_places.sql
.read load_ed_place_ed_types.sql



.read report.sql