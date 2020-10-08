The SQL statement:

```sql
CREATE SEQUENCE part_number_sequence;
```

is part of the `DDL` - Data Definition Sub-Language.

The [PostgreSQL documentation](https://www.postgresql.org/docs/10/functions-sequence.html) classifies a `sequence`to be:

> ... objects that are special single-row tables created with [CREATE SEQUENCE](https://www.postgresql.org/docs/10/sql-createsequence.html) ...

which means that `CREATE SEQUENCE` __creates a table__ along with a specific __structure/schema__.
Another operation close to `CREATE SEQUENCE`, at least __in terms of creating a table__ is `CREATE TABLE` which also creates a table and defines the structure/schema of that table, and is __part of DDL__.

