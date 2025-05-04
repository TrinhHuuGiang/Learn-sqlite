--Index,Name,Description,Brand,Category,Price,Currency,Stock,EAN,Color,Size,Availability,Internal ID
-- 1,Thermostat Drone Heater,Consumer approach woman us those star.,Bradford-Yu,Kitchen Appliances,74,USD,139,8619793560985,Orchid,Medium,backorder,38
CREATE TABLE csv_products_data
(
    [index]       INTEGER, -- index, name,... maybe duplicate with specific command so use []
    [name]        TEXT,   
    [descript]    TEXT,
    [brand]       TEXT,
    [category]    TEXT,
    [price]       REAL,
    [currency]    TEXT,
    [stock]       INTEGER,
    [EAN]         TEXT,
    [color]       TEXT,
    [size]        TEXT,
    [availability] TEXT,
    [ID]          INTEGER
);