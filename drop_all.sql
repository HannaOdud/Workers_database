.print "----------------------drop_all.sql---------------------------------------"


PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS education_types;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS education_places;
DROP TABLE IF EXISTS persons_jobs;
DROP TABLE IF EXISTS persons_educ_places;
DROP TABLE IF EXISTS ed_place_ed_types;

PRAGMA foreign_keys = ON;