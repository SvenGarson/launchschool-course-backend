Query to determine the `id` for the item we have specific information for __without using the `AND` keyword__:

```sql
SELECT id from items
WHERE ROW('Painting', 100.00, 250.00) = ROW(name, initial_price, sales_price);
```

