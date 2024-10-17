-- Insert initial entries into the password_entries table
-- Each entry includes an AES-encrypted password and a randomly generated initialization vector
INSERT INTO password_entries (website_name, website_url, first_name, last_name, username, email, password, init_vector, comment)
VALUES
('MySQL', 'http://mysql.com', 'Andrew', 'Fletcher', 'andrew.flet', 'afletcher@hartford.edu',
    AES_ENCRYPT('MySQL!StrongP@ssw0rd', @key_str, @init_vector), @init_vector, 'Database management'),
('Google', 'https://google.com', 'Andrew', 'Fletcher', 'andrew.flet84', 'afletcher@gmail.com',
    AES_ENCRYPT('G0ogleAccount$2023', @key_str, @init_vector), @init_vector, 'Gmail account'),
('LinkedIn', 'https://linkedin.com', 'Andrew', 'Fletcher', 'afletcher.pro', 'afletcher@linkedin.com',
    AES_ENCRYPT('Linkedin#JobSeek3r', @key_str, @init_vector), @init_vector, 'Professional network'),
('Facebook', 'http://facebook.com', 'Andrew', 'Fletcher', 'andyf', 'afletcher@facebook.com',
    AES_ENCRYPT('Fb_Secure!2021', @key_str, @init_vector), @init_vector, 'Social media'),
('Twitter', 'http://twitter.com', 'Andrew', 'Fletcher', 'fletch_andrew', 'afletcher@twitter.com',
    AES_ENCRYPT('Tw!tter@Handle987', @key_str, @init_vector), @init_vector, 'Social media'),
('University of Hartford', 'http://hartford.edu', 'Andrew', 'Fletcher', 'a.fletcher', 'afletcher@hartford.edu',
    AES_ENCRYPT('University#Hart123', @key_str, @init_vector), @init_vector, 'University account'),
('GitHub', 'http://github.com', 'Andrew', 'Fletcher', 'andrew-code', 'afletcher@github.com',
    AES_ENCRYPT('GitHub_Coder!2022', @key_str, @init_vector), @init_vector, 'Code repository'),
('Amazon', 'http://amazon.com', 'Andrew', 'Fletcher', 'a.flet.amazon', 'afletcher@amazon.com',
    AES_ENCRYPT('Am@zonShopper*789', @key_str, @init_vector), @init_vector, 'Shopping account'),
('Netflix', 'http://netflix.com', 'Andrew', 'Fletcher', 'afletcher.nfx', 'afletcher@netflix.com',
    AES_ENCRYPT('N3tflixP@ssword2021', @key_str, @init_vector), @init_vector, 'Streaming service'),
('Instagram', 'http://instagram.com', 'Andrew', 'Fletcher', 'drew.insta84', 'afletcher@instagram.com',
    AES_ENCRYPT('Insta_Glam!42', @key_str, @init_vector), @init_vector, 'Social media');
