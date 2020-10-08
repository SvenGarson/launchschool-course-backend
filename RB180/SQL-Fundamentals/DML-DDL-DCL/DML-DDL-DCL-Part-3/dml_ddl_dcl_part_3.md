The SQL statement:

```sql
CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
```

uses the `DDL` - Data Definition Sub-Language because this statement:

- `CREATE`s a table in a database
- __defines the structure__ of that created table and along with that __the database schema__ by defining:
  - column and table field names
  - column data types
  - column and table constraints