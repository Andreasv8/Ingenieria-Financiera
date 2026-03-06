SELECT *
FROM SimLVDF.dbo.FinancialStatement 


-- PREGUNTA 1 
-- Cuántas filas tiene la tabla?

SELECT COUNT(*) AS total_filas
FROM FinancialStatement;

-- Respuesta 1:   11,693
 
-- PREGUNTA 2
-- Cuántas empresas aparecen?

SELECT COUNT(DISTINCT TICKER) AS total_empresas
FROM FinancialStatement;

-- Respuesta 2:  891

-- PREGUNTA 3
-- Para cuántos años tienes datos?

SELECT COUNT(DISTINCT YEAR(fs.fiscalDateEnding)) AS total_años
FROM FinancialStatement fs ;

-- Respuesta 3:  21 

-- PREGUNTA 4
-- Calcula el Gross Profit promedio de AMD

SELECT AVG(GrossProfit) AS promedio_gross_profit
FROM FinancialStatement fs 
WHERE TICKER = 'AMD';

-- Respuesta 4: 3,819,785,714.285714

-- PREGUNTA 5
-- Obtén las 20 empresas con el mayor EBITDA en 2018

SELECT TOP 20 ticker, ebitda 
FROM FinancialStatement fs 
WHERE YEAR(fiscalDateEnding) = 2018
ORDER BY ebitda  DESC

-- Respuesta 5: AAPL, BAC, C, GOOG, GOOGL, WFC, MSFT, VZ, T, GE, GS, CMCSA, WMT, META, INTC, JNJ, MS, PCAR, PFE, MU

-- PREGUNTA 6
-- Cuál fue el total Revenue por año de Microsoft entre 2015 y 2020?

SELECT YEAR(fiscalDateEnding) AS año, SUM(totalRevenue) AS total_revenue
FROM FinancialStatement fs 
WHERE TICKER = 'MSFT' AND YEAR(fiscalDateEnding) BETWEEN 2015 AND 2020
GROUP BY YEAR(fiscalDateEnding)
ORDER BY año;

-- 2015:	93580001280
-- 2016:	91153997824
-- 2017:	96570998784
-- 2018:	106999996416
-- 2019: 	122999996416
-- 2020: 	140999999488

-- PREGUNTA 7
-- Cuál fue el total Revenue (acumulado) de Microsoft entre 2015 y 2020?

SELECT SUM(totalRevenue)
FROM FinancialStatement fs2 
WHERE TICKER = 'MSFT' AND YEAR(fiscalDateEnding) BETWEEN 2015 AND 2020

-- respuesta 7: 652,304,990,208





