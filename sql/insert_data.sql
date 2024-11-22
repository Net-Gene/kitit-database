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

-- Lisää esimerkkitiedot kategorioihin
INSERT INTO categories (name, description)
VALUES ('Electronics', 'Electronic devices and gadgets'),
('Accessories', 'Device accessories and peripherals')
ON CONFLICT (name) DO NOTHING;

-- Lisää esimerkkitiedot palveluihin
INSERT INTO services (name, description, duration, price)
VALUES ('Laptop Repair', 'Comprehensive laptop repair service', 120, 49.99),
('Smartphone Repair', 'Quick smartphone diagnostics and repair', 60, 29.99)
ON CONFLICT (name) DO NOTHING;

-- Lisää esimerkkitiedot tapaamisiin
INSERT INTO appointments (user_id, staff_id, start_time, end_time, status)
VALUES (1, 2, '2024-11-23 10:00:00', '2024-11-23 11:00:00', 'Confirmed'),
(2, 1, '2024-11-24 14:00:00', '2024-11-24 15:00:00', 'Pending');

-- Lisää esimerkkitiedot tapaamisen palveluihin
INSERT INTO appointment_services (appointment_id, service_id, quantity)
VALUES (1, 1, 1), (2, 2, 1);

-- Lisää esimerkkitiedot henkilöstön saatavuuteen
INSERT INTO availability (staff_id, date, start_time, end_time)
VALUES (2, '2024-11-23', '09:00:00', '17:00:00'),
(1, '2024-11-24', '12:00:00', '18:00:00');
