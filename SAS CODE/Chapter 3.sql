-- Video 1 (Create Table)
-- Using test.db
CREATE TABLE test (
    a INTEGER,
    b TEXT
    );

INSERT INTO test VALUES (1, 'a');
INSERT INTO test VALUES (2, 'b');
INSERT INTO test VALUES (3, 'c');
SELECT * FROM test;

-- Video 2 (Deleting a Table)
-- Using test.db
DROP TABLE IF EXISTS test;
CREATE TABLE test (a TEXT, b TEXT );
INSERT INTO test VALUES ('one', 'two');
SELECT * FROM test;
DROP TABLE test;

-- Video 3 (Inserting Rows)
-- Using test.db
CREATE TABLE test (a INTEGER, b TEXT, c TEXT);

INSERT INTO test VALUES (1, 'This', 'Right here!');
INSERT INTO test (b, c) VALUES ('That', 'Over there!');
INSERT INTO test DEFAULT VALUES;
INSERT INTO test (a, b, c) SELECT id, name, description FROM item;

SELECT * FROM test;

-- Video 4 (Deleting Rows)
-- Using test.db
SELECT * FROM test;
DELETE FROM test WHERE a = 3;
SELECT * FROM test WHERE a = 1;
DELETE FROM test WHERE a = 1;

-- Video 5 (The NULL Value)
-- Using test.db
SELECT * FROM test;
SELECT * FROM test WHERE a = NULL;
SELECT * FROM test WHERE a IS NULL;
SELECT * FROM test WHERE a IS NOT NULL;
INSERT INTO test (a, b, c) VALUES (0, NULL, '');
SELECT * FROM test WHERE b IS NULL;
SELECT * FROM test WHERE b = '';
SELECT * FROM test WHERE c = '';
SELECT * FROM test WHERE c IS NULL

DROP TABLE IF EXISTS test;
CREATE TABLE test (
    a INTEGER NOT NULL,
    b TEXT NOT NULL,
    c TEXT
    );

INSERT INTO test VALUES (1, 'this', 'that');
SELECT * FROM test;

INSERT INTO test (b, c) VALUES ('one', 'two');
INSERT INTO test (a, c) VALUES (1, 'two');
INSERT INTO test (a, b) VALUES (1, 'two');
DROP TABLE IF EXISTS test;

-- Video 6 (Constraining Columns)
-- Using test.db
DROP TABLE IF EXISTS test;
CREATE TABLE test (a TEXT, b TEXT, c TEXT);
INSERT INTO test (a, b) VALUES ('one', 'two');
SELECT * FROM test;

CREATE TABLE test (a TEXT, b TEXT, c TEXT NOT NULL);
CREATE TABLE test (a TEXT, b TEXT, c TEXT DEFAULT 'panda'); 
CREATE TABLE test (a TEXT UNIQUE, b TEXT, c TEXT DEFAULT 'panda'); 
CREATE TABLE test (a TEXT UNIQUE NOT NULL, b TEXT, c TEXT DEFAULT 'panda'); 
CREATE TABLE test (a TEXT UNIQUE NOT NULL, b TEXT UNIQUE, c TEXT UNIQUE NOT NULL); 

-- Video 7 (Changing a Schema)
-- Using test.db
DROP TABLE IF EXISTS test;
CREATE TABLE test (a TEXT, b TEXT, c TEXT);
INSERT INTO test VALUES ('one', 'two', 'three');
INSERT INTO test VALUES ('two', 'three', 'four');
INSERT INTO test VALUES ('three', 'four', 'five');
SELECT * FROM test;

ALTER TABLE test ADD d TEXT;
ALTER TABLE test ADD e TEXT DEFAULT 'panda';

DROP TABLE IF EXISTS test;

-- Video 8 (ID Columns)
-- Using test.db
CREATE TABLE test(
    id INTEGER PRIMARY KEY,
    a INTEGER,
    b TEXT);

INSERT INTO test (a, b) VALUES (10, 'a');
INSERT INTO test (a, b) VALUES (11, 'b');
INSERT INTO test (a, b) VALUES (12, 'c');
SELECT * FROM test;
DROP TABLE IF EXISTS test;

-- Video 9 (Filtering Data: (WHERE, LIKE, and IN))
-- Using world.db
SELECT * FROM Country;
SELECT Name, Continent, Population FROM Country
    WHERE Population < 100000 ORDER BY Population DESC;
SELECT Name, Continent, Population FROM Country
    WHERE Population < 100000 OR Population IS NULL ORDER BY Population DESC;
SELECT Name, Continent, Population FROM Country
    WHERE Population < 100000 AND Continent = 'Oceania' ORDER BY Population DESC;
SELECT Name, Continent, Population FROM Country
    WHERE Name LIKE '%island%' ORDER BY Name;
-- Names LIKE '__r%' --> filter a list of names to match only those containing "r" as the third letter
-- Correct
-- The underscore is a single character wildcard, and the percent sign is a wildcard for one or more characters.
SELECT Name, Continent, Population FROM Country
    WHERE Continent IN ('Europe', 'Asia') ORDER BY Name;

-- Video 10 (Removing Duplicates)
-- Using world.db
SELECT Continent FROM Country;
SELECT DISTINCT Continent FROM Country;

-- Using test.db
DROP TABLE IF EXISTS test;
CREATE TABLE test ( a int, b int );
INSERT INTO test VALUES ( 1, 1 );
INSERT INTO test VALUES ( 2, 1 );
INSERT INTO test VALUES ( 3, 1 );
INSERT INTO test VALUES ( 4, 1 );
INSERT INTO test VALUES ( 5, 1 );
INSERT INTO test VALUES ( 1, 2 );
INSERT INTO test VALUES ( 1, 2 );
INSERT INTO test VALUES ( 1, 2 );
INSERT INTO test VALUES ( 1, 2 );
INSERT INTO test VALUES ( 1, 2 );
SELECT * FROM test;

SELECT DISTINCT a FROM test;
SELECT DISTINCT b FROM test;
SELECT DISTINCT a, b FROM test;

DROP TABLE IF EXISTS test;

-- Video 11 (Ordering Output)
-- Using world.db
SELECT Name FROM Country;
SELECT Name FROM Country ORDER BY Name;
SELECT Name FROM Country ORDER BY Name DESC;
SELECT Name FROM Country ORDER BY Name ASC;
SELECT Name, Continent FROM Country ORDER BY Continent, Name;
SELECT Name, Continent, Region FROM Country ORDER BY Continent DESC, Region, Name;

-- Video 12 (Conditional Expression)
-- Using world.db
DROP TABLE IF EXISTS booltest;
CREATE TABLE booltest (a INTEGER, b INTEGER);
INSERT INTO booltest VALUES (1, 0);
SELECT * FROM booltest;

SELECT
    CASE WHEN a THEN 'true' ELSE 'false' END as boolA,
    CASE WHEN b THEN 'true' ELSE 'false' END as boolB
    FROM booltest
;

SELECT
  CASE a WHEN 1 THEN 'true' ELSE 'false' END AS boolA,
  CASE b WHEN 1 THEN 'true' ELSE 'false' END AS boolB 
  FROM booltest
;

DROP TABLE IF EXISTS booltest;
