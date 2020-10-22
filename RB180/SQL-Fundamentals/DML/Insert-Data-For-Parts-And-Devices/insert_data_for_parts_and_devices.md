Add accelerometer and gyroscope:

```sql
INSERT INTO devices(name)
	VALUES ('Accelerometer'),
		   ('Gyroscope');
```

Add `3` parts for the accelerometer:

```sql
INSERT INTO parts(part_number, device_id)
	VALUES (25, 1),
	       (77, 1),
	       (954, 1);
```

Add `5` parts for gyroscope:

```sql
INSERT INTO parts(part_number, device_id)
	VALUES (151, 2),
	       (597, 2),
	       (698, 2),
	       (888, 2),
	       (119, 2);
```

Add `3` parts for a device that does not exist yet:

```sql
INSERT INTO parts(part_number, device_id)
	VALUES (948, NULL),
	       (998, NULL),
	       (167, NULL);
```



