-- Lisää esimerkkitiedot käyttäjätaulukkoon
INSERT INTO users (username, email, password_hash)
VALUES ('john_doe', 'john@example.com', 'hashed_password_here'), ('jane_doe', 'jane@example.com', 'hashed_password_here')
ON CONFLICT (username) DO NOTHING;

-- Lisää esimerkkitiedot tuotetaulukkoon
INSERT INTO products (user_id, name, description, price)
VALUES (1, 'Laptop', 'A high-performance laptop', 999.99), (2, 'Smartphone', 'A brand-new smartphone with great features', 699.99)
ON CONFLICT (id) DO NOTHING;
