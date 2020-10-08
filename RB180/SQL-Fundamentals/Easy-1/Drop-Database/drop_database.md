In order to drop the database we need to do two things:

1. __Disconnect__ from the database we want to delete

2. Run the following SQL command:

   ```sql
   DROP DATABASE animals;
   ```

   __Or__ we coud use the PostgreSQL client application in the terminal __outside__ the `psql` REPL

   ```
   $ dropdb animals
   ```

   ​