-- primeira questão: não há valores nulos
SELECT gdp_pc 
FROM gdp_pc
WHERE gdp_pc IS NULL;

-- segunda questão: sim, há valores nulos
SELECT *
FROM child_mortality 
WHERE tot_deaths IS NULL; 

-- terceira questão:
SELECT country, ref_year  
FROM child_mortality
WHERE tot_deaths BETWEEN 19 AND 21;

-- quarta questão: 
SELECT country, ref_year, tot_years 
FROM life_expectancy
WHERE ref_year BETWEEN 2019 AND 2023 
	AND country = 'Brazil';

-- quinta questão:
SELECT country, tot_pop  
FROM population
WHERE tot_pop > 0.2e9
	AND ref_year = 2023;

-- sexta questão:
SELECT country, ref_year, co2_pc 
FROM co2_emissions_pc
WHERE ref_year BETWEEN 2019 AND 2021
	AND country IN ('China', 'USA', 'Brazil');

-- sétima questão: 
SELECT country, eight_regions 
FROM country
WHERE (eight_regions = 'europe_east' OR 'europe_west')
	AND wb4income = 'Lower middle income';

-- oitava questão:
SELECT country, co2_pc 
FROM co2_emissions_pc
WHERE ref_year BETWEEN 2019 AND 2021
	AND country IN('Brazil','China','USA');

-- nona questão:
SELECT country, eight_regions  
FROM country
WHERE eight_regions IN('europe_east','europe_west')
	AND wb4income = 'Lower middle income';
	
-- décima questão:
SELECT country, eight_regions, wb_regions  
FROM country 
WHERE eight_regions LIKE '%asia%';

-- décima primeira questão:
SELECT country, wb_regions 
FROM country 
WHERE wb_regions LIKE '%America%';
