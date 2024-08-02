# Get all insurances with an annual cost greater to 400$
SELECT * FROM insurance_company.insurances WHERE annual_cost > 400;

# Get all insurances with a coverage percentage greater or equal to 30%
SELECT * FROM insurance_company.insurances WHERE coverage_percentage >= 30;

# Get all insurances that where signed before 2021
SELECT * FROM insurance_company.insurances WHERE EXTRACT(YEAR FROM start_date) < 2021;

# Get all insurances that where signed between 2019 and 2021
SELECT * FROM insurance_company.insurances WHERE EXTRACT(YEAR FROM start_date) BETWEEN 2019 AND 2021;

# Get all insurances that where signed in 2019 or have an annual cost greater than 400$
SELECT * FROM insurance_company.insurances WHERE annual_cost > 400 OR EXTRACT(YEAR FROM start_date) = 2019;