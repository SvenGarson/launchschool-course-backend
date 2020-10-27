Approach to write a query to show all items that have had bids on them using a subquery and the `IN` operator:

1. Get list of all `ìtem_id`s  from the bids wothout duplicates. The following will be the subquery:

   ```sql
   SELECT DISTINCT item_id FROM bids;
   ```

2. Show every item name that has an id that occurs in the id list from step `1`:

   ```sql
   SELECT name AS "Bid on Items" FROM items
   WHERE id IN (SELECT DISTINCT item_id FROM bids);
   ```

   ​