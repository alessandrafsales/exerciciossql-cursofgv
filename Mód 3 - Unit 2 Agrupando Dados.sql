-- questão 1
SELECT c.wb3income, 
       AVG(ai.mean_usd) AS mean_income,
	   MAX(ai.mean_usd) AS max_income,
	   MIN(ai.mean_usd) AS min_income
FROM avg_income ai 
JOIN country c ON ai.country = c.country 
WHERE ai.ref_year = 2000
GROUP BY c.wb3income 
ORDER BY ai.mean_usd DESC; 

-- questão 2
SELECT c.eight_regions, 
       le.ref_year, 
	   round(AVG(le.tot_years),2)
FROM life_expectancy le 
JOIN country c ON le.country = c.country 
WHERE le.ref_year BETWEEN 2019 AND 2021 
GROUP BY c.eight_regions, le.ref_year  
ORDER BY c.eight_regions, le.ref_year; 

-- questão 3
SELECT c.wb_regions, 
       ROUND(SUM(cep.co2_pc * p.tot_pop)/1E9,2) AS tot_giga_co2
FROM co2_emissions_pc cep 
JOIN country c ON cep.country = c.country 
JOIN population p ON cep.country = p.country 
	AND cep.ref_year = p.ref_year 
WHERE cep.ref_year = 2022
GROUP BY c.wb_regions 
ORDER BY tot_giga_co2 DESC;

-- questão 4
SELECT c.wb_regions, 
	   AVG(cm.tot_deaths) AS media
FROM child_mortality cm 
JOIN country c ON cm.country = c.country 
WHERE cm.ref_year = 2010
GROUP BY c.wb_regions 
HAVING media < 20;

-- questão 5
SELECT le.ref_year, 
	   MIN(le.tot_years),
	   round(AVG(le.tot_years),2),
	   MAX(le.tot_years)
FROM life_expectancy le 
JOIN country c ON c.country = le.country 
WHERE le.ref_year IN(1990,2000,2010,2020)
	  AND c.wb_regions = 'Latin America & Caribbean'
GROUP BY le.ref_year
ORDER BY le.ref_year; 
	  
-- questão 6
SELECT c.wb4income, 
	   round(AVG(ai.mean_usd),2) as avg_renda,
	   round(AVG(gp.gdp_pc),2) as avg_pib
FROM gdp_pc gp 
JOIN avg_income ai ON gp.country = ai.country 
	AND gp.ref_year = ai.ref_year 
JOIN country c ON gp.country = c.country 
WHERE gp.ref_year = 2019
GROUP BY c.wb4income
ORDER BY avg_pib;

-- questão 7
SELECT c.wb4income,
	   AVG(ms.mean_years - ws.mean_years) as mean
FROM men_years_at_school ms
JOIN women_years_at_school ws ON ms.country = ws.country 
	AND ms.ref_year = ws.ref_year
JOIN country c ON ms.country = c.country 
WHERE ms.ref_year = 2000
GROUP BY c.wb4income
ORDER BY mean; 

-- questão 8
SELECT c.wb_regions,
	   AVG(ms.mean_years - ws.mean_years) as mean
FROM men_years_at_school ms
JOIN women_years_at_school ws ON ms.country = ws.country 
	AND ms.ref_year = ws.ref_year
JOIN country c ON ms.country = c.country 
WHERE ms.ref_year = 2000
GROUP BY c.wb_regions
ORDER BY mean;

