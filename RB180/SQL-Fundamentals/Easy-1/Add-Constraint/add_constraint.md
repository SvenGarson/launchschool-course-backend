This is done by altering the table and adding a `CHECK` constraint, which checks specific values __before__ the record is added to the table. 
The record is only added if __the check constraints returns true for the values to be added__, and raises an error otherwhise.

```sql
ALTER TABLE birds ADD CONSTRAINT check_age CHECK(age > 0);
```


__Note:__ When adding a column constraint, it can be named, like we did with `check_age` in the SQL statement above.

Given the constraint we just added, we cannot add records where the age is:

- __negative__

  ```sql
  INSERT INTO birds VALUES(10, 'Coco', -2, 'Falcon');
  ```

- __zero__

  ```sql
  INSERT INTO birds VALUES(25, 'Meep', 0, 'Pigeon');
  ```