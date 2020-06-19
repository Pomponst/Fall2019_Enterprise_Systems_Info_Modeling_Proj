# Fall2019_ESIM_Project
Final project code for my Graduate level Eneterprise Systems-Info Modeling Course

*Instructions*<br>
This document constitutes the final project for the course.
1. Execute HAFH_Project.sql in MySQL and confirm that the resulting database contains nine populated tables.
populated tables. 
2. Create an ER diagram and corresponding relational schema based on the following:
	1. First, use rows 5 – 77 of HAFH_Project.sql for the tables, columns, primary keys and foreign keys.  Note that some modifications will have to be made in Part b.
	2. Second, use the following information to add to/update the results of Part a.  Note that some of the following may be different than what is indicated in HAFH_Project.sql (e.g.; nullable columns).  
		* Corporate client industry is unique.
		* There can be multiple corporate client locations for a given corporate client.
		* A manager’s full name is composed of his/her first and last name.
		* A manager’s age is derived from his/her birthdate and the current date.
		* Not every manager will have a bonus.
		* Apartment numbers are partially unique (unique within a building).
		* Each manager manages at least one building, but each building has only one manager.
		* Inspectors track the date of the last inspection and date of the next inspection.
		* An apartment can be leased to at most one corporate client, and each corporate  client leases at least one apartment.
		* Each apartment is cleaned by at least 2 staff members, and each staff member cleans between 4 and 7 apartments.
		* A manager resides in one and only one building, but a building can have zero or one managers residing in it.
		* Each inspector inspects between 3 and 5 buildings, and each building is inspected by at least one inspector.
		* Each building has at least one apartment, and each apartment is in one and only one building.
		* Each corporate client can refer zero or one other clients, and each referred client may have been referred by only one other client or no one.
3. Using only the data in the hafh_project database (i.e,; disregard Part 2) write queries that answer/perform the following and save them in a single .sql file.  Label each query with a commented-out line indicating which question is being answered.  You do not have to save the outputs of the queries, but I will execute your script on my machine to verify it performs the tasks as expected.  You can only use one query per question.
	1. What is the most common apartment number?
	2. How many different apartment numbers are there?
	3. How many different apartments (number and building) are there?
	4. Which apartments (number and building) have no clients in them?
	5. What is the average rent for two-bedroom apartments?
	6. How many buildings are there?
	7. Which building(s) has the widest range in rent prices?
	8. List all the managers (first and last names) with their salaries in order of oldest to youngest.
	9. Which manager(s) (first and last names) received the largest bonus?  What was it?
	10. Which manager(s) manage(s) the most buildings?  How many?
	11. Who are the manager(s) and their phone numbers of the buildings that were inspected by Bianca?
	12. Which corporate client(s) referred at least one other client, how many did each refer, and which building and apartment do they live in?
	13. Which corporate clients were referred by no one?
	14. What is the name(s) of the staff member(s) who cleans the fewest apartments?
	15. For the staff member(s) who cleans the fewest apartments, which apartments (number and building) does (s)he clean?  Include the name(s) of the staff member.
