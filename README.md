# Database Repository for Kit-IT 🏛️

This repository contains the Database code for **Kit-IT**, a school project focused on building a web service platform for IT service management.

---

## Project Summary (School Context)

Kit-IT is a fictional IT service company. The project includes:

- Account registration and login (JWT-based auth)
- Appointment booking and service browsing
- Real-time customer support via chat
- User data and order management

---

## Tech Stack Used 🛠️

- **PostgreSQL**
- **psycopg2** – PostgreSQL database adapter for Python
- **Drizzle ORM**
- Database migration tools such as `psycopg2` scripts or ORM-specific migration utilities

---

## Getting Started

### Step 1: Clone the Repository

Clone this repository and navigate to the `database` directory:

````bash
git clone <repository-url>
cd database
````
### Step 2: Install Dependencies

Install required Python dependencies:


````
pip install -r requirements.txt
````

### Step 3: Configure the Database

Open the `main_app.py` file and configure your database connection:

````
db_config = {
  "dbname": "your_database",
  "user": "your_user",
  "password": "your_password",
  "host": "localhost",
  "port": 5432 }
````


### Step 4: Run Migrations and Seed Data

Execute the following to create tables and insert sample data:

````bash
python main_app.py
````


This runs the SQL scripts `sql/create_tables.sql` and `sql/insert_data.sql`, which create the necessary tables and insert example records.

---

## Database Schema

### `users` table:
> Stores user credentials (username, email, password)
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

### `products` table:
> Stores products with a reference to the owning user
````
CREATE TABLE IF NOT EXISTS products (     
  id SERIAL PRIMARY KEY,     
  user_id INT NOT NULL,     
  name VARCHAR(100) NOT NULL,     
  description TEXT,     
  price DECIMAL(10, 2) NOT NULL,     
  created_at TIMESTAMP DEFAULT NOW(),     
  updated_at TIMESTAMP DEFAULT NOW(),     
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE 
);
````

---

## Migrations and Table Creation

Migration logic is handled inside `main_app.py`, 
which loads and executes SQL commands from `sql/create_tables.sql` and `sql/insert_data.sql`. 

This ensures the database schema and initial data are always up to date.


> ⚠️ This project is part of a **school assignment** intended for learning and educational purposes only. It is **not intended for real-world business use** and is not in active production.
