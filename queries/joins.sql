# Get the name of client with the type and cost of insurances
SELECT clients.name, insurances.type, insurances.annual_cost
FROM clients
JOIN insurances ON insurances.client_id = clients.id;

# Get the plate number, price and annual cost of the vehicles insurances
SELECT vehicles.plate_number, vehicles.price, insurances.annual_cost
FROM insurances
JOIN vehicles ON insurances.id = vehicles.insurance_id
WHERE insurances.type = "vehicle";

# Get the name, area of property, city and annual cost of the insurance of all the clients that have a property insurance
SELECT clients.name, properties.area, properties.city, insurances.annual_cost
FROM clients
JOIN insurances ON insurances.client_id = clients.id
JOIN properties ON properties.insurance_id = insurances.id
WHERE insurances.type = "property";