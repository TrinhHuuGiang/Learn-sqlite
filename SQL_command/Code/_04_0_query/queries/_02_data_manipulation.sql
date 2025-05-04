-- INSERT
INSERT INTO [table_1]
([id], [name], [age])
VALUES
(1, 'A B C', 18),
(2, 'a b c', 19),
-- (3, "d e f", 17), // try this will violate the condition >=18 and <=50
(4, 'a B c', 20);


INSERT INTO [table_4]
([id], [name], [age])
VALUES
-- (1, "A B C", 51),
(2, 'a b c', 19),
(3, 'd e f', 20),
(4, 'a B c', 26);



-- UPDATE
UPDATE [table_1] 
SET [name] = 'updated'
WHERE [id] = 1 OR [id] = 4;

-- DELETE
DELETE FROM [table_4] 
WHERE [id] = 4;


-- SELECT
SELECT ''; SELECT 'table 1'; SELECT '';

SELECT * FROM [table_1];

SELECT ''; SELECT 'table 4'; SELECT '';

SELECT * FROM [table_4];
