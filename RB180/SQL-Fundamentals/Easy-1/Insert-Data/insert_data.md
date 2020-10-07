```sql
INSERT INTO birds(name, age, species)
  VALUES
    ('Charlie', 3, 'Finch'),
    ('Allie', 5, 'Owl'),
    ('Jennifer', 3, 'Magpie'),
    ('Jamie', 4, 'Owl'),
    ('Roy', 8, 'Crow');
```



### Further exploration

`INSERT INTO` does not require the column names if we add data for all columns in the order they are define for that particular table, which in this case would be:

```sql
INSERT INTO birds
VALUES(1, 'Charlie', 5, 'Owl');
```

