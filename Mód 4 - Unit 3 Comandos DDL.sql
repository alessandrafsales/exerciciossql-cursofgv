-- 	questão 1
CREATE TABLE "relatorio_focus" (
	"ref_date" DATE NOT NULL PRIMARY KEY,
	"ipca" NUMERIC(5,2) NOT NULL,
	"pib" NUMERIC(5,2) NOT NULL,
	"dolar" NUMERIC(8,2) NOT NULL
);

-- questão 2
INSERT INTO relatorio_focus (ref_date,ipca,pib,dolar )
VALUES ('2024-06-21',3.98,2.09,5.15),
	   ('2024-06-28',4.00,2.09,5.20),
	   ('2024-07-05',4.02,2.10,5.20),
	   ('2024-07-12',4.00,2.11,5.22),
	   ('2024-07-19',4.05,2.15,5.30);

SELECT *
FROM relatorio_focus;

-- questão 3
ALTER TABLE relatorio_focus 
ADD selic NUMERIC(5,2) NULL;

-- questão 4
UPDATE relatorio_focus
SET selic = 10.50;

-- questão 5
ALTER TABLE relatorio_focus ( -- não funciona no sqlite 3.46
MODIFY COLUMN selic NOT NULL);

CREATE TABLE relatorio_focus_temp (
	ref_date DATE NOT NULL PRIMARY KEY,
	ipca NUMERIC(5,2) NOT NULL,
	pib NUMERIC(5,2) NOT NULL,
	dolar NUMERIC(8,2) NOT NULL,
	selic NUMERIC(5,2) NOT NULL
);

INSERT INTO relatorio_focus_temp 
SELECT * FROM relatorio_focus;

DROP TABLE relatorio_focus;

ALTER TABLE relatorio_focus_temp 
RENAME TO relatorio_focus;

--	questão 6
ALTER TABLE relatorio_focus
RENAME TO focus_report;

-- questão 7
DROP TABLE focus_report;
