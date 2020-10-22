### Define a new `semi_major_axis` column on the `planets` table of data type `numeric` and require that a value is specified on record creation

Create the `semi_major_axis` column with `numeric`as data type:

```sql
ALTER TABLE planets
  ADD COLUMN semi_major_axis numeric NOT NULL DEFAULT 0.0;
```



### Furtther exploration - Before checking 

- __What happens when the table already contains one or more rows and the SQL statement above is ran?__
  When we add a new column when the table already contains one or more records __and the column does not have a `DEFAULT` value specified__, the `NOT NULL` requirement keeps us from adding the new column because without a default value, no value for this specific column is specified per row.

- __What needs to be done differently for the desired result?__
  The most sensible thing to do, that also solves the problem, is to __define a default__ value.
  The following SQL statement add the new column and also provides a default value for each record:

  ```sql
  ALTER TABLE planets
    ADD COLUMN semi_major_axis numeric NOT NULL DEFAULT 0.0;
  ```

  ​

  ​



