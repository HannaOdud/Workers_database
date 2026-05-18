.print "----------------------create_persons.sql---------------------------------"


CREATE TABLE persons (
    person_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT UNIQUE,
    age INTEGER,
    gender TEXT,
    work_status TEXT,
    education_types_id INTEGER,
    address_id INTEGER,
    FOREIGN KEY (education_types_id) REFERENCES education_types(education_types_id),
    FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);