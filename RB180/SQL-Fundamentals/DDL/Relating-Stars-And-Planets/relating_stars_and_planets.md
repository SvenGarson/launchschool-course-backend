### Add Foreign Key named `star_id`to `planets`table that references `stars.id`

This Foreign key must, on record creation:

- contain a value, i.e. not be null
- the value must already exist in the referenced table on record creation

```sql
ALTER TABLE planets
ADD COLUMN star_id integer NOT NULL REFERENCES stars (id);
```



