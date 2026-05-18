.print "----------------------create_jobs.sql------------------------------------"


CREATE TABLE jobs (
    job_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    education_types_id INTEGER,
    salary INTEGER,
    company_id INTEGER,
    address_id INTEGER,
    FOREIGN KEY (education_types_id) REFERENCES education_types(education_types_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);