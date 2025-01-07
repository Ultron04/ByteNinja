-- Create the database
CREATE DATABASE IF NOT EXISTS seat_reservation;

USE seat_reservation;

-- Create the admin table
CREATE TABLE IF NOT EXISTS admin (
    A_username VARCHAR(50) primary key,
    password VARCHAR(50) NOT NULL
);

-- Insert default admin entry
INSERT INTO admin (A_username, password) VALUES ("Admin", 'admin123');

-- Create the user table
CREATE TABLE IF NOT EXISTS users (
    S_username VARCHAR(50) primary key,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- Create the seat reservation table
CREATE TABLE IF NOT EXISTS reservations (
	S_username varchar(50),
    seat_number INT,
    reservation_date DATE,
    FOREIGN KEY (S_username) REFERENCES users(S_username)
);