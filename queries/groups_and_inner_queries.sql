# How much money have we made from all the insurance sold to date?
WITH insurance_years_signed AS (
	SELECT
    	annual_cost,
		EXTRACT(YEAR FROM end_date) - EXTRACT(YEAR FROM start_date) AS years_signed
	FROM insurances
)
SELECT SUM(annual_cost * years_signed) AS total_cost
FROM insurance_years_signed;

SELECT SUM(annual_cost * (EXTRACT(YEAR FROM end_date) - EXTRACT(YEAR FROM start_date))) AS total_cost
FROM insurances;

# How much does the most expensive insurance cost? And the cheapest?
SELECT MAX(annual_cost) as most_expensive, MIN(annual_cost) as cheapest FROM insurances;

# Which is the most expensive insurance? And the cheapest?
SELECT id
FROM insurances
WHERE annual_cost = (SELECT MAX(annual_cost) FROM insurances);

SELECT id
FROM insurances
WHERE annual_cost = (SELECT MIN(annual_cost) FROM insurances);

# Who has bought the most expensive insurance?
SELECT clients.name, clients.id
FROM clients
JOIN insurances ON clients.id = insurances.client_id
WHERE insurances.annual_cost = (SELECT MAX(annual_cost) FROM insurances);

# How much money have we made from the insurance sold in 2021?
WITH insurance_years_signed AS (
	SELECT
    	annual_cost,
		EXTRACT(YEAR FROM end_date) - EXTRACT(YEAR FROM start_date) AS years_signed
	FROM insurances
	WHERE EXTRACT(YEAR FROM start_date) = 2021
)
SELECT SUM(annual_cost * years_signed) AS total_cost
FROM insurance_years_signed;

# What is the average price of the vehicles we have insured?
SELECT AVG(price) FROM vehicles;

# How many property insurances have we sold?
SELECT COUNT(insurance_id) FROM properties;

SELECT COUNT(id)
FROM insurances
WHERE insurances.type = "property";

# How much have we made in total from each type of insurance?
SELECT type, SUM(annual_cost * (EXTRACT(YEAR FROM end_date) - EXTRACT(YEAR FROM start_date))) AS total_cost
FROM insurances
GROUP BY type;

# How much has each client paid in total?
SELECT
	client_id,
	SUM(annual_cost * (EXTRACT(YEAR FROM end_date) - EXTRACT(YEAR FROM start_date))) AS total_cost
FROM insurances
GROUP BY client_id;

# How much has each client paid in total for each type of insurance?
SELECT
	client_id,
	type,
	SUM(annual_cost * (EXTRACT(YEAR FROM end_date) - EXTRACT(YEAR FROM start_date))) AS total_cost
FROM insurances
GROUP BY client_id, type;

# How many car and property insurances does each client have?
SELECT client_id, type, COUNT(id) AS number_insurances
FROM insurances
GROUP BY client_id, type;