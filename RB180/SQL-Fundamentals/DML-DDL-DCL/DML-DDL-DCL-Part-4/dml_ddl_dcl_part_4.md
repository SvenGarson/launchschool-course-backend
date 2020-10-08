The SQL statement:

```sql
ALTER TABLE things
DROP CONSTRAINT things_item_key;
```

uses the `DDL` - Data Definition Sub-Language because:

- `ALTER TABLE` changes the structure of a table
- `DROP CONSTRAINT` deletes a constraint from the table

where these operations have the mentioned effect on the database `schema`.