### Determine the correct data type to use

Because the nature of the data type is not precisely defined, and the because the intended purpose of the column here seems to be one of precision up to whatever value is entered on row creation, the data type with:

- __the highest precision__
- __most flexible range__

is the data type `NUMERIC`, which when used __without__ specifying the precision and scale, accepts any number of any precision up to the documented max precision and scale dynamically.

A possible problem with this choice of data type, depending on the use o fthe data, is the computation time of mathematical operations on these numbers. They are very slow to compute as opposed to the faster to compute data types such as floats etc.

### Update the `stars.distance` column data type from integer to `NUMERIC`

```sql
ALTER TABLE stars
  ALTER COLUMN distance TYPE numeric;
```



### Further exploration - Before checking

When the data type is reset to `integer` and a record is added to the table as an integer, and we then change the column data type to `NUMERIC`, I think that the integer is converted to numeric __silently__, without a problem, as __an integer is basically of data type numeric with a precision of zero__.