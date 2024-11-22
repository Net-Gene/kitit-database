-- Luo käyttäjätaulukko
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Luo tuotetaulukko
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

--Ostosten seurantaan. 
--Tämä yhdistää käyttäjät ostamiinsa tuotteisiin ja seuraa niiden tilaa.


CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL, --Tilauksen kokonaishinta
    status VARCHAR(20) DEFAULT 'Pending', --esim. Odottaa, Valmis, Peruutettu
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

--Tukea usean tuotteen tilauksia.


CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL, --Hinta ostohetkellä
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
);

--Jos tuoteluokat kasvavat tai vaativat kuvauksia, 
--tämä taulukko hallitsee niitä erikseen.

CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

--Tämä taulukko seuraa kaikkia sovittuja tapaamisia.


CREATE TABLE IF NOT EXISTS appointments (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL, --Asiakas varaa ajan
    staff_id INT NOT NULL, --Tapaamiseen määrätty toimihenkilö
    start_time TIMESTAMP NOT NULL, --Tapaamisen alkamisaika
    end_time TIMESTAMP NOT NULL, --Tapaamisen päättymisaika
    --esim. Odottaa, Vahvistettu, Peruutettu
    status VARCHAR(20) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES users (id) ON DELETE CASCADE
);

--Tämä taulukko tallentaa henkilöstön jäsenten saatavuusajat.


CREATE TABLE IF NOT EXISTS availability (
    id SERIAL PRIMARY KEY,
    staff_id INT NOT NULL, --Työntekijän henkilöllisyystodistus
    date DATE NOT NULL, --Saatavuuspäivä
    start_time TIME NOT NULL, --Vapaana olevan paikan alkamisaika
    end_time TIME NOT NULL, --Käytettävissä olevan paikan päättymisaika
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (staff_id) REFERENCES users (id) ON DELETE CASCADE
);

--Pidä ja määritä erilaisia ​​palvelutyyppejä.


CREATE TABLE IF NOT EXISTS services (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE, --Palvelun nimi, Ainutlaatuinen
    description TEXT, --Valinnainen palvelun kuvaus
    duration INT NOT NULL, --Kesto minuutteina
    price DECIMAL(10, 2) NOT NULL, --Palvelun hinta
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

--Tämä taulukko edustaa tapaamisten ja palvelujen välistä useasta useaan -suhdetta, jolloin tapaamiseen voi sisältyä useita palveluita.

CREATE TABLE IF NOT EXISTS appointment_services (
    id SERIAL PRIMARY KEY,
    appointment_id INT NOT NULL, -- Viittaa tapaamiseen
    service_id INT NOT NULL, --Viittaa palveluun
    quantity INT NOT NULL DEFAULT 1, -- Palvelun käyttökertojen määrä ajanvarauksella
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (appointment_id) REFERENCES appointments (id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services (id) ON DELETE CASCADE
);
