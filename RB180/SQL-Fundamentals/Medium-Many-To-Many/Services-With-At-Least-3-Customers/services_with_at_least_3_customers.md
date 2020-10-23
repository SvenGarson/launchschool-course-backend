Query that displays the description for each service and the number of how many times, i.e. by how many customers it has been subscribed:

```sql
SELECT
  description,
  COUNT(service_id)
FROM customers_services
INNER JOIN services ON (services.id = customers_services.service_id)
GROUP BY description
HAVING count(service_id) >= 3;
```