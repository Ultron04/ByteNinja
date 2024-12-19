-- Create the database
CREATE DATABASE IF NOT EXISTS seat_reservation;

USE seat_reservation;

-- Create the admin table
CREATE TABLE IF NOT EXISTS admin (
    id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Insert default admin entry
INSERT INTO admin (id, username, password) VALUES (111, 'admin', 'admin');

-- Create the user table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- Create the seat reservation table
CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    seat_number INT,
    reservation_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);