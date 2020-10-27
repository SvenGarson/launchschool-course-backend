Approach for query that returns a list of names for __everyone who has bid in the auction__ using the `EXISTS` clause and a subquery:

```sql
SELECT name FROM bidders
WHERE EXISTS (SELECT bidder_id FROM bids WHERE bidder_id = bidders.id);
```



### Further exploration

Query to return the exact same results as above __without__ subquery __but using a JOIN__:

```sql
SELECT bidders.name FROM bidders
INNER JOIN bids ON (bidders.id = bids.bidder_id)
GROUP BY bidders.id
ORDER BY bidders.id;
```





