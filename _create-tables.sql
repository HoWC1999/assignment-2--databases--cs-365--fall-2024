-- Set the block encryption mode to AES-256-CBC
SET block_encryption_mode = 'aes-256-cbc';

-- Set the encryption key by using a securely hashed passphrase 'SuperSecretKey123!' with SHA-256
SET @key_str = UNHEX(SHA2('SuperSecretKey123!', 256));

-- Create the password_entries table to store the password data
CREATE TABLE IF NOT EXISTS password_entries (
    id INT AUTO_INCREMENT PRIMARY KEY,             -- Auto-incrementing ID for unique identification of each entry
    website_name VARCHAR(512) NOT NULL,            -- The name of the website (e.g., "Google", "LinkedIn")
    website_url VARCHAR(512) NOT NULL,             -- The URL of the website (e.g., "https://google.com")
    first_name VARCHAR(64) NOT NULL,               -- The first name of the user (e.g., "Andrew")
    last_name VARCHAR(64) NOT NULL,                -- The last name of the user (e.g., "Fletcher")
    username VARCHAR(64) NOT NULL,                 -- The username used for login on the site (e.g., "andrew.flet")
    email VARCHAR(128) NOT NULL,                   -- The email address of the user (e.g., "afletcher@hartford.edu")
    password VARBINARY(512) NOT NULL,              -- The encrypted password
    comment TEXT,                                  -- Optional comment field for any additional notes
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Automatically records the time the entry was created
);
