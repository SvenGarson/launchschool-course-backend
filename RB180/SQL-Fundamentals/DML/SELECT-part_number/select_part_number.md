Query to get all `parts` columns  which have a `part_number` that starts with a `3`:

```sql
SELECT * FROM parts WHERE left(part_number::text, 1) = '3';
```

