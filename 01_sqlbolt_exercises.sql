-- ==============================================================================
-- PROJECT: Relational Database Querying & SQL Fundamentals
-- SOURCE: SQLBolt Interactive Coursework
-- AUTHOR: Moisés Zamora García
-- TOPICS COVERED: Data Selection, Filtering, Joins, Aggregations, Schema DDL/DML
-- ==============================================================================
--
-- Overview:
-- This script contains solutions to the complete SQLBolt tutorial series. 
-- It demonstrates proficiency in querying relational tables, filtering 
-- complex conditions, joining multi-table datasets, and performing aggregations.
--
-- Key Operations Implemented:
-- 1. Data Filtering: WHERE, LIKE, IN, BETWEEN, ORDER BY, LIMIT
-- 2. Multi-Table Operations: INNER JOIN, LEFT/RIGHT/FULL OUTER JOIN
-- 3. Data Aggregation: GROUP BY, HAVING, COUNT, SUM, AVG, MIN, MAX
-- 4. Schema Manipulation: INSERT, UPDATE, DELETE, CREATE/ALTER/DROP TABLE
-- ------------------------------------------------------------
-- SQL Lesson 10: Queries with aggregates (Pt. 1)
-- ------------------------------------------------------------

-- 10.1 Find the longest time that an employee has been at the studio
SELECT * 
FROM employees
ORDER BY years_employed DESC
LIMIT 1;

-- 10.2 For each role, find the average number of years employed by employees in that role
SELECT 
  role, 
  AVG(years_employed) AS avg_years_employed
FROM employees
GROUP BY role;

-- 10.3 Find the total number of employee years worked in each building
SELECT 
  building, 
  SUM(years_employed) AS total_years_worked
FROM employees
GROUP BY building;


-- ------------------------------------------------------------
-- SQL Lesson 11: Queries with aggregates (Pt. 2)
-- ------------------------------------------------------------

-- 11.1 Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(*) AS total_artists
FROM employees
WHERE role = 'Artist';

-- 11.2 Find the number of Employees of each role in the studio
SELECT 
  role, 
  COUNT(*) AS total_employees
FROM employees
GROUP BY role;

-- 11.3 Find the total number of years employed by all Engineers
SELECT 
  role, 
  SUM(years_employed) AS total_years_employed
FROM employees
WHERE role = 'Engineer';


-- ------------------------------------------------------------
-- SQL Lesson 12: Order of execution of a Query
-- ------------------------------------------------------------

-- 12.1 Find the number of movies each director has directed
SELECT 
  director, 
  COUNT(*) AS total_movies
FROM movies
GROUP BY director;

-- 12.2 Find the total domestic and international sales that can be attributed to each director
SELECT 
  director, 
  SUM(domestic_sales + international_sales) AS total_dom_int
FROM movies
JOIN boxoffice 
  ON movies.id = boxoffice.movie_id
GROUP BY director;


-- ------------------------------------------------------------
-- SQL Lesson 13: Inserting rows
-- ------------------------------------------------------------

-- 13.1 Add the studio's new production, Toy Story 4 to the list of movies
INSERT INTO movies (id, title, director, year, length_minutes)
VALUES (15, 'Toy Story 4', 'Josh Cooley', 2019, 100);

-- 13.2 Add the record to the Boxoffice table
INSERT INTO boxoffice (movie_id, rating, domestic_sales, international_sales)
VALUES (15, 8.7, 340000000, 270000000);


-- ------------------------------------------------------------
-- SQL Lesson 14: Updating rows
-- ------------------------------------------------------------

-- 14.1 The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE movies
SET director = 'John Lasseter'
WHERE title = 'A Bug''s Life';

-- 14.2 The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE movies
SET year = 1999
WHERE title = 'Toy Story 2';

-- 14.3 Both the title and director for Toy Story 8 is incorrect! 
-- The title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE movies
SET 
  title = 'Toy Story 3',
  director = 'Lee Unkrich'
WHERE title = 'Toy Story 8';

-- ------------------------------------------------------------
-- SQL Lesson 15: Deleting rows
-- ------------------------------------------------------------

-- 15.1 This database is getting too big, lets remove all movies that were released before 2005
DELETE FROM movies
WHERE year < 2005;


-- 15.2 Andrew Stanton has also left the studio, so please remove all movies directed by him
DELETE FROM movies
WHERE director = 'Andrew Stanton';

-- ------------------------------------------------------------
-- SQL Lesson 16: Creating tables
-- ------------------------------------------------------------

-- 16.1 Create a new table named Database with Name, Version, and Download_count columns
CREATE TABLE Database (
    Name TEXT,
    Version FLOAT,
    Download_count INTEGER
);


-- ------------------------------------------------------------
-- SQL Lesson 17: Altering tables
-- ------------------------------------------------------------

-- 17.1 Add a column named Aspect_ratio with a FLOAT data type
ALTER TABLE Movies
ADD COLUMN Aspect_ratio FLOAT;


-- 17.2 Add a column named Language with TEXT data type and 'English' as default
ALTER TABLE Movies
ADD COLUMN Language TEXT DEFAULT 'English';

-- ------------------------------------------------------------
-- SQL Lesson 18: Dropping tables
-- ------------------------------------------------------------

-- 18.1 Remove the Movies table
DROP TABLE IF EXISTS Movies;

-- 18.2 Drop the BoxOffice table
DROP TABLE IF EXISTS BoxOffice;



