### Delete the `extrasolar`database using psql REPL

1. Connect to any database other than `extrasolar`:

   ```
   /* inside the psql REPL */
   \c testing
   ```

2. Delete the `extrasolar` database:

   ```sql
   DROP DATABASE extrasolar;
   ```

   ​

