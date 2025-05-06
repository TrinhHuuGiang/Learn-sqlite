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


# Type of JOIN
- `JOIN` using in `SELECT` query to create a `relationship_table` for field `FROM`
- SYNTAX:
    - `SELECT` ... `FROM` + `table / relationship_table` + ...

1. INNER JOIN
- This option only return the rows when value of `column` in `table A` is match with value of `column` in `table B`
- *Note*: `column` data type, constraint and name has to similar with table `A` and `B`
- Example:
    ```sql
    SELECT *
    FROM TableA
    INNER JOIN TableB
    ON TableA.common_column = TableB.common_column;
    ```
- Return: a view table create by `SELECT`, a row value include table `A` at left and `B` at right

2. LEFT OUTER JOIN
- Returns all rows from table A and the matching rows from table B.
- If there is no match in table B, the result will contain NULL values for columns from table B.
- Ex:
    ```sql
    SELECT *
    FROM TableA
    LEFT JOIN TableB
    ON TableA.id = TableB.a_id;
    ```

3. RIGHT OUTER JOIN
- Reverse with `LEFT OUTER JOIN`, the value `left table` with empty if not exist on `rigt table`

4. FULL OUTER JOIN
- Mix both `RIGH JOIN` and `LEFT JOIN`, the value a table not exit if it not exist on the rest table

5. CROSS OUTER JOIN
- Cross join or `Cartesian product` will mix all rows of `table A` with `table B` don't care matching column.
- Example: ( 1 2 3 ) cross with (4 5 6) we have a table ( [1,4] , [1,5] , [1,6], ..., [3,6])
- **Example:**
    ```sql
    SELECT *
    FROM TableA
    CROSS JOIN TableB;
    ```
- If `table A` has 3 rows and `table B` has 2 rows, the result will have `3 x 2 = 6` rows.