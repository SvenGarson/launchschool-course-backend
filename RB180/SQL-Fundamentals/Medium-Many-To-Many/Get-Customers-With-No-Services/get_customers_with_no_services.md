Query to fetch customer data from customers that are currently __not subscribed__ to any service(s):

```sql
SELECT DISTINCT customers.*
  FROM customers LEFT OUTER JOIN customers_services
  ON (customers.id = customers_services.customer_id)
WHERE customers_services.service_id IS NULL;
```



### Further exploration

Write a query that displays:

- all customers with __no services__
- all customers __with services__

```sql
SELECT DISTINCT customers.*, services.*
FROM customers
FULL OUTER JOIN customers_services
  ON (customers.id = customers_services.customer_id)
FULL OUTER JOIN services
  ON (services.id = customers_services.service_id)
WHERE (customers.id IS NULL) OR (services.id IS NULL);
```