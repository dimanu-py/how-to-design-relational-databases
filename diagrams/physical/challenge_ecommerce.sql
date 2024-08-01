DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE addresses (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(255) NOT NULL,
    unit VARCHAR(255)
);

CREATE TABLE user_address (
    user_id INT UNSIGNED NOT NULL,
    address_id INT UNSIGNED NOT NULL,

    PRIMARY KEY (user_id, address_id),

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (address_id) REFERENCES addresses(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE orders (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    address_id INT UNSIGNED NOT NULL,
    invoice_number VARCHAR(255) NOT NULL UNIQUE,
    status ENUM('pending', 'processing', 'completed', 'cancelled') NOT NULL DEFAULT 'pending',
    total_price DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (address_id) REFERENCES addresses(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE shops (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE products (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    shop_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    stock INT UNSIGNED NOT NULL,
    price DECIMAL(9, 2) NOT NULL,
    discount TINYINT UNSIGNED NOT NULL,

    CHECK (discount BETWEEN 0 AND 100),

    FOREIGN KEY (shop_id) REFERENCES shops(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE product_sizes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id INT UNSIGNED NOT NULL,
    size VARCHAR(255) NOT NULL,

    FOREIGN KEY (product_id) REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE product_colors (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id INT UNSIGNED NOT NULL,
    color VARCHAR(255) NOT NULL,

    FOREIGN KEY (product_id) REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE product_images (
    product_id INT UNSIGNED NOT NULL,
    url VARCHAR(255) NOT NULL,

    FOREIGN KEY (product_id) REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE product_order (
    product_id INT UNSIGNED NOT NULL,
    order_id INT UNSIGNED NOT NULL,
    size_id INT UNSIGNED NOT NULL,
    color_id INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    price DECIMAL(9, 2) NOT NULL,
    discount TINYINT UNSIGNED NOT NULL,

    FOREIGN KEY (product_id) REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (order_id) REFERENCES orders(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (size_id) REFERENCES product_sizes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (color_id) REFERENCES product_colors(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

