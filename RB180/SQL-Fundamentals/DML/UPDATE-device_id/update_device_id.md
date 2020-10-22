Re-associate the last two parts that currently belong to the device number `2`, i.e. the `Gyroscope` to the device number `1`, i.e. the `Accelerometer`.

```sql
UPDATE parts
  SET device_id = 1
WHERE id = 8 OR id = 9;
```



### Further exploration

In order to associate the part with the __smallest `part_number`__ with the `Gyroscope` i.e. the device with the id `2`:

1. Use a sub-query in the `WHERE`clause in order to determine the lowest `part_number`

   ```sql
   SELECT min(part_number) FROM parts;
   ```

2. Use this lowest part number from the previous sub-query to update only record that have this exact part_number:

   ```sql
   UPDATE parts
     SET device_id = 2
   WHERE part_number = (SELECT min(part_number) FROM parts);
   ```







