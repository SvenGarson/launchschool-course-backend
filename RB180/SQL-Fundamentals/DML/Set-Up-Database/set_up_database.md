1. Create `workshop`database

   ```
   /* terminal outside any REPL */
   createdb workshop
   ```

2. Connect to `workshop`database

   ```
   /* terminal outside any REPL */
   psql -d workshop
   ```

3. Create `devices`table in `workshop`database:

   ```sql
   CREATE TABLE devices(
     id serial PRIMARY KEY,
     name text NOT NULL,
     created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
   );
   ```

4. Create `parts` table in the `workshop`database.
   The relationship between devices and parts is:

   ![Device and parrt relationship](device_part_relationship.png)

   Which we can create by having a Foreign Key in the `parts` table that references the device it belongs to.

   ```sql
   CREATE TABLE parts(
     id serial PRIMARY KEY,
     part_number integer UNIQUE NOT NULL,
     device_id integer REFERENCES devices (id)
   );
   ```



### After looking at the solution

Since the nature of the part number was not defined apart from the column name itself, I looked up what a part number could be and it seemed that in general, part numbers can contain alpha-numerical data and be of different length.
So initially I just went with the data type `text` because I had a hunch that an integer was meant to be used or another, specific type of 'part number'.

Also, since the problem states that a part:

> ... should be associated with a device...

__I would have added a `NOT NULL` constraint__ to the `parts.device_id` column, but I guess this will be part of the next exercises.
Right now, the schema __allows parts to be added to where the device_id is NULL, i.e. is not associated with any device__.