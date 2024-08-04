DROP DATABASE IF EXISTS payments;

CREATE DATABASE payments;
USE payments;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE accounts (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    type ENUM('standard', 'business') NOT NULL,
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0,
    name VARCHAR(255) NOT NULL,
    description TEXT,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE business_accounts (
    account_id INT UNSIGNED PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    tax_id VARCHAR(255) NOT NULL UNIQUE,

    FOREIGN KEY (account_id) REFERENCES accounts(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE account_transactions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    source_account_id INT UNSIGNED NOT NULL,
    destination_account_id INT UNSIGNED NOT NULL,
    date DATETIME NOT NULL,
    state ENUM('payed', 'refunded') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (source_account_id) REFERENCES accounts(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (destination_account_id) REFERENCES accounts(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE bank_accounts (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE associations (
    account_id INT UNSIGNED NOT NULL,
    bank_account_id INT UNSIGNED NOT NULL,

    PRIMARY KEY (account_id, bank_account_id),

    FOREIGN KEY (account_id) REFERENCES accounts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE bank_transactions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    bank_account_id INT UNSIGNED NOT NULL,
    account_id INT UNSIGNED NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    state ENUM('processing', 'completed', 'canceled') NOT NULL,
    direction VARCHAR(255) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,

    FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (account_id) REFERENCES accounts(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);