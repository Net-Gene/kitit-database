DO
$$
DECLARE
    table_name text;
BEGIN
    -- Loop through all tables in the current schema
    FOR table_name IN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public'
    LOOP
        -- Dynamically drop each table
        EXECUTE 'DROP TABLE IF EXISTS public.' || quote_ident(table_name) || ' CASCADE';
    END LOOP;
END;
$$;

