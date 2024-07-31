DROP DATABASE IF EXISTS taxis;

CREATE database taxis;
USE taxis;

CREATE TABLE drivers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE garages (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(255) NOT NULL
);

CREATE TABLE vehicles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    garage_id INT UNSIGNED,
    plate_number VARCHAR(255) UNIQUE NOT NULL,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,

    FOREIGN KEY (garage_id) REFERENCES garages(id)
        ON UPDATE  CASCADE
        ON DELETE  SET NULL
);

CREATE TABLE vehicle_image (
    vehicle_id INT UNSIGNED NOT NULL,
    url VARCHAR(255) NOT NULL,

    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE
);

CREATE TABLE driver_vehicle (
    driver_id INT UNSIGNED NOT NULL UNIQUE,
    vehicle_id INT UNSIGNED NOT NULL UNIQUE,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,

    FOREIGN KEY (driver_id) REFERENCES drivers(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE
);
