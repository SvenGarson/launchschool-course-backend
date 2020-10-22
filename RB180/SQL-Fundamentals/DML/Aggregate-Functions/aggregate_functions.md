Query to fetch the specified data:

```sql
SELECT devices.name, COUNT(parts.device_id) AS number_of_parts
FROM devices LEFT OUTER JOIN parts ON (devices.id = parts.device_id)
GROUP BY parts.device_id, devices.name;
```

