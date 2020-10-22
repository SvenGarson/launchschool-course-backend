Queries to return:

- listing of parts that currently belong to a device:

  ```sql
  SELECT part_number, device_id
  FROM parts
  WHERE device_id IS NOT NULL;
  ```

- listing of parts that don't belong to a device:

  ```sql
  SELECT part_number, device_id
  FROM parts
  WHERE device_id IS NULL;
  ```

  ​