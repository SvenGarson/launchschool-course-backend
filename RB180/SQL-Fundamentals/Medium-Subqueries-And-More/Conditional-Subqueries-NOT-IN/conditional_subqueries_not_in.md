Appraoch for query that shows all items that have __not__ had put bids on them using the operator `NOT IN` and a subquery.
We can use the exact same approach than in the previous exercise, but instead of cheking for data intersection, we check for data that does __not__ intersect:

1. Using a subquery, get a list of unique item ids that have been bid on:

   ```sql
   SELECT DISTINCT item_id FROM bids;
   ```

2. Select item names which have an id that does not occur in the list returned by the subquery from step `1`:

   ```sql
   SELECT name AS "Not Bid on" FROM items
   WHERE id NOT IN (SELECT DISTINCT item_id FROM bids);
   ```

   ​