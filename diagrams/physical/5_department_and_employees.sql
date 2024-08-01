DROP DATABASE IF EXISTS departments_and_employees;

CREATE DATABASE departments_and_employees;
USE departments_and_employees;

CREATE TABLE buildings (
    number INT UNSIGNED NOT NULL,
    city VARCHAR(255) NOT NULL,

    PRIMARY KEY (number, city)
);

CREATE TABLE departments (
    number VARCHAR(255) PRIMARY KEY,
    building_number INT UNSIGNED NOT NULL,
    building_city VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    annual_budget DECIMAL(8, 2) NOT NULL,

    FOREIGN KEY (building_number, building_city) REFERENCES buildings(number, city)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE employees (
    number INT UNSIGNED NOT NULL,
    department_number VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    manager_number INT UNSIGNED NOT NULL,
    manager_department_number VARCHAR(255) NOT NULL,

    PRIMARY KEY (number, department_number),

    FOREIGN KEY (department_number) REFERENCES departments(number)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (manager_number, manager_department_number)
        REFERENCES employees(number, department_number)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);