.print "----------------------create_education_types.sql---------------------"

CREATE TABLE education_types (
    education_types_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT UNIQUE
);