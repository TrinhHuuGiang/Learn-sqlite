-- CREATE
CREATE TABLE [table_1]
(
    [id]     INTEGER UNIQUE NOT NULL,
    [name]   TEXT    NOT NULL,
    [age]    INTEGER CHECK((age >= 18) AND (age <=50)),
    [salary] REAL    DEFAULT 0.0
);

CREATE TABLE [table_2]
(
    [id]     INTEGER UNIQUE NOT NULL,
    [name]   TEXT    NOT NULL,
    [age]    INTEGER CHECK((age >= 18) AND (age <=50)),
    [salary] REAL    DEFAULT 0.0
);

CREATE TABLE [table_3]
(
    [id]     INTEGER UNIQUE NOT NULL,
    [name]   TEXT    NOT NULL,
    [age]    INTEGER CHECK((age >= 18) AND (age <=50)),
    [salary] REAL    DEFAULT 0.0
);

CREATE TABLE [table_4]
(
    [id]     INTEGER UNIQUE NOT NULL,
    [name]   TEXT    NOT NULL,
    [age]    INTEGER CHECK((age >= 18) AND (age <=50)),
    [salary] REAL    DEFAULT 0.0
);

-- ALTER
ALTER TABLE [table_2]
RENAME TO [table_2_renamed]; -- Rename table_2

ALTER TABLE [table_1]
ADD COLUMN [new_column] TEXT DEFAULT 'EmPtY'; -- add new column table_1

ALTER TABLE [table_4]
RENAME COLUMN [salary] TO [bill]; -- rename column

-- DROP
DROP TABLE [table_3];

