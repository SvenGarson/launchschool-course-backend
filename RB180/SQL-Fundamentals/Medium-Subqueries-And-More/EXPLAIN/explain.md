Analyze the efficiency of the following SQL statement:

```sql
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```



## Analyzing the query __without actually executing it__

---

Running the query using the `EXPLAIN`keyword.

```sql
EXPLAIN
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```

The returned `query plan`is:

```text
                                QUERY PLAN                                
--------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4)
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)
(7 rows)

```

My thoughs:

- There are a few parts to this query:
  - Subquery that contains a value of `1` for each time the two compared table records have a matching `id`s.
  - `WHERE` clause that filters the virtual table to include only rows where the subquery table has at least one record
  - Select `name` of the resulting, filtered virtual table

As I read the `query plan, I can deduce the work it does, where each row is a node, i.e. a sub-process

1. A sequential scan on the `bids` table:
   - startup cost = `0.00`
   - total cost = `25.10`
   - estimated number of returned rows = `1510`
   - estimated width of rows in bytes = `4`


2. Hash Aggregate:
   - startup cost = `28.88`
   - total cost = `30.88`
   - estimated number of returned rows = `200`
   - estimated width of rows in bytes = `4`
3. Hash:
   - startup cost = `30.88`
   - total cost = `30.88`
   - estimated number of returned rows = `200`
   - estimated width of rows in bytes = `4`
4. Sequential scan on the `bidders`table:
   - startup cost = `0.00`
   - total cost = `22.70`
   - estimated number of returned rows = `1270`
   - estimated width of rows in bytes = `36`
5. Hash join:
   - startup cost = `33.38`
   - total cost = `66.47`
   - estimated number of returned rows = `635`
   - estimated width of rows in bytes = `32`

And a total of __7 rows returned__!

__My opinion without any experience__: Obviously the costs seem extremely high.
Especially since the end-result is close to the name column of the `bidders`table, just slightly filtered.

The main problem here is the wasteful and inefficient nature of the algorithm used. Explicitly, if I understand the way the SQL query runs, for every time the main query goes through a `bidders` row, __every single__ row in the `bids` table is considered. This is a lot of data to go through.

I don't know how the query plan gets to the numbers it does, but especially the `estimated number of rows returned` seems extremely high, given the small set of data that is actually contained in these tables __despite__ the fact that the query is rather inefficient. 

I suppose the reason for this is that the query plane is based on statistics and not the real data, there are much less rows returned and the query may run faster, but this shows how the query __scales__ in case the data set does get larger.

The final cost for this query is `66.47` which I don't yet know hot to interpret, but the overall algorithm/query seems very wasteful and I suppose that the `ANALYZE`ed version shows similar results, despite the fact that the data set is much smaller just because, in the end, we want to know:

- how fast the query actually runs
- how well it scales
  ​

## Analyzing the query __WITH actually executing it__

------

Running the query using `EXPLAIN`  __and__ the optional `ANALYZE` keywords:

```sql
EXPLAIN ANALYZE
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```

The returned `query plan`is:

```text
                                                     QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32) (actual time=0.026..0.028 rows=6 loops=1)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.006..0.007 rows=7 loops=1)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.016..0.016 rows=6 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.013..0.014 rows=6 loops=1)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.004..0.006 rows=26 loops=1)
 Planning time: 0.110 ms
 Execution time: 0.050 ms
(10 rows)

```

The data that is computed and shown __additional__ to the query plane __without `ANALYZE`ing__ is:

- Planning time: `0.190 ms`
- Execution time: `0.084 ms`

And another thing to note is that the __number of returned rows__ this time is `6`, which is the expected and correct number of rows, but this threw me of because I looked for the number of rows the query returned at the bottom, which is not the correct value.

__My opinion without any experience__: I am not surprised that the numbers are mostly exactly the same, because I though that the best use case for this efficiency/performance analysis based on statistics would have the main benefit of __showing the developer how well the query/algorithms scale__ which would be rather useless if it werent actually close to the truth I think.

The timings in milliseconds gives a feeling for how long, even this basic inefficient query can take. This timing changes every the query is run, so this probably depends on the available resources for the process to run on, how many and what kinds of processes are running at the moment  etc.