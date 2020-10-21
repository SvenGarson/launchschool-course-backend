### Creating the database using a PostgreSQL client application
```text
/* from the terminal outside any REPL */
createdb extrasolar
```

### Creating the two tables
1. After connecting to the `extrasolar` database from the terminal using:

   ```text
   /* from the terminal outside any REPL */
   psql extrasolar
   ```

2. Create the `stars`table and define it's schema

   ```sql
   CREATE TABLE stars(
     id serial PRIMARY KEY,
     name varchar(25) UNIQUE NOT NULL,
     distance integer NOT NULL CHECK (distance > 0),
     spectral_type char,
     companions integer NOT NULL CHECK (companions >= 0)
   );
   ```

3. Create the `planets` table:

   ```sql
   CREATE TABLE planets(
     id serial PRIMARY KEY,
     designation char,
     mass integer
   );
   ```

   ​