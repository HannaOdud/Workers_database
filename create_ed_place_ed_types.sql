.print "----------------------create_ed_place_ed_types.sql-----------------------"


CREATE TABLE ed_place_ed_types (
    ed_place_id INTEGER,
    education_types_id INTEGER,
    FOREIGN KEY (ed_place_id) REFERENCES education_places(ed_place_id),
    FOREIGN KEY (education_types_id) REFERENCES education_types(education_types_id)

);