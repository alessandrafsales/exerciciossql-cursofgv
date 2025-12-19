BEGIN TRANSACTION;

DELETE 
FROM men_years_at_school 
WHERE ref_year BETWEEN 2000 AND 2009
	AND country = "Brazil";

ROLLBACK;

COMMIT;