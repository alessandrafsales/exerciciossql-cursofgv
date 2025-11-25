-- question 1
SELECT "date",
       "close" - "open" as "range",
       ("close" + "open")/2 as "mean"
FROM petrobras
WHERE "date" BETWEEN '2020-02-20' AND '2020-03-20' 
	AND "range" > 0;

-- question 2
SELECT DISTINCT c.country
FROM country c 
JOIN women_years_at_school ws ON c.country = ws.country
JOIN men_years_at_school ms ON c.country = ms.country 
WHERE c.four_regions = 'africa' 
      AND ws.mean_years - ms.mean_years <=1
      AND ws.ref_year BETWEEN 2001 AND 2010;

-- question 3
SELECT cm.ref_year, 
       cm.tot_deaths,
       (100 * cm.tot_deaths)/1000 as porcentagem
FROM child_mortality cm 
WHERE cm.country = 'Brazil'
	AND cm.ref_year BETWEEN 1910 AND 2020
	AND cm.ref_year %10 = 0;
	
-- question 4
SELECT MIN(le.tot_years) AS expectativa_minima,
	   MAX(le.tot_years) AS expectativa_maxima,
	   round(AVG(le.tot_years), 2) AS expectativa_media
FROM life_expectancy le 
JOIN country c ON c.country = le.country 
WHERE c.wb_regions = 'Latin America & Caribbean'
	AND le.ref_year = 1990;
	
-- question 5
SELECT round(AVG(gp.gdp_pc),2) AS media_PIB,
	   round(AVG(ai.mean_usd),2) AS media_renda
FROM gdp_pc gp 
JOIN avg_income ai ON gp.country = ai.country 
	AND gp.ref_year = ai.ref_year 
WHERE gp.ref_year = 2019;

-- question 6
SELECT round(AVG(ms.mean_years - ws.mean_years),2) AS media_diferenca
FROM men_years_at_school ms
JOIN women_years_at_school ws ON ms.country = ws.country 
	AND ms.ref_year = ws.ref_year 
WHERE ms.ref_year = 2000