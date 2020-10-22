Creating the `moons` table and creating a Foreign Key that references the `planets.id` column.

```sql
CREATE TABLE moons(
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  planet_id integer NOT NULL REFERENCES planets (id)
);
```
