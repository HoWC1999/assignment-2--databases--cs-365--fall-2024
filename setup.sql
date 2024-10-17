\W
-- Drop the database if it exists
DROP DATABASE IF EXISTS passwords;

-- Create a new database named 'passwords'
CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4;

-- Drop the user if it already exists
DROP USER IF EXISTS 'passwords_db_user'@'localhost';

-- Create a new user with a secure password and grant all privileges on the 'passwords' database
CREATE USER 'passwords_db_user'@'localhost' IDENTIFIED BY 'Str0ngUserPassw0rd!';
GRANT ALL ON passwords.* TO 'passwords_db_user'@'localhost';

-- Switch to using the newly created database
USE passwords;

-- Source the other SQL files to complete the setup
source _create-tables.sql;
source _insert-values.sql;
