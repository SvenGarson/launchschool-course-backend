### Enforce that the column `stars.spectral_type` must hold one of a specific list of characters and can never be `NULL`

To accomplish this we must:

- Add a `NOT NULL` constraint to the column

  ```sql
  ALTER TABLE stars ALTER COLUMN spectral_type SET NOT NULL;
  ```

- Add a `CHECK` constraint to the column that checks whether the value on record creation is valid before it is added

  ```sql
  ALTER TABLE stars
    ADD CHECK (position(spectral_type in 'OBAFGKM') > 0);
  ```

  ​

### Further exploration - Before checking

Wnen the `stars` table contains values in the `spectral_type`column that:

- are `NULL` 

  __OR__

- are invalid in terms of the set of characters we want to enforce

And we then want to change the colum constraints so that on record creation:

- `NULL` is not a valid value

  __AND__

- the character value must be one of O, B, A, F, G, K or M

__both the new__ `NOT NULL` and `CHECK` constraints __cannot be added__ because the table records contain invalid values, i.e. the __schema will not be changed before these invalid values are changed to valid values__.

In order to avoid this problem when updating the schema and because the table __contains invalid data already__ and we don't know how to update this data to match the new requirements, I would:

1. delete the records that violate the new schema

   ```sql
   DELETE FROM stars
     WHERE spectral_type IS NULL OR spectral_type NOT IN ('O', 'B', 'A', 'F', 'G', 'K', 'M');
   ```

2. apply the constraints to the table that does not contain invalid data

   ```sql
   ALTER TABLE stars ALTER COLUMN spectral_type SET NOT NULL;
   ALTER TABLE stars
     ADD CHECK (position(spectral_type in 'OBAFGKM') > 0);
   ```

   ​

