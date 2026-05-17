.print "----------------------create_persons.sql---------------------"

CREATE TABLE persons (
    person_id INTEGER,
    full_name TEXT UNIQUE,
    age INTEGER,
    gender TEXT,
    work_status TEXT,
    education_type_id INTEGER,
    address_id INTEGER,
    FOREIGN KEY (education_type_id) REFERENCES education_types(education_type_id),
    FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);