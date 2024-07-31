DROP DATABASE IF EXISTS chat_rooms;

CREATE DATABASE chat_rooms;
USE chat_rooms;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE chat_rooms (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    owner_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    is_private BOOLEAN NOT NULL,

    FOREIGN KEY (owner_id) REFERENCES users(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE
);

CREATE TABLE roles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    room_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,

    FOREIGN KEY (room_id) REFERENCES chat_rooms(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE
);

CREATE TABLE user_role (
    user_id INT UNSIGNED NOT NULL,
    role_id INT UNSIGNED NOT NULL,

    PRIMARY KEY (user_id, role_id),

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE,

    FOREIGN KEY (role_id) REFERENCES roles(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE
);

CREATE TABLE user_room (
    user_id INT UNSIGNED NOT NULL,
    room_id INT UNSIGNED NOT NULL,

    PRIMARY KEY (user_id, room_id),

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE,

    FOREIGN KEY (room_id) REFERENCES chat_rooms(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE
);

CREATE TABLE invitations (
    user_id INT UNSIGNED NOT NULL,
    room_id INT UNSIGNED NOT NULL,

    PRIMARY KEY (user_id, room_id),

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE,

    FOREIGN KEY (room_id) REFERENCES chat_rooms(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE
);

CREATE TABLE messages (
    user_id INT UNSIGNED NOT NULL,
    room_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    date DATETIME NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE,

    FOREIGN KEY (room_id) REFERENCES chat_rooms(id)
        ON UPDATE  CASCADE
        ON DELETE  CASCADE
);