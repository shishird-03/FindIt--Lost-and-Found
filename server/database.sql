-- CREATE DATABASE IF NOT EXISTS lost_and_found_db;
-- USE lost_and_found_db;

-- DROP TABLE IF EXISTS matches;
-- DROP TABLE IF EXISTS lost_items;
-- DROP TABLE IF EXISTS found_items;
-- DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    id_number VARCHAR(50),
    role ENUM('Student', 'Faculty', 'Staff', 'Admin') DEFAULT 'Student',
    contact_info VARCHAR(255),
    profile_pic VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS lost_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    date_lost DATE,
    time_lost TIME,
    contact_info VARCHAR(255),
    image_url VARCHAR(255),
    status ENUM('active', 'found', 'resolved') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS found_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    date_found DATE,
    time_found TIME,
    contact_info VARCHAR(255),
    image_url VARCHAR(255),
    status ENUM('active', 'claimed', 'resolved') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lost_item_id INT NOT NULL,
    found_item_id INT NOT NULL,
    status ENUM('matched', 'claimed', 'resolved') DEFAULT 'matched',
    claim_status ENUM('unclaimed', 'claimed') DEFAULT 'unclaimed',
    matched_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lost_image VARCHAR(255),
    found_image VARCHAR(255),
    FOREIGN KEY (lost_item_id) REFERENCES lost_items(id) ON DELETE CASCADE,
    FOREIGN KEY (found_item_id) REFERENCES found_items(id) ON DELETE CASCADE
);
