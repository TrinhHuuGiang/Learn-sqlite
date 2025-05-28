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
- [SQL command script](#sql-command-script)
    - [DDL](#data-define-language-ddl)
        - [refer](./_01_0_install_and_test.md)
    - [DML](#data-manipulation-laguage-dml)
    - [TCL](#transaction-control-language-tcl)

# SQL command script

## Data Define Language (DDL)
- include: `CREATE`, `ALTER`, `DROP`
- perpose: Manage structures of data like `TABLE`, `VIEW`,...

## Data Manipulation Laguage (DML)
- DML includes: `SELECT`, `INSERT`, `UPDATE`, `DELETE`
- Purpose: Operate on data in configured structures such as tables.
- Command:
    1. **Select** data [link](https://sqlite.org/lang_select.html):
        - Syntax: `( CREATE + TABLE + new table name + AS)` +  
        `SELECT`+ `(DISTINCT)` + `[column_list]` + `FROM` + `[table_name]` + `sub_command` + `;`
        - Optional `( CREATE + TABLE + new_table_name + AS)` if we want create new table to save these data have been query by `SELECT`
        - `DISTINCT` is optional: tells SQLite to remove duplicate rows where all selected `columns` are the same.
        - `[column_list]` maybe:
            - [col1] , [col2], [col3], ... is column in the `[table]`
            - `*` if choose entire column
            - Expressions or calculations using `AS` to define an `alias_column`:
                - example:
                    - `[col1]` * `[col2]` + `AS` + `new column name`
            - *Tip:* using `SELECT` + `'content'` we can create a blank row with `content`
        - `sub_command` always include by order:
            - `WHERE` -> `GROUP` -> `HAVING` -> `WINDOW` ->`ORDER BY` -> `LIMIT`
        - Note that: when computer query command, the order execute is:
            - `FROM` => `WHERE` => `GROUP` => `HAVING` => `WINDOW` =>  
            `SELECT` =>`ORDER BY` => `LIMIT`
            - **Warn**: `SELECT` will execute after `FROM`, `WHERE`, `GROUP`, `HAVING`, `WINDOW` so:
                - `WHERE` can't use `alias` defined by `SELECT`
        - Syntax `sub_command`:
            - *Where* - filter data:
                - Filter data with several `condition` and logic operator `AND`, `OR`, `NOT` using `WHERE`
                - Syntax: `WHERE` + `condition` + `AND`/`OR`/`NOT` + `other_condition` + ...
                - `condition` include: >, <, >=, <=, = (case sensitive), !=
                - *Note*: if we have lot of logic operator, we can wrap crop of logic by `()`:
                    - Ex: (1 AND 2) OR 3    <=  :v just example
            - *Order* - order data:
                - Syntax: `ORDER BY` + `[column x]` + `ASC`/`DESC` + `[column y]` + `ASC`/`DESC` + ...
                - `condition` is
                - `ASC`/`DESC` is: Ascending from A->Z, Descending from Z->A
                - Priority execute the order from left to right, if the value is duplicated
            - *LIMIT* - limite number data in table:
                - Syntax: `LIMIT` + `number line` + `OFFSET` + `number line ignore before input table`

    2. *Insert* new data to table:
        - Syntax 1: `INSERT` + `INTO` + `table_name` + `(AS + alias)` +  
        `( [col1], [col2], ... )` + `VALUES` + `( value_col1, value_col2, ... )` + `(other_values)` +  `;`
        - Syntax 2: `INSERT` + `INTO` + `table_name` + `(AS + alias)` +  
        `( [col1], [col2], ... )` + `SELECT` + ... + `;`
        - Optional `(AS + alias)`

    3. *Update* data in table:
        - Syntax: `UPDATE` + `qualified_table_name` +  
        `SET` + [col1] = ... + [col2] = ...  +  
        `WHERE` + `condition` + `AND`/`OR`/`NOT` + `other_condition` + ...
        - `qualified_table_name` is exist table have all all column in `SET`
        - Example:
            ``` sql
            UPDATE table_name
            SET [col1] = value1, [col2] = value2, ...
            WHERE condition1 AND/OR condition2 ...;
            ```

    4. *Delete* data from table:
        - Syntax: `DELETE` + `FROM` + `qualified_table_name` +
        `WHERE` + `condition` + `AND`/`OR`/`NOT` + `other_condition` + ...
        - Example:
            ``` sql
            -- Delete all employees with salary < 1000
            DELETE FROM employees WHERE salary < 1000;
            ```

        

## Data Control Language (DLC)
- include: :v empty
- sqlite no support user authorization like GRANT or REVOKE

## Transaction Control Language (TCL)
- `TCL` is command script support `DML` each working session
- include: `BEGIN`, `SAVEPOINT` ,  `RELEASE`, `ROLLBACK`, `ROLLBACK TO`, `COMMIT`
- [refer](https://sqlite.org/lang_savepoint.html)

1. `BEGIN` - `COMMIT`
	- Start a **transaction**, init an area can `savepoint`, query, `release`, `rollback to`, `commit`
	- End **transaction** and save all queries data to database
		+ data only save when `COMMIT`
2. `SAVEPOINT`, `ROLLBACK` and `RELEASE`
	- Query data after a `SAVEPOINT` will clean when call  `ROLLBACK TO` + `savepoin_name`
	- Special when only call `ROLLBACK` -> rollback to `BEGIN` and clean all transaction, savepoint
	- `RELEASE` use to free a `SAVEPOINT` after use
	- **Note:**
		- Before `COMMIT` any data in transaction is raw
		- Call `ROLLBACK` if feel transaction need to cancel then `COMMIT` to end
