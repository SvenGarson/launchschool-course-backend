Create `birds` table inside `animals`database with the following table fields:

- id - Primary Key -
- name - varchar(25)
- age - integer
- species - varchar(15)

```sql
CREATE TABLE birds(
  id serial PRIMARY KEY,
  name varchar(25),
  age integer,
  species varchar(15)
);
```

