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
- [type of data](#sqlite-type-of-data)
- [add csv data to table](#add-data-of-csv-file-to-table)
    - [example](#example)

## SQLite type of data
1. INTERGER:
- example: -10, 0, 10, ...
- limit value:
    - Auto resize from 1 (-128 to 127) => 8 byte (-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807)

2. REAL:
- example: -10.4, 0, 10.4,...
- limit value: double 64 bit

3. TEXT:
- Using Unicode UTF-8 or UTF-16
- limit length: unlimited or up to 2GB
- include: varchar and nvarchar

4. BLOB:
- Using save binary data like: image, voice, video,...
- Up to 2GB

5. NULL:
- Note this feild undetermined type of value


## Add data of CSV file to table

1. Create table and add format all the fields exist on file csv
2. Open database with `sqlite3`
3. Set `.mode` and add csv file to table was initialized by `.import`:
    - Command:
        ```sql
        .mode csv
        .import [csv data file link] [destnation table]    
        ```

### Example:

1. Go to [link](../Code/_02_0_add_csv_to_db/)
2. Delete and re create `new_db.db` by `sqlite3`
3. Initial table for database with queries predefined in `queries` folder
    - `.read ./queries/_01_table_csv_data.sql`
    - Then check by `.schema`
4. Now open `sqlite3 ./new_db.db`:
    - Type `.mode csv` to config display mode is csv, we con config `.mode column` easy to following
    - Type `.import ./sample_csv/products-1000.csv csv_products_data`
5. Check 10 line data first imported:
    - `SELECT * FROM csv_products_data LIMIT 10;`
6. Check number line imported:
    - `SELECT COUNT(*) FROM csv_products_data;`