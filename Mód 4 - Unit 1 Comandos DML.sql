-- questão 1
INSERT INTO men_years_at_school (country, ref_year, mean_years)
VALUES ('Brazil', 2010, 6.7),
	   ('Brazil', 2011, 6.8),
	   ('Brazil', 2012, 7.0),
	   ('Brazil', 2013, 7.1),
	   ('Brazil', 2014, 7.2),
	   ('Brazil', 2015, 7.3),
	   ('Brazil', 2016, 7.5),
	   ('Brazil', 2017, 7.6),
	   ('Brazil', 2018, 7.8),
	   ('Brazil', 2019, NULL),
	   ('Brazil', 2020, NULL),
	   ('Argentina', 2010, 10.5),
	   ('Argentina', 2011, 10.6),
	   ('Argentina', 2012, 10.6),
	   ('Argentina', 2013, 10.8),
	   ('Argentina', 2014, 10.7),
	   ('Argentina', 2015, 10.7),
	   ('Argentina', 2016, 10.8),
	   ('Argentina', 2017, NULL),
	   ('Argentina', 2018, 10.9),
	   ('Argentina', 2019, NULL),
	   ('Argentina', 2020, 10.9);

SELECT *
FROM men_years_at_school 
WHERE ref_year > 2009;

-- questão 2
UPDATE men_years_at_school  
SET mean_years = 7.8
WHERE ref_year = 2020
	AND country = 'Brazil';
	
-- questão 3 
UPDATE men_years_at_school  
SET mean_years = 
	(SELECT AVG(mean_years)
	 FROM men_years_at_school
	 WHERE country = 'Argentina'
	 	AND ref_year BETWEEN 2017 AND 2020)
WHERE country = 'Argentina' 
	AND mean_years IS NULL;

SELECT *
FROM men_years_at_school 
WHERE country = 'Argentina';

-- questão 4
DELETE 
FROM men_years_at_school 
WHERE country = 'Brazil' 
	AND ref_year >= 2019;

SELECT *
FROM men_years_at_school 
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2018 AND 2020;

-- questão 5
DELETE 
FROM men_years_at_school 
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2010 AND 2018;

SELECT *
FROM men_years_at_school
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2009