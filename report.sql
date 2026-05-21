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

.print "11.Which companies offer the highest average salary?"
SELECT companies.title, ROUND(AVG(jobs.salary),1)AS avg_salary
FROM companies
JOIN jobs ON jobs.company_id = companies.company_id
GROUP BY companies.company_id
ORDER BY avg_salary DESC;


.print "12. How many persons belong to each profession (education type)"
SELECT COUNT(persons.person_id)AS tot_person, education_types.title
FROM persons
JOIN education_types ON education_types.education_types_id = persons.education_types_id
GROUP BY education_types.education_types_id
ORDER BY tot_person DESC;


.print "13. Which cities have the most jobs available?"
SELECT addresses.city, COUNT(jobs.job_id)AS tot_job
FROM addresses
JOIN jobs ON jobs.address_id = addresses.address_id
GROUP BY addresses.city
ORDER BY tot_job DESC; 


.print "14. Which education places offer the most professions?"
SELECT education_places.title, COUNT(education_types.education_types_id)AS tot_professions, education_types.title
FROM education_places
JOIN ed_place_ed_types ON  ed_place_ed_types.ed_place_id = education_places.ed_place_id
JOIN education_types ON education_types.education_types_id = ed_place_ed_types.education_types_id
GROUP BY education_places.title
ORDER BY tot_professions DESC;


.print "15. What is the average age of persons for each profession?"
SELECT education_types.title, ROUND(AVG(persons.age),1)AS avg_age
FROM persons
JOIN education_types ON education_types.education_types_id = persons.education_types_id
GROUP BY education_types.title;


.print "16. Which persons are working in the same city where they live?"
--SELECT persons.full_name, jobs.title, addresses.city
--FROM persons
--JOIN persons_jobs ON persons_jobs.person_id = persons.person_id
--JOIN jobs ON jobs.job_id = persons_jobs.job_id
--JOIN addresses ON addresses.address_id = jobs.address_id;


.print "17. Which companies have jobs with salary greater than 80,000?"
SELECT companies.title, SUM(jobs.salary)AS tot_salary
FROM companies
JOIN jobs ON jobs.company_id = companies.company_id
GROUP BY companies.title
HAVING tot_salary > 80000
ORDER BY tot_salary DESC;


.print "18. How many education places exist in each country?"
SELECT COUNT(education_places.ed_place_id)AS tot_ed_places, addresses.country
FROM addresses
JOIN education_places ON education_places.address_id = addresses.address_id
GROUP BY addresses.country; 


.print "19. Which professions have the highest average salary?"
SELECT education_types.title, AVG(jobs.salary)AS avg_salary
FROM jobs 
JOIN education_types ON education_types.education_types_id = jobs.education_types_id
GROUP BY education_types.education_types_id
ORDER BY avg_salary DESC
LIMIT 1;


.print "20. Which persons are unemployed but have a profession (education type)?"
SELECT persons.full_name, education_types.title
FROM persons
JOIN education_types ON education_types.education_types_id = persons.education_types_id
WHERE persons.work_status = 'Unemployed';

.print "21. Test OM DELETE CASCADE. Show "
SELECT persons.person_id, persons.full_name, addresses.address_id, addresses.postcode
FROM persons
JOIN addresses ON addresses.address_id = persons.address_id
LIMIT 10;


DELETE FROM addresses
WHERE address_id = 35;


SELECT persons.person_id, persons.full_name, addresses.address_id, addresses.postcode
FROM persons
JOIN addresses ON addresses.address_id = persons.address_id
LIMIT 10;

.print "22. TEST INSERT INTO "
INSERT INTO persons(full_name, age, gender, work_status, education_types_id, address_id) 
VALUES ('Test Person', 30, 'Female','Student', 6, 20);
SELECT*FROM persons;

.print "23. UPDATE statement 'New name' "
UPDATE persons
SET full_name = 'New name'
WHERE full_name = 'Test Person';
SELECT*FROM persons;

.print "24. REPLACE INTO statement"
REPLACE INTO persons (full_name, age, gender, work_status, education_types_id, address_id) VALUES ('New name', 31, 'Female','Student', 6, 20);
SELECT*FROM persons;

.print "25. Which companies employ more than 2 persons? "

.print "26. Which profession has the highest average salary?"

.print "27. Which persons work in a different country from where they live?"

.print "28. Which education places offer more than one profession?"

.print "29. Which city has the highest average salary?"

.print "30. Which companies have jobs in more than one country?"

.print "31. Which students study professions that match their own profession type? "

.print "32. Find all unemployed persons older than the average age of all persons."

.print "33. Which profession is studied in the largest number of education places?"

.print "34. Which company offers the single highest salary in the database?"

.print "35. Which persons live in one country, study in another country, and work in a third country?"