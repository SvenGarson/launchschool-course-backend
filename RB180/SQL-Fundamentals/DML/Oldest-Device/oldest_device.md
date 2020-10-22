Query to fetch the name of the oldest device:

```sql
SELECT name AS oldest_device
FROM devices
ORDER BY created_at ASC
LIMIT 1;
```

