DROP DATABASE IF EXISTS insurance_company;

CREATE DATABASE insurance_company;
USE insurance_company;

CREATE TABLE clients (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_document VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE insurances (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    client_id INT UNSIGNED NOT NULL,
    coverage_percentage TINYINT UNSIGNED NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    annual_cost DECIMAL(8, 2) NOT NULL,
    type ENUM('property', 'vehicle') NOT NULL,

    FOREIGN KEY (client_id) REFERENCES clients(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CHECK (coverage_percentage <= 100)
);

CREATE TABLE properties (
    insurance_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    area DECIMAL(6, 2) NOT NULL,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(255),

    FOREIGN KEY (insurance_id) REFERENCES insurances(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE vehicles (
    insurance_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    plate_number VARCHAR(255) NOT NULL UNIQUE,
    price DECIMAL(8, 2) NOT NULL,

    FOREIGN KEY (insurance_id) REFERENCES insurances(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);