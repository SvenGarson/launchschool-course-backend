Query to fetch the same data as in the previous problem but this time ordered by descending alphabetical order:

```
SELECT
  devices.name AS device_name,
  COUNT(parts.device_id) AS number_of_parts
FROM devices LEFT OUTER JOIN parts ON (devices.id = parts.device_id)
GROUP BY devices.name
ORDER BY devices.name DESC;
```