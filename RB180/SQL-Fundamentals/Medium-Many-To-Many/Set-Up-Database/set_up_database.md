Crate the `biling`database:

```
/* from terminal outside any REPL */
createdb billing
```

Connect to the `billing` database:

```
/* from terminal outside any REPL */
psql -d billing
```

Create the `customers` table:

```sql
CREATE TABLE customers(
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) CHECK (payment_token ~ '[A-Z]{8}')
);
```

Create the `services` table:

```sql
CREATE TABLE services(
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL CHECK (price >= 0.00)
);
```

Adding the data to the tables:

```sql
INSERT INTO customers(name, payment_token)
  VALUES
    ('Pat Johnson'  , 'XHGOAHEQ'),
    ('Nancy Monreal', 'JKWQPJKL'),
    ('Lynn Blake'   , 'KLZXWEEE'),
    ('Chen Ke-Hua'  , 'KWETYCVX'),
    ('Scott Lakso'  , 'UUEAPQPS'),
    ('Jim Pornot'   , 'XKJEYAZA');
    
INSERT INTO services(description, price)
  VALUES
    ('Unix Hosting'       , 5.95),
    ('DNS'                , 4.95),
    ('Whois Registration' , 1.95),
    ('High Bandwidth'     , 15.00),
    ('Business Support'   , 250.00),
    ('Dedicated Hosting'  , 50.00),
    ('Bulk Email'         , 250.00),
    ('One-to-one Training', 999.00);
```

Creating the join table to establish a Many-To-Many relationship between `customers` and `services`:

```sql
CREATE TABLE customers_services(
  id serial PRIMARY KEY,
  customer_id integer REFERENCES customers (id) ON DELETE CASCADE,
  service_id integer REFERENCES services (id),
  UNIQUE(customer_id, service_id)
);
```

Associate customers with the respective services:

```sql
INSERT INTO customers_services(customer_id, service_id)
  VALUES
    (1, 1), (1, 2), (1, 3),
    (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),  
    (4, 1), (4, 4),
    (5, 1), (5, 2), (5, 6),
    (6, 1), (6, 6), (6, 7);
```


__Fixing my mistakes__:

- Adding `NOT NULL` constraint to the `customers.payment_token` column:

  ```sql
  ALTER TABLE customers ALTER COLUMN payment_token SET NOT NULL;
  ```

- Adding `UNIQUE` constraint to the `customers.payment_token` column:

  ```sql
  ALTER TABLE customers ADD CONSTRAINT payment_token_unique UNIQUE (payment_token);
  ```

- Marking the start and end of line in the `customers.payment_token` pattern:

  ```sql
  ALTER TABLE customers DROP CONSTRAINT customers_payment_token_check;
  ALTER TABLE customers ADD CHECK (payment_token ~ '^[A-Z]{8}$');
  ```

- Adding `NOT NULL` constraints on `customers_services.customer_id` and `customers_services.service_id`:

  ```sql
  ALTER TABLE customers_services ALTER COLUMN customer_id SET NOT NULL;
  ALTER TABLE customers_services ALTER COLUMN service_id SET NOT NULL;
  ```

   