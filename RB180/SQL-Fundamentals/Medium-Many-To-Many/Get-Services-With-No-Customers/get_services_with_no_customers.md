Query to fetch all services that are currently __not used by any customer__ using a `RIGHT OUTER JOIN`:

```sql
SELECT services.description
FROM customers_services
  RIGHT OUTER JOIN services
  ON (services.id = customers_services.service_id)
WHERE customers_services.customer_id IS NULL;
```



### Making the query less verbose

During the last solutions provided, I observed that many identifiers are just taken directly from the joined tables, i.e. the column names are mostly __not__ prefixed with their table names.

As I understand, this is possible, because when tables are joined, these tables are combined into a __single__ table that contains the __same exact column names for the respective column__ of the tables they originate from.

This makes the query shorter (disregarding aliasing altogether for this purpose) but can, if column names collide, cause problems.

Here the shorter version using the column names without the table names prefixed:

```sql
SELECT description
FROM customers_services
  RIGHT OUTER JOIN services
  ON (services.id = customers_services.service_id)
WHERE customer_id IS NULL;
```

