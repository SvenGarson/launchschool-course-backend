Query to show item name along with how many bids are placed on it using a scalar subquery to determine the number of bids on a particular item:

```sql
/* scalar query to select number of bids for specific item id */
SELECT count(item_id) FROM bids WHERE item_id = desired_id;

/* the actual query that draws the number of bids from the subquery and displays */
/* the expected data */
SELECT
  items.name,
  (SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;
```



### Further exploration

Query with the exact same result as aboce but __without using subqueries using a `LEFT OUTER JOIN`__:

```sql
SELECT
  items.name,
  count(bids.item_id)
FROM items LEFT OUTER JOIN bids ON (items.id = bids.item_id)
GROUP BY bids.item_id, items.name
ORDER BY bids.item_id;
```

