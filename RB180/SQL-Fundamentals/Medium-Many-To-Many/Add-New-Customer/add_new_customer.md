Add the new customer to the database:

```sql
INSERT INTO customers(name, payment_token)
  VALUES('John Doe', 'EYODHLCN');
```

Associate the new customer with the services:

```sql
INSERT INTO customers_services(customer_id, service_id)
	VALUES (7, 1),
		   (7, 2),
		   (7, 3);
```

