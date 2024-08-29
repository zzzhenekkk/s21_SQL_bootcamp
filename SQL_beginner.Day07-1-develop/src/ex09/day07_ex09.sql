SELECT p.address, 
	ROUND((MAX(age) - (MIN(age)::NUMERIC/MAX(age))), 2) AS formula, 
	ROUND(AVG(age), 2) AS average,
	ROUND((MAX(age) - (MIN(age)::NUMERIC/MAX(age))), 2) > ROUND(AVG(age), 2) AS comparison
FROM person p
GROUP BY p.address
ORDER BY 1;
