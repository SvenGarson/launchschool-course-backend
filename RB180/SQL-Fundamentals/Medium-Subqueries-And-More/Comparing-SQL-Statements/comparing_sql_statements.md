Running both queries with the `EXPLAIN ANALYZE` options:

The supposedly __more efficient__ query:

```
EXPLAIN ANALYZE
SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;
```

Query plan:

```text
                                                  QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.016..0.016 rows=1 loops=1)
   ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.013..0.014 rows=6 loops=1)
         Group Key: bids.bidder_id
         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.004..0.006 rows=26 loops=1)
 Planning time: 0.060 ms
 Execution time: 0.041 ms
(6 rows)

```

__Data points__:

- actual cost: `37.16`
- rows: `1`
- Planning time: `0.060`milliseconds
- Execution time: `0.041` milliseconds
- Total time = planning + execution = `0.101` milliseconds

---

The supposedly __less efficient__ query:

```
EXPLAIN ANALYZE
SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;
```

Query plan:

```text
                                                     QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
 Limit  (cost=35.65..35.65 rows=1 width=12) (actual time=0.027..0.027 rows=1 loops=1)
   ->  Sort  (cost=35.65..36.15 rows=200 width=12) (actual time=0.026..0.026 rows=1 loops=1)
         Sort Key: (count(bidder_id)) DESC
         Sort Method: top-N heapsort  Memory: 25kB
         ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.014..0.016 rows=6 loops=1)
               Group Key: bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.005..0.006 rows=26 loops=1)
 Planning time: 0.096 ms
 Execution time: 0.050 ms
(9 rows)

```

__Data points__:

- actual cost: `35.65`
- rows: `1`
- Planning time: `0.096`milliseconds
- Execution time: `0.050` milliseconds
- Total time = planning + execution = `0.146` milliseconds



### Comparison between the two queries

---

|                    | Data point first query - fastest | Data points second query - slowest |
| ------------------ | -------------------------------- | ---------------------------------- |
| __Actual cost__    | 37.16                            | 35.65                              |
| __Planning time__  | 0.060                            | 0.096                              |
| __Execution time__ | 0.041                            | 0.050                              |
| __Total time__     | 0.101                            | 0.146                              |

Things to note based on the query plans and the compared data points in the above table:

- The query plan of the __first__ query:
  - shows __less nodes__ for that particular query
  - shows a __less deep nesting__ of nodes
  - shows lower planning and execution time

Interestingly, the __cost of the faster query is higher than the cost of the slower query__.
I think the reason for this is that, because the faster query has __less__ sub-steps/sub-processes/nodes, the operations themselves are a little more complicated and/or require more data do be moved/generated etc in order to account for that particular algorithm.

The first query is faster in terms of timing, which is what matters in the end in terms of a __faster__ query, but may not necessarily be the 'best' query depending in the requirements and the environment, as usually we are choosing between trade-offs between computation speed and the space needed to do so.

So I think that the __first__ query is a bit more efficient because:

- It has less sub-processes to execute
- Les context switching between these processes, which in other words means, the potential cost of going from one process to another
- Less data to establish/copy/compute and tables to generate and populate

And the reason the __second__ query is a bit less efficient:

- It has more sub-processes
- More tables to generate as the query goes from one process to another



### Further exploration

The query using a `scalar subquery`:

```sql
/* Using a subquery */
SELECT name,
       (SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;
```

The query re-written to return the same exact result but without using a subquery:

```sql
/* Using a JOIN */
SELECT
  items.name,
  count(bids.item_id)
FROM items LEFT OUTER JOIN bids ON (items.id = bids.item_id)
GROUP BY bids.item_id, items.name
ORDER BY bids.item_id;
```

Comparing the times and cost of these two statements above:

```sql
EXPLAIN ANALYZE SELECT name,
       (SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;
```

```sql
EXPLAIN ANALYZE SELECT
  items.name,
  count(bids.item_id)
FROM items LEFT OUTER JOIN bids ON (items.id = bids.item_id)
GROUP BY bids.item_id, items.name
ORDER BY bids.item_id;
```

|                    | startup cost | total cost | planning time (ms) | execution time (ms) | total time (ms) |
| ------------------ | ------------ | ---------- | ------------------ | ------------------- | --------------- |
| __Using subquery__ | 0.00         | 25455.20   | 0.076              | 0.066               | 0.142           |
| __Using a JOIN__   | 138.62       | 168.82     | 0.113              | 0.084               | 0.197           |

In my case, the __query with using the qubsquery is faster than using JOIN__.

The interesting part here is that the `JOIN` has a big `statup cost` whereas the subquery has not startup cost but a very high total cost and the query that contains the subquery still ends up being faster.

After a bit of research I found that the cost can sometimes be extremely high, even into the millions because the server tries to optimize in specific ways and tries to avoid operations like sequential scans if at all possible and then logs back costs based on whether things could be optimized for or not.

Right now I feel like that is interesting but not worth to spend time on researching any further.