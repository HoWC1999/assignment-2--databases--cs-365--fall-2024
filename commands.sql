-- Use the passwords database
USE passwords;

-- Ensure the encryption settings and variables are set
SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('my secret passphrase', 256));

-- Important: Use the same initialization vector (IV) used during encryption
-- For demonstration purposes, we'll set @init_vector to the same value
-- In practice, the IV should be stored and retrieved securely
-- Here we assume @init_vector was previously stored or known
-- For the example, let's set @init_vector to a fixed value
SET @init_vector = UNHEX('000102030405060708090A0B0C0D0E0F');

-- 1. Create a new entry into the database, which already has your 10 initial entries
INSERT INTO password_entries (
  website_name, website_url, first_name, last_name, username, email, password, comment, created_at
) VALUES (
  'Example New Site', 'http://www.newsite.com', 'New', 'User', 'nuser', 'new.user@example.com',
  AES_ENCRYPT('newpassword', @key_str, @init_vector), 'Newly added entry', CURRENT_TIMESTAMP
);

-- 2. Get the password associated with the URL of one of your 10 entries (e.g., 'http://hartford.edu')
SELECT AES_DECRYPT(password, @key_str, @init_vector) AS password_plaintext
FROM password_entries
WHERE website_url = 'http://hartford.edu';

-- 3. Get all the password-related data, including the password, associated with URLs that have https in two of your 10 entries
SELECT website_name, website_url, first_name, last_name, username, email,
       AES_DECRYPT(password, @key_str, @init_vector) AS password_plaintext, comment, created_at
FROM password_entries
WHERE website_url LIKE 'https%';

-- 4. Change a URL associated with one of the passwords in your 10 entries (e.g., change Twitter URL to 'https://twitter.com')
UPDATE password_entries
SET website_url = 'https://twitter.com'
WHERE website_url = 'http://twitter.com';

-- 5. Change any password (e.g., change password for username 'cwilliams')
UPDATE password_entries
SET password = AES_ENCRYPT('newcarolpassword', @key_str, @init_vector)
WHERE username = 'cwilliams';

-- 6. Remove a tuple based on a URL (e.g., remove entry with URL 'http://linkedin.com')
DELETE FROM password_entries
WHERE website_url = 'http://linkedin.com';

-- 7. Remove a tuple based on a password (e.g., remove entry where password is 'frankspass')
DELETE FROM password_entries
WHERE password = AES_ENCRYPT('frankspass', @key_str, @init_vector);

