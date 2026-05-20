.print "----------------------create_persons_jobs.sql----------------------------"


CREATE TABLE persons_jobs (
    person_id INTEGER,
    job_id INTEGER,
    FOREIGN KEY (person_id) REFERENCES persons(person_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)

);