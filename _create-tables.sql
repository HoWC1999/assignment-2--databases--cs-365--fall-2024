-- Set the block encryption mode to AES-256-CBC (Cipher Block Chaining)
SET block_encryption_mode = 'aes-256-cbc';

-- Set the encryption key by using a securely hashed passphrase 'SuperSecretKey123!' with SHA-512
-- Convert the passphrase into a 256-bit binary string using UNHEX
SET @key_str = UNHEX(SHA2('SuperSecretKey123!', 256));
SET @init_vector = RANDOM_BYTES(16);
-- Create the password_entries table to store the password data
CREATE TABLE IF NOT EXISTS password_entries (
    id INT AUTO_INCREMENT PRIMARY KEY,             -- Auto-incrementing ID for unique identification of each entry
    website_name VARCHAR(255) NOT NULL,            -- The name of the website (e.g., "Google", "LinkedIn")
    website_url VARCHAR(255) NOT NULL,             -- The URL of the website (e.g., "https://google.com")
    first_name VARCHAR(50) NOT NULL,               -- The first name of the user (e.g., "Andrew")
    last_name VARCHAR(50) NOT NULL,                -- The last name of the user (e.g., "Fletcher")
    username VARCHAR(50) NOT NULL,                 -- The username used for login on the site (e.g., "andrew.flet")
    email VARCHAR(100) NOT NULL,                   -- The email address of the user (e.g., "afletcher@hartford.edu")
    password VARBINARY(255) NOT NULL,              -- The encrypted password (stored as binary data)
    init_vector VARBINARY(16) NOT NULL,            -- The initialization vector (IV) used during AES encryption
    comment TEXT,                                  -- Optional comment field for any additional notes
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Automatically records the time the entry was created
);
