.print "----------------------create_ed_place_ed_type.sql---------------------"

CREATE TABLE ed_place_ed_type (
    ed_place_id INTEGER,
    education_type_id INTEGER,
    FOREIGN KEY (ed_place_id) REFERENCES education_places(ed_place_id),
    FOREIGN KEY (education_type_id) REFERENCES education_types(education_type_id)

);
