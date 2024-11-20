# Tietokantavarasto Kit-IT:lle

Tämä arkisto sisältää Kit-IT-projektin tietokannan asetukset ja skeeman. Se sisältää rakenteen, kokoonpanon ja siirtokomentosarjat taustajärjestelmässä käytettävän tietokannan hallintaan.

## Sisällysluettelo
- [Käytetyt tekniikat](#teknologiat-käytetty)
- [Tietokannan asetukset](#database-setup)
-
[Schema Structure](#schema-structure)
- [Running the Migrations](#running-the-migrations)
- [Osallistuminen](#contributing)

## Käytetyt tekniikat
- PostgreSQL / MySQL / SQLite (Valitse käyttämäsi tietokanta)
- Sequelize / TypeORM / Drizzle ORM (tai valitsemasi ORM)
- Tietokannan siirtotyökalut (esim. Knex.js, TypeORM-siirrot)

## Tietokannan asetukset

Kloonaa arkisto:
   ```
   git clone <repository-url>
   cd database
   ```

## Käynnistä tietokanta
   ```
   npx run dev
   ```
