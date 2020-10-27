Create the database:

```sql
/* from the terminal outside any REPL*/
createdb auction
```

Connect to the `auction` database:

```sql
/* from the terminal outside any REPL*/
psql -d auction
```

Create the `bidders` table:

```sql
CREATE TABLE bidders(
  id serial PRIMARY KEY,
  name text NOT NULL
);
```

Create `items` table:

```sql
CREATE TABLE items(
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6, 2) NOT NULL CHECK(initial_price BETWEEN 0.01 AND 1000.00),
  sales_price numeric(6, 2) CHECK(sales_price BETWEEN 0.01 AND 1000.00)
);
```

Create `bids` table:

```sql
CREATE TABLE bids(
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount numeric(6, 2) NOT NULL CHECK (amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);
```

Copy data from `csv` files to the respective database tables:

```text
/* psql REPL connected to the auction database */
/* current directory in directory that contains the csv files */
/* bidders and items must be added before referencing them in the bids table */
\copy bidders FROM 'bidders.csv' WITH CSV HEADER
\copy items FROM 'items.csv' WITH CSV HEADER
\copy bids FROM 'bids.csv' WITH CSV HEADER
```

