import psycopg2
from psycopg2 import sql


def execute_sql_file(connection, file_path):
    """Suorittaa SQL-komentoja tiedostosta."""
    with open(file_path, 'r') as file:
        sql_commands = file.read()
    with connection.cursor() as cursor:
        cursor.execute(sql_commands)
    connection.commit()


def main():
    # Database connection details
    db_config = {
        "dbname": "kit_it_db",
        "user": "postgres",
        "password": "admin",
        "host": "localhost",
        "port": 5432
    }

    # Connect to the PostgreSQL database
    try:
        conn = psycopg2.connect(**db_config)
        print("Tietokanta yhdistetty onnistuneesti.")

        # # Execute SQL files
        # execute_sql_file(conn, 'sql/create_tables.sql')
        # execute_sql_file(conn, 'sql/insert_data.sql')

        # print("SQL-skriptit suoritettu onnistuneesti.")
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        if conn:
            conn.close()
            print("Tietokantayhteys suljettu.")


if __name__ == "__main__":
    main()
