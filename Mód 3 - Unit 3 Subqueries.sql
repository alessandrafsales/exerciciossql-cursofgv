-- questão 1 

-- com subquery
SELECT gp.country, 
	   MAX(gp.gdp_pc) as Maior_PIB_Africa
FROM gdp_pc gp 
WHERE gp.ref_year = 2019 
	AND gp.country IN
	(SELECT cs.country 
	FROM country cs
	WHERE cs.four_regions = 'africa');

-- com join e group by
SELECT gp.country,
	   MAX(gp.gdp_pc) as maiorPIB
FROM gdp_pc gp 
JOIN country c ON c.country = gp.country 
WHERE gp.ref_year = 2019 
	AND c.four_regions = 'africa'
GROUP BY gp.country
ORDER BY maiorPIB DESC
LIMIT 1;

-- questão 2  
SELECT le.country, 
	   MIN(le.tot_years) as min_life,
	   AVG(le.tot_years) as mean_life,
	   MAX(le.tot_years) as max_life
FROM life_expectancy le
JOIN country c ON le.country = c.country
WHERE le.ref_year = 1990
	AND c.wb_regions = 'Latin America & Caribbean'
GROUP BY le.country
ORDER BY min_life; 

-- para identificar apenas o país de expectativa mínima
SELECT le.country
FROM life_expectancy le
JOIN country c ON le.country = c.country
WHERE le.tot_years = 
	(SELECT MIN(les.tot_years) 
	FROM life_expectancy les
	JOIN country cs ON les.country = cs.country
	WHERE les.ref_year = 1990 
		AND cs.wb_regions = 'Latin America & Caribbean')
AND le.ref_year = 1990
AND c.wb_regions = 'Latin America & Caribbean';

SELECT le.country, le.tot_years  
FROM life_expectancy le 
JOIN country c ON le.country = c.country
WHERE le.tot_years = 
	  (SELECT MIN(les.tot_years)  
	   FROM life_expectancy les 
       JOIN country cs ON les.country = cs.country
       WHERE les.ref_year = 2010
        AND cs.wb_regions = 'Latin America & Caribbean')	
AND le.ref_year = 2010
AND c.wb_regions = 'Latin America & Caribbean';

-- questão 3 
SELECT c.wb_regions, 
	   AVG(ms.mean_years - ws.mean_years) AS avg_dif
FROM men_years_at_school ms
JOIN women_years_at_school ws ON ms.country = ws.country 
	AND ms.ref_year = ws.ref_year
JOIN country c ON ms.country = c.country 
WHERE ms.ref_year = 2000
GROUP BY c.wb_regions
ORDER BY avg_dif DESC
LIMIT 1;

-- questão 4
SELECT ai.country,
	   ai.mean_usd 
FROM avg_income ai 
JOIN country c ON ai.country = c.country 
WHERE ai.mean_usd = 
	(SELECT MIN(ai2.mean_usd)
	 FROM avg_income ai2 
	 JOIN country c2 ON ai2.country = c2.country 
	 WHERE ai2.ref_year = 2020
	 	AND c2.four_regions = 'europe')
AND ai.ref_year = 2020
AND c.four_regions = 'europe';

-- questão 5
SELECT ms.country, 
	   (ms.mean_years - ws.mean_years) as difOthers
FROM men_years_at_school ms
JOIN women_years_at_school ws ON ms.country = ws.country 
	AND ms.ref_year = ws.ref_year
JOIN country c ON ms.country = c.country 
WHERE ms.ref_year = 2000 
	AND c.wb_regions = 'Latin America & Caribbean'
	AND difOthers < 
		(SELECT (ms2.mean_years - ws2.mean_years) as difBrazil
		FROM men_years_at_school ms2
		JOIN women_years_at_school ws2 ON ms2.country = ws2.country 
			AND ms2.ref_year = ws2.ref_year
		JOIN country c2 ON ms2.country = c2.country 
		WHERE ms2.ref_year = 2000
			AND ms2.country = 'Brazil')



