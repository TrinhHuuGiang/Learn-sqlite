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
- [constrait types](#constraint-type)


## Constraint type

1. UNIQUE
- Data on a column cannot be duplicated if UNIQUE is used for that column.


2. NOT NULL
- column cannot be exist a data is NULL


3. DEFAULT
- Define a default value for data if it NULL


4. CHECK
- Check if data satify the conditions


5. PRIMARY KEY (**only 1 each table**)
- `PRIMARY KEY` = `UNIQUE` + `NOT NULL`

## How to use
- When create a table, these constrain will apply for each column
- The position where the constraint is applied is after the data type.
- Example:
    ``` sql
    CREATE TABLE table_with_constraint
    (
        staff_code    TEXT    PRIMARY KEY,             -- Staff code is UNIQUE and NOT NULL
        staff_name    TEXT    DEFAULT   'staff_name',  -- Use '' for content string
        staff_age     INTEGER
        CHECK(staff_age<=50)
        CHECK(staff_age>=18), -- Each column have 1 or more constraint
        staff_dob     TEXT    NOT NULL
    );
    ```