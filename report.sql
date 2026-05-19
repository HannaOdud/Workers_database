.print "----------------------report.sql-----------------------------------------"

.mode box

.print "0.  Show the schema "
--.schema
.print "1.  Which persons are currently employed and what jobs do they have?"
SELECT persons.full_name, persons.work_status, jobs.title 
FROM persons_jobs
JOIN jobs ON jobs.job_id = persons_jobs.job_id
JOIN persons ON persons.person_id = persons_jobs.person_id;


.print "2.  Which companies employ the most people?"
SELECT COUNT(persons.person_id)AS tot_employees, companies.title
FROM companies
JOIN jobs ON jobs.company_id = companies.company_id
JOIN persons_jobs ON persons_jobs.job_id = jobs.job_id
JOIN persons ON persons.person_id = persons_jobs.person_id
GROUP BY companies.company_id
ORDER BY tot_employees DESC;


.print "3.  What is the average salary for each profession (education type)?"
SELECT AVG(jobs.salary)AS avg_salary, education_types.title
FROM jobs
JOIN education_types ON education_types.education_types_id = jobs.education_types_id
GROUP BY education_types.education_types_id;


.print "4.  How many persons live in each city?"
SELECT COUNT(persons.person_id)AS tot_person, addresses.city
FROM addresses 
JOIN persons ON persons.address_id = addresses.address_id
GROUP BY addresses.city
--GROUP BY addresses.address_id
ORDER BY tot_person DESC;


.print "5.  Which students study at each education place?"
SELECT  persons.full_name, persons.work_status,education_places.title
FROM persons
JOIN persons_educ_places ON persons_educ_places.person_id = persons.person_id
JOIN education_places ON education_places.ed_place_id = persons_educ_places.ed_place_id
WHERE persons.work_status = 'Student';


.print "6.  Which professions can be studied at each education place?"
SELECT education_types.title, education_places.title, addresses.country, addresses.city
FROM education_places
JOIN ed_place_ed_types ON ed_place_ed_types.ed_place_id = education_places.ed_place_id
JOIN education_types ON education_types.education_types_id = ed_place_ed_types.education_types_id
JOIN addresses ON addresses.address_id = education_places.address_id
ORDER BY education_places.title;


SELECT education_types.title, education_places.title
FROM addresses
JOIN education_places ON education_places.address_id = addresses.address_id
JOIN ed_place_ed_types ON ed_place_ed_types.ed_place_id = education_places.ed_place_id
JOIN education_types ON education_types.education_types_id = ed_place_ed_types.education_types_id;


.print "7.  Which jobs offer a salary higher than the average salary of all jobs?"
SELECT title, salary
FROM jobs
WHERE (SELECT AVG(salary) FROM jobs) < salary;


.print "8.  Which persons are currently unemployed?"
SELECT  full_name, work_status
FROM persons
WHERE work_status = 'Unemployed';

.print "9.  How many jobs are available in each country?"
SELECT COUNT(jobs.job_id)AS tot_job, addresses.country
FROM jobs
JOIN addresses ON addresses.address_id = jobs.address_id
GROUP BY addresses.country
ORDER BY tot_job desc;

.print "10. How many persons have each profession (education type)?"
SELECT COUNT(persons.person_id)AS tot_person, education_types.title
FROM education_types
JOIN persons ON persons.education_types_id = education_types.education_types_id
GROUP BY education_types.education_types_id
ORDER BY tot_person DESC;


