Query to fetch all __customer name__ along with a __list of services they use__, including that same relationship and format for __customers that currently use no service__:

```sql
SELECT DISTINCT
  customers.name,
  STRING_AGG(services.description, ', ') AS services
FROM customers_services
INNER       JOIN services  ON (services.id = customers_services.service_id)
RIGHT OUTER JOIN customers ON (customers.id = customers_services.customer_id)
GROUP BY customers.name;
```