Query to get response in the format of the expected output from the problem statement:

```sql
SELECT devices.name, parts.part_number
  FROM devices INNER JOIN parts ON (devices.id = parts.device_id)
  ORDER BY parts.part_number ASC;
```

