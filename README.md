# Tietokantavarasto Kit-IT:lle

Tämä arkisto sisältää Kit-IT-projektin tietokannan asetukset ja skeeman. Se sisältää rakenteen, kokoonpanon ja siirtokomentosarjat taustajärjestelmässä käytettävän tietokannan hallintaan.

## Sisällysluettelo
- [Käytetyt tekniikat](#teknologiat-käytetty)
- [Tietokannan asetukset](#database-setup)
- [Tietokannan skeema](#schema-structure)
- [Siirrot ja tietokannan luonti](#running-the-migrations)
- [Osallistuminen](#contributing)

## Käytetyt tekniikat
- **PostgreSQL**
- **psycopg2** (PostgreSQL yhteys kirjasto)
- **Drizzle ORM** 
- Tietokannan siirtotyökalut, kuten `psycopg2` tai ORM:ien omat siirtotyökalut

## Tietokannan asetukset

### Vaihe 1: Kloonaa arkisto

Kloonaa tämä arkisto koneellesi ja siirry `database`-hakemistoon:

````
git clone <repository-url> cd database
````


### Vaihe 2: Asenna riippuvuudet

Asenna tarvittavat riippuvuudet Pythonin avulla:
````
pip install -r requirements.txt
````
### Vaihe 3: Konfiguroi tietokanta

Avaa ja muokkaa `main_app.py` tiedostoa, ja aseta oikeat tietokannan yhteystiedot:
````
db_config = { "dbname": "your_database", "user": "your_user", "password": "your_password", "host": "localhost", "port": 5432 }
````


### Vaihe 4: Suorita taulut ja siirrot

Suorita `main_app.py` tiedosto luodaksesi taulut ja lisätäksesi esimerkkidata:
````
python main_app.py
````

Tämä suorittaa SQL-koodit `sql/create_tables.sql` ja `sql/insert_data.sql`, luoden tarvittavat taulut ja lisäämällä esimerkkidataa.

## Tietokannan skeema

Tietokannan skeema sisältää seuraavat taulut:

- **users**: Sisältää käyttäjien tunnistautumistiedot (käyttäjätunnus, sähköposti, salasana).
- **products**: Sisältää tuotteet, joissa on linkki käyttäjään, joka omistaa tuotteen.

### users-taulu:
````
CREATE TABLE IF NOT EXISTS users ( 
                            id SERIAL PRIMARY KEY, 
                            username VARCHAR(50) NOT NULL UNIQUE, 
                            email VARCHAR(100) NOT NULL UNIQUE, 
                            password_hash VARCHAR(255) NOT NULL, 
                            created_at TIMESTAMP DEFAULT NOW(), 
                            updated_at TIMESTAMP DEFAULT NOW() 
                            );
````

### products-taulu:
````
CREATE TABLE IF NOT EXISTS products ( 
                            id SERIAL PRIMARY KEY, user_id INT NOT NULL, 
                            name VARCHAR(100) NOT NULL, 
                            description TEXT, 
                            price DECIMAL(10, 2) NOT NULL, 
                            created_at TIMESTAMP DEFAULT NOW(), 
                            updated_at TIMESTAMP DEFAULT NOW(), 
                            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE );
````

## Siirrot ja tietokannan luonti

Siirtokomentosarjat (migrations) suoritetaan `main_app.py` -tiedostossa, joka käynnistää taulujen luontikomentosarjat ja lisää esimerkkidataa `sql/create_tables.sql` ja `sql/insert_data.sql` tiedostoista. Tämä varmistaa, että tietokanta on ajan tasalla.

## Osallistuminen

1. Tee oma haara (branch) ja tee muutokset.
2. Testaa muutoksesi paikallisesti.
3. Tee **pull request** GitHubiin.
