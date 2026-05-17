.print "----------------------create_addresses.sql---------------------"

CREATE TABLE addresses(
    address_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country TEXT,
    region TEXT,
    city TEXT,
    street_building VARCHAR,
    postcode VARCHAR

);