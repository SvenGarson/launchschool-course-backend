Query to compute:

- ... amount of expected income from services that cost __more than 100$__:

  ```sql
  SELECT sum(price)
  FROM customers_services
  INNER JOIN services ON (services.id = customers_services.service_id)
  WHERE price > 100.00;
  ```

- ... maximum income of the company if every customer subscribed to __all__ services that cost __more than 100$__:

  ```sql
  SELECT sum(price) FROM customers
  CROSS JOIN services
  WHERE price > 100.0;
  ```



### Further exploration

- Generate data for testing with unexpected results
- Generating data in order to use all possible combinations as tool to generate random user names, or concatenate all sorts of data such as stories for instance.