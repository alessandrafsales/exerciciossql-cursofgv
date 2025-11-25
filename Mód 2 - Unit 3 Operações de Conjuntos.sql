-- question 1
SELECT country,
       ref_year,
       mean_years,
       'male'AS gender
FROM men_years_at_school
WHERE ref_year = 2000	
	AND country IN('Brazil', 'Russia', 'India', 'China', 'South Africa')
UNION
SELECT country,
       ref_year,
       mean_years,
       'female'AS gender
FROM women_years_at_school
WHERE ref_year = 2000	
	AND country IN('Brazil', 'Russia', 'India', 'China', 'South Africa');

-- question 2
SELECT country 
FROM child_mortality 
EXCEPT 
SELECT country
FROM fertility; 

-- question 3
SELECT country
FROM child_mortality
EXCEPT 
SELECT country
FROM population;

-- question 4
SELECT country
FROM population
EXCEPT
SELECT country
FROM country; 

-- question 5
SELECT *
FROM co2_emissions_pc
WHERE ref_year >= 2000
	AND country = 'Brazil'
EXCEPT
SELECT *
FROM men_years_at_school
WHERE ref_year >= 2000
	AND country = 'Brazil';

-- question 6 
SELECT country, ref_year 
FROM co2_emissions_pc
WHERE ref_year >= 2000
	AND country = 'Brazil'
INTERSECT
SELECT country, ref_year 
FROM men_years_at_school
WHERE ref_year >= 2000
	AND country = 'Brazil';


	