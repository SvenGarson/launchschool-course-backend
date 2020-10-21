### Change the `stars.name` column to support strings up to a length of 50 instead of  25

```sql
ALTER TABLE stars
  ALTER COLUMN name TYPE varchar(50);
```



### Further exploration - Before checking

Without looking it up, because we have an original max string length of 25 and update the schema to contain strings with length of up to 50, any data in the olf schema fits the requirements of the updated schema and no error should be thrown.

### Further exploration - After checking

The data is indeed kept as is without any error or warning.

