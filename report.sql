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
.print "4.  How many persons live in each city?"
.print "5.  Which students study at each education place?"
.print "6.  Which professions can be studied at each education place?"
.print "7.  Which jobs offer a salary higher than the average salary of all jobs?"
.print "8.  Which persons are currently unemployed?"
.print "9.  How many jobs are available in each country?"
.print "10. How many persons have each profession (education type)?"
