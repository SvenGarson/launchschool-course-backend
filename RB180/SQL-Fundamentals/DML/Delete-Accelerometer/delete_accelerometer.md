Deleting the `Accelerometer` device as well as all parts that belong to that device:

```sql
/* Deleting all records where the device_id id matches the Accelerometer device id */
/* Use sub-query to determine the device_id that is associated with the Accelerometer */
DELETE FROM parts
WHERE device_id = (SELECT id FROM devices WHERE name = 'Accelerometer');

/* Delete the Acceleromter device itself */
DELETE FROM devices
WHERE name = 'Accelerometer';
```



### Further exploration

This is a great use case for `ON DELETE CASCADE`, which would have enabled us to just delete the device in the `devices` table, which would have cascaded up to delete any record in other tables that reference this device id.

In order for this to work, we would have to:

1. add an `ON DELETE CASCADE` constraint to the `parts.device_id` column that references the `devices.id` column
2. just delete the Accelerometer record from the `devices` table, which automatically deletes all records that reference this specific device id.