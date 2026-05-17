.print "----------------------create_education_places.sql---------------------"

CREATE TABLE education_places(
    ed_place_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR UNIQUE,
    address_id INTEGER,
    FOREIGN KEY (address_id) REFERENCES addresses(address_id)

);