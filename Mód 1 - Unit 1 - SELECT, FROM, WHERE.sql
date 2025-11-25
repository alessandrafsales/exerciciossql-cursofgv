-- primeira questão: tem a guatemala e lituania
SELECT country, 
	   ref_year  
FROM co2_emissions_pc
WHERE co2_pc = 0.2;

-- segunda questão: americas, america_south, Upper middle income
SELECT four_regions,
	   eight_regions,
	   wb4income 
FROM country
WHERE country = 'Brazil';

-- terceira questão: sim, tem a China, Indonésia e Malásia
SELECT country
FROM country
WHERE wb3income = 'Middle income';

-- quarta questão: 201,000
SELECT gdp_pc 
FROM gdp_pc
WHERE ref_year = 2017 AND country = 'Monaco';

-- quinta questão: 1934, 1935,1936
SELECT country, ref_year 
FROM life_expectancy
WHERE tot_years = 36.5;

-- sexta questão: 13.62
SELECT close
FROM petrobras
WHERE date = '2022-08-12'

-- sétima questão: Sudão do Sul
SELECT country
FROM gdp_pc
WHERE gdp_pc < 400;

-- oitava questão: Japão e Singapura
SELECT country
FROM life_expectancy
WHERE tot_years > 94;

-- nona questão: Sim, os valores são diferentes nesse dia.
SELECT *
FROM petrobras
WHERE close <> 'adj close';