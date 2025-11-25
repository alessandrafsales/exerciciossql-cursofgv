-- questão 1 
SELECT c.country,
	   c.four_regions, 
	   ms.mean_years 
FROM country c 
JOIN men_years_at_school ms ON c.country = ms.country 
WHERE c.four_regions = 'asia'
	AND ms.ref_year = 2009
ORDER BY ms.mean_years 
LIMIT 5;

-- questão 2
SELECT c.country,
	   c.wb3income, 
	   c.wb_regions, 
	   ai.mean_usd 
FROM country c 
JOIN avg_income ai ON c.country = ai.country 
WHERE ai.ref_year = 1985
ORDER BY mean_usd DESC
LIMIT 10;

-- questão 3
SELECT gp.country AS Pais,
	   gp.ref_year AS Ano, 
	   gp.gdp_pc AS Renda_Per_Capita,
	   ai.mean_usd AS PIB,
	   p.tot_pop AS Populacao,
	   cm.tot_deaths AS Mortalidade_Infantil,
	   f.mean_babies AS Fertilidade,
	   le.tot_years AS Expectativa_De_Vida
FROM gdp_pc gp JOIN avg_income ai ON gp.country = ai.country 
	AND gp.ref_year = ai.ref_year
JOIN population p ON gp.country = p.country 
	AND gp.ref_year = p.ref_year 
JOIN child_mortality cm ON gp.country = cm.country 
	AND gp.ref_year = cm.ref_year
JOIN fertility f ON gp.country = f.country 
	AND gp.ref_year = f.ref_year
JOIN life_expectancy le ON gp.country = le.country 
	AND gp.ref_year = le.ref_year 
WHERE (gp.ref_year BETWEEN 1900 AND 2020 AND gp.ref_year % 10 = 0)
	AND gp.country = 'Brazil';

-- questão 4 
SELECT c.country,
	   c.four_regions, 
	   ms.mean_years 
FROM country c 
NATURAL JOIN men_years_at_school ms 
WHERE c.four_regions = 'asia'
	AND ms.ref_year = 2009
ORDER BY ms.mean_years 
LIMIT 5;

-- questão 5 
SELECT gp.country AS Pais,
	   gp.ref_year AS Ano, 
	   gp.gdp_pc AS Renda_Per_Capita,
	   ai.mean_usd AS PIB,
	   p.tot_pop AS Populacao,
	   cm.tot_deaths AS Mortalidade_Infantil,
	   f.mean_babies AS Fertilidade,
	   le.tot_years AS Expectativa_De_Vida
FROM gdp_pc gp 
NATURAL JOIN avg_income ai 
NATURAL JOIN population p 
NATURAL JOIN child_mortality cm 
NATURAL JOIN fertility f 
NATURAL JOIN life_expectancy le 
WHERE (gp.ref_year BETWEEN 1900 AND 2020 AND gp.ref_year % 10 = 0)
	AND gp.country = 'Brazil';
	   

