### Modify the `planets.mass` column schema so that it can represent fractional numbers to any degree of precision needed at the point of record creation

In order to accomplish this, we must:

1. Change/re-define the `planets.mass` column data type

   ```sql
   ALTER TABLE planets
     ALTER COLUMN mass
     SET DATA TYPE numeric;
   ```

2. Add `NOT NULL` constraints to both the columns `mass` and `designation`:

   ```sql
   ALTER TABLE planets ALTER COLUMN mass SET NOT NULL;
   ALTER TABLE planets ALTER COLUMN designation SET NOT NULL;
   ```

3. Add `CHEK`constraint so that the mass can only contain positive values:

   ```sql
   ALTER TABLE planets ADD CHECK (mass > 0.0);
   ```


I chose the `numeric` data type, as in a previous exercise since, again, the column should hold:

- fractional values up to __any degree of precision required__
- __no specific range__ of values __is required__ for both the scale and precision of the value

So the best choice here in my opinion, in terms of data type, is `numeric`, __without__ specifying the scale and precision so that values of any scale and any precision can be set on record creation.

