-- questão 1
SELECT cm.country, 
	   cm.tot_deaths,
	   f.mean_babies
FROM child_mortality cm
LEFT JOIN fertility f ON cm.country = f.country 
	AND cm.ref_year = f.ref_year 
WHERE cm.country IN('Andorra', 'Liechtenstein', 'Malta', 'Monaco', 'San Marino', 'Holy See')
	AND cm.ref_year = 2000;

-- questão 2
SELECT cm.country, 
	   cm.tot_deaths,
	   f.mean_babies,
	   p.tot_pop 
FROM child_mortality cm
LEFT JOIN fertility f ON cm.country = f.country 
	AND cm.ref_year = f.ref_year 
LEFT JOIN population p ON cm.country = p.country 
	AND cm.ref_year = p.ref_year 
WHERE cm.country IN('Andorra', 'Liechtenstein', 'Malta', 'Monaco', 'San Marino', 'Holy See')
	AND cm.ref_year = 2000;

-- questão 3 
SELECT cm.country,
	   cm.tot_deaths,
	   p.tot_pop,
	   f.mean_babies 
FROM child_mortality cm 
JOIN population p ON cm.country = p.country 
	AND cm.ref_year = p.ref_year 
LEFT JOIN fertility f ON cm.country = f.country 
	AND cm.ref_year = f.ref_year
WHERE cm.country IN('Andorra', 'Liechtenstein', 'Malta', 'Monaco', 'San Marino', 'Holy See')
	AND cm.ref_year = 2000;

-- questão 4
SELECT cm.country,
	   cm.tot_deaths, 
	   f.mean_babies
FROM fertility f
RIGHT JOIN child_mortality cm ON f.country = cm.country 
	AND f.ref_year = cm.ref_year
WHERE f.country IN('Andorra', 'Liechtenstein', 'Malta', 'Monaco', 'San Marino', 'Holy See')
	AND f.ref_year = 2000;

