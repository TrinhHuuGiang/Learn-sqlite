<!DOCTYPE html>
<head>
    <style>
        body
        {
            background-color: white;
            font-family: Arial, sans-serif;
            color: black;
            padding: 20px;
        }
    </style>
</head>

# Content
- [Create db](#create-database)
- [Queries](#data-queries)
    - [Basic create, modify, delete](#create-modify-delete-commands)
- [Result](#practice-folder)

## Create database
- Require: Linux ubuntu x64
- Command: 
    - `sudo apt install sqlite3`

- Run:
    - `sqlite3 --help`

- Test new database:
    - `sqlite3 cr_new_db.db`
    - `.table`
    - `.exit`

## Data queries
- **Note**:
    - [Reference link](https://sqlite.org/lang.html)
    - Each query must be written on one line or multiple lines, but there must not be any empty lines between the queries.
    - Each database have variety table.
    - With data we use ' content '
    - With name of TABLE, COLUMN we use [] and these field is case insensitie: a == A

### Create, modify, delete commands
1. Command `CREATE` for create entity

    - Syntax: `CREATE` + `object` + `name` + `;`
    - `object` include : `TABLE`, `VIEW`, ...
    - `name`           : The user-defined name for the entity
    - Example:
        ```sql
        CREATE TABLE "my_table" 
        (
            id INTEGER PRIMARY KEY, -- TABLE have to init at least 1 column to success create
            name TEXT
        );
        ```

2. Command `ALTER` for modifying an `TABLE`

    - Syntax: `ALTER` + `TABLE` + `name` + `sub-command` + `;`
    - some `sub command` for `TABLE` include:
        - *Rename*:
            - Syntax: `RENAME TO` + `new name`
        - *Add column*:
            - Syntax: `ADD` + `COLUMN` + `column_name` + [type_of_data](./_02_0_add_csv_to_db.md) + [constraint](./_03_0_constraint.md)
        - *Rename column*
            - Syntax: `RENAME` + `COLUMN` + `column_name` + `TO` + `new_name`
        - No support drop column -> drop table and create new

    - Example:
        ``` sql
        ALTER TABLE "table_2"
        RENAME TO "table_2_modified_name";
        ```

3. Command `DROP`   for delete entity

    - Syntax: `DROP` + `object` + `name` + `;`
    - Example:
        ``` sql
        DROP TABLE "table_1";
        ```

## Practice folder:
- [link](../Code/_01_0_test_db/)
- Read the `sql` file in queries folder
- Delete `cr_new_db.db` and rebuild:
    - `sqlite3 cr_new_db.db` => type `.table` to create a database => type `.quit`
    - Now run command: `sqlite3 cr_new_db.db < ./queries/_01_basic_cmd.sql` to execute sql command
    - Re-open `sqlite3 cr_new_db.db` and type `.table`
        - Result:
            ``` bash
            sqlite3 cr_new_db.db
            SQLite version 3.37.2 2022-01-06 13:25:41
            Enter ".help" for usage hints.
            sqlite> .table
            table_2_modified_name  table_3   
            ```