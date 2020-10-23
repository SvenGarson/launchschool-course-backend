Query to fetch all customer data for customers that are subscribed to at least one service:

```sql
SELECT DISTINCT
	customers.id   AS customer_id,
	customers.name AS customer_name,
	customers.payment_token AS customer_payment_token
FROM customers
INNER JOIN customers_services ON (customers.id = customers_services.customer_id)
GROUP BY customers_services.service_id, customers.id 
HAVING count(customers_services.service_id) >= 1;
```



### Re-creating the solution myself after looking at the solution

My solution can be massively simplified because the joined table does not contain any association between customers and services __if the customer is not currently subscribed to a service__.

So when using an `INNER JOIN`, the join condition fails for the rows of customers that __are not references__ from within the join table, so it can be simplified to:

```sq
SELECT DISTINCT customers.*
FROM customers
INNER JOIN customers_services ON (customers.id = customers_services.customer_id);
```

