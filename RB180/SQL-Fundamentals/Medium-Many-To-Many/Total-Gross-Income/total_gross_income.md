Query to determine the total gross income based on the current number associated to the numbers of customers:

```sql
SELECT SUM(price) AS gross
FROM customers_services
INNER JOIN services ON (services.id = customers_services.service_id);
```

I got to the solution by just running the query after staring at the `customers_services` table for some time, without realizing that that was the solution.