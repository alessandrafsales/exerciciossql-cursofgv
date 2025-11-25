-- questão 1
SELECT country, gdp_pc 
FROM gdp_pc
WHERE ref_year = 2009
ORDER BY gdp_pc
LIMIT 10;

-- questão 2
SELECT country, mean_usd  
FROM avg_income
WHERE ref_year = 2009
ORDER BY mean_usd;

-- questão 3
SELECT country, mean_babies 
FROM fertility 
WHERE ref_year = 2009
ORDER BY mean_babies DESC
LIMIT 10;

-- questão 4
SELECT country, tot_deaths 
FROM child_mortality 
WHERE ref_year = 2009
ORDER BY tot_deaths DESC
LIMIT 10;  

-- questão 5
SELECT country , mean_years
FROM women_years_at_school
WHERE ref_year = 2009
ORDER BY mean_years;

-- questão 6
SELECT country, gdp_pc 
FROM gdp_pc 
WHERE ref_year = 2009
ORDER BY gdp_pc 
LIMIT 6;

-- questão 8
SELECT country, tot_years 
FROM life_expectancy 
WHERE ref_year = 2009
ORDER BY tot_years 
LIMIT 6;

-- questão 9
SELECT DISTINCT wb4income 
FROM country
WHERE wb4income IS NOT NULL;

-- questão 10
SELECT DISTINCT country
FROM population
ORDER BY country DESC
LIMIT 5;
