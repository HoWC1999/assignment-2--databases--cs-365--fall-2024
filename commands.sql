-- Use the passwords database
USE passwords;

-- Set the encryption mode to AES-256-CBC
SET block_encryption_mode = 'aes-256-cbc';

-- Set the encryption key by using a securely hashed passphrase 'SuperSecretKey123!' with SHA-512
SET @key_str = UNHEX(SHA2('SuperSecretKey123!', 256));

-- Set a fixed initialization vector (IV)
SET @fixed_iv = UNHEX('00112233445566778899AABBCCDDEEFF');  -- Fixed IV as dynamic IV's were causing decryption issues, in real prod, I would use a Key Management Service

-- 1. Insert a new password entry into the database
-- INSERT INTO password_entries (website_name, website_url, first_name, last_name, username, email, password, comment, created_at)
-- VALUES ('Ebay', 'https://ebay.com', 'Andrew', 'Fletcher', 'andrew.ebay', 'afletcher@hartford.edu',
--  AES_ENCRYPT('Str0ngEBayPwD11!', @key_str, @fixed_iv), 'Ebay account', CURRENT_TIMESTAMP);

-- 2. Retrieve the decrypted password for a specific website
-- SELECT website_url,
--  CONVERT(AES_DECRYPT(password, @key_str, @fixed_iv) USING 'utf8mb4') AS decrypted_password, created_at
-- FROM password_entries
-- WHERE website_url = 'https://google.com';

-- 3. Get all the password-related data for entries that use HTTPS URLs
-- SELECT website_name, website_url, username, email,
  -- CONVERT(AES_DECRYPT(password, @key_str, @fixed_iv) USING 'utf8') AS decrypted_password, comment, created_at
-- FROM password_entries
-- WHERE website_url LIKE 'https://%';

-- 4. Update the URL for an existing entry
-- UPDATE password_entries
-- SET website_url = 'https://twitter.com'
-- WHERE website_name = 'Twitter';
-- SELECT website_url FROM password_entries WHERE website_name = 'Twitter';

-- 5. Update the password for a specific entry (Example for Hartford account)
-- SELECT password FROM password_entries WHERE website_name = 'University of Hartford';
-- UPDATE password_entries
-- SET password = AES_ENCRYPT('Univ3rsity!2024New', @key_str, @fixed_iv)
-- WHERE website_name = 'University of Hartford';
-- SELECT password FROM password_entries WHERE website_name = 'University of Hartford';

-- 6. Delete an entry based on its URL
-- SELECT * FROM password_entries;
-- DELETE FROM password_entries
-- WHERE website_url = 'http://instagram.com';
-- SELECT * FROM password_entries;

-- 7. Delete an entry based on its decrypted password
-- SELECT * FROM password_entries;
-- DELETE FROM password_entries
-- WHERE AES_DECRYPT(password, @key_str, @fixed_iv) = 'N3tflixP@ssword2021';
-- SELECT * FROM password_entries;
