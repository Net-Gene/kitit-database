-- Lisää esimerkkitiedot käyttäjätaulukkoon
INSERT INTO users (username, email, password_hash)
VALUES ('john_doe', 'john@example.com', 'hashed_password_here'),
('jane_doe', 'jane@example.com', 'hashed_password_here')
RETURNING id;

-- Lisää esimerkkitiedot tuotetaulukkoon
INSERT INTO products (user_id, name, description, price)
VALUES (1, 'Laptop', 'A high-performance laptop', 999.99),
(2, 'Smartphone', 'A brand-new smartphone with great features', 699.99);

-- Lisää esimerkkitiedot tilaukset-taulukkoon
INSERT INTO orders (user_id, total_price, status)
VALUES (1, 999.99, 'Pending'), (2, 699.99, 'Completed');

-- Lisää esimerkkitiedot tilauksen tuotteet -taulukkoon
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (1, 1, 1, 999.99), (2, 2, 1, 699.99);
