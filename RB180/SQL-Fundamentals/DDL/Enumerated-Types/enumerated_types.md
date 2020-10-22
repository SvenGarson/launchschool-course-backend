### Re-define the `stars.spectral_type` column `CHECK`constraint to use an `enumerated data type`

Replace the current `CHECK` constraint by:

1. Make sure we carry over all the current constraints by checking the column scheme. Currently the `spectral_type` column has the constraints:

   - `NOT NULL`
   - The single character value must be one of O, B, A, F, G, K or M.

2. Deleting the current `CHECK` constraint 

   ```sql
   ALTER TABLE stars DROP CONSTRAINT stars_spectral_type_check;
   ```

3. Define/create a new enumerated type that represents the supported/valid values:

   ```sql
   CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');
   ```

4. Re-define the data type of the `spectral_type`column to be `spectral_class`

   ```sql
   ALTER TABLE stars
     ALTER COLUMN spectral_type
     SET DATA TYPE spectral_type_enum
     USING spectral_type::spectral_type_enum;
   ```

5. The `NOT NULL` constraint is still present in the schema of the `spectral_type`column.
   So nothing to do here.

