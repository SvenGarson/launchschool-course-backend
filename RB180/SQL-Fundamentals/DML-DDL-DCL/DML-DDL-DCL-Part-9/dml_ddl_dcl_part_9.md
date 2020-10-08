The SQL statement:

```sql
DROP DATABASE xyzzy;
```

is a tricky one without lookin it up because:

- The database __could contain tables__ and __data along with these tables__
- The __database itself does not hold any data directly__, but is __enabled to hold onto data through tables__

Considering these points I would say that this particular SQL statement is the `DDL` - Data Definition Sub-Language because it does not delete specific data explicitly (it may not even contain tables and with data data) but rather __deletes a database as in a schema__ that acts as structure defining container for everything else.