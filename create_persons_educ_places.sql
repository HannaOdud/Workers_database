.print "----------------------create_persons_educ_places.sql---------------------"

CREATE TABLE persons_educ_places (
    person_id INTEGER,
    ed_place_id INTEGER,
    FOREIGN KEY (person_id) REFERENCES persons(person_id),
    FOREIGN KEY (ed_place_id) REFERENCES education_places(ed_place_id),
);