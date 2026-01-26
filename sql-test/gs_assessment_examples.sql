-- 1st problem
-- Remove duplicated rows from table cars_1, cars_1 primary key is id
-- and this column contains unique values.
CREATE DATABASE sample_database2;

CREATE TABLE cars_1(
  id INT AUTO_INCREMENT,
  model VARCHAR(20),
  brand VARCHAR(20),
  color VARCHAR(20),
  make INT,
  PRIMARY KEY(id)
);

INSERT INTO cars_1 VALUES(1, "Model S", "Tesla", "Blue", 2018);
INSERT INTO cars_1 VALUES(2, "EQS", "Mercedes-Benz", "Black", 2022);
INSERT INTO cars_1 VALUES(3, "iX", "BMW", "Red", 2022);
INSERT INTO cars_1 VALUES(4, "Ioniq", "Hyundai", "White", 2021);
INSERT INTO cars_1 VALUES(5, "Model S", "Tesla", "Blue", 2018);
INSERT INTO cars_1 VALUES(6, "Ioniq", "Hyundai", "White", 2021);


DELETE FROM cars_1 WHERE id NOT IN (
  SELECT MAX(id) FROM cars_1 GROUP BY model, brand, color, make
);

-- 2nd problem
-- Remove duplicated rows from table cars_1, cars_2 has not primary key 
-- and id column contains duplicated values.
CREATE DATABASE sample_database2;

CREATE TABLE cars_2 (
  id INT(11) DEFAULT NULL,
  model varchar(20) DEFAULT NULL,
  brand varchar(20) DEFAULT NULL,
  color varchar(20) DEFAULT NULL,
  make INT(11) DEFAULT NULL
);

INSERT INTO cars_2 VALUES(1, "Model S", "Tesla", "Blue", 2018); 
INSERT INTO cars_2 VALUES(2, "EQS", "Mercedes-Benz", "Black", 2022); 
INSERT INTO cars_2 VALUES(3, "iX", "BMW", "Red", 2022); 
INSERT INTO cars_2 VALUES(4, "Ioniq", "Hyundai", "White", 2021); 
INSERT INTO cars_2 VALUES(1, "Model S", "Tesla", "Blue", 2018); 
INSERT INTO cars_2 VALUES(4, "Ioniq", "Hyundai", "White", 2021); 

ALTER TABLE cars_2 ADD column tmp_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY FIRST;

DELETE FROM cars_2 WHERE tmp_id NOT IN (
  SELECT MAX(tmp_id) FROM cars_2 GROUP BY id, model, brand, color, make
);

ALTER TABLE cars_2 DROP column tmp_id;

-- 3rd problem
-- Get the manager id and each worker assigned to it, one row per manager
-- Output example:
-- 1 | Ernesto,Jesus,Marco
-- 3 | Diego,Ram

CREATE employee(
    id INT,
    name VARCHAR(30),
    manager_id INT
);

INSERT INTO employee VALUES (1, "Carlos", 5);
INSERT INTO employee VALUES (2, "Diego", 3);
INSERT INTO employee VALUES (3, "Ricardo", 5);
INSERT INTO employee VALUES (4, "Miguel", 5);
INSERT INTO employee VALUES (5, "Ram", 3);
INSERT INTO employee VALUES (6, "Thompson", 5);

SELECT
  ee.manager_id, 
  (SELECT group_concat(name) FROM employee es
   WHERE es.manager_id = ee.manager_id) AS assignments
FROM employee ee GROUP BY ee.manager_id;


-- 4th problem
-- Will work the next query? Can you explain the result?
SELECT * FROM user, user_session;

-- 5th problem
-- Select the maximum and minimum user id from table user
(SELECT * FROM user ORDER BY id ASC LIMIT 1)
UNION ALL
(SELECT * FROM user ORDER BY id DESC LIMIT 1);

SELECT * FROM user WHERE id IN (
  (SELECT max(id) FROM user) UNION ALL (SELECT min(id) FROM user)
);

-- 6th problem
-- Table inventory has id, product_name, category and price fields
-- Question: we need the 3 products with highest price in each category

SELECT category FROM inventory GROUP BY category;

SELECT * FROM (
  SELECT
    category,
    price,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS row_num -- dense_rank()
  FROM
    inventory;
) t  WHERE t.row_num <= 3;
