-- Set the encryption mode and key
SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('SuperSecretKey123!', 256));

-- Set a fixed initialization vector (IV)
SET @fixed_iv = UNHEX('00112233445566778899AABBCCDDEEFF');  -- Fixed IV as dynamic IV's were causing decryption issues, for prod, I would use a Key Management Service

-- Insert initial entries into the password_entries table with encrypted passwords
INSERT INTO password_entries (website_name, website_url, first_name, last_name, username, email, password, comment, created_at)
VALUES
  ('MySQL', 'http://mysql.com', 'Andrew', 'Fletcher', 'andrew.flet', 'afletcher@hartford.edu',
    AES_ENCRYPT('MySQL!StrongP@ssw0rd', @key_str, @fixed_iv),'Database management', CURRENT_TIMESTAMP),
  ('Google', 'https://google.com', 'Andrew', 'Fletcher', 'andrew.flet84', 'afletcher@gmail.com',
    AES_ENCRYPT('G0ogleAccount$2023', @key_str, @fixed_iv), 'Gmail account', CURRENT_TIMESTAMP),
  ('LinkedIn', 'https://linkedin.com', 'Andrew', 'Fletcher', 'afletcher.pro', 'afletcher@gmail.com',
    AES_ENCRYPT('Linkedin#JobSeek3r', @key_str, @fixed_iv), 'Professional network', CURRENT_TIMESTAMP),
  ('Facebook', 'http://facebook.com', 'Andrew', 'Fletcher', 'andyf', 'afletcher@gmail.com',
    AES_ENCRYPT('Fb_Secure!2021', @key_str, @fixed_iv), 'Social media', CURRENT_TIMESTAMP),
  ('Twitter', 'http://twitter.com', 'Andrew', 'Fletcher', 'fletch_andrew', 'afletcher@gmail.com',
    AES_ENCRYPT('Tw!tter@Handle987', @key_str, @fixed_iv), 'Social media', CURRENT_TIMESTAMP),
  ('University of Hartford', 'http://hartford.edu', 'Andrew', 'Fletcher', 'a.fletcher', 'afletcher@hartford.edu',
    AES_ENCRYPT('University#Hart123', @key_str, @fixed_iv), 'University account', CURRENT_TIMESTAMP),
  ('GitHub', 'http://github.com', 'Andrew', 'Fletcher', 'andrew-code', 'afletcher@hartford.edu',
    AES_ENCRYPT('GitHub_Coder!2022', @key_str, @fixed_iv), 'Code repository', CURRENT_TIMESTAMP),
  ('Amazon', 'http://amazon.com', 'Andrew', 'Fletcher', 'a.flet.amazon', 'afletcher@gmail.com',
    AES_ENCRYPT('Am@zonShopper*789', @key_str, @fixed_iv), 'Shopping account', CURRENT_TIMESTAMP),
  ('Netflix', 'http://netflix.com', 'Andrew', 'Fletcher', 'afletcher.nfx', 'afletcher@gmail.com',
    AES_ENCRYPT('N3tflixP@ssword2021', @key_str, @fixed_iv), 'Streaming service', CURRENT_TIMESTAMP),
  ('Instagram', 'http://instagram.com', 'Andrew', 'Fletcher', 'drew.insta84', 'afletcher@gmail.com',
  AES_ENCRYPT('Insta_Glam!42', @key_str, @fixed_iv), 'Social media', CURRENT_TIMESTAMP);
