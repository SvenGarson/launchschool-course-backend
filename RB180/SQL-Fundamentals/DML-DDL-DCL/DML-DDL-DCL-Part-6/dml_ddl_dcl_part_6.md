The SQL statement:

```sql
UPDATE things
SET material = 'plastic'
WHERE item = 'Cup';
```

uses the `DML` - Data Manipulation Sub-Language because:

- the statements manipulates data in that it `UPDATE`s a specific record column, __if__ the operation is successful.
- `UPDATE` is part of the `CRUD`operations
- the table __structure__ and database __schema__ are __not changed in any way__