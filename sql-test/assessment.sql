create database sample_database2;

-- 1st problem

create table cars_1(
    id int auto_increment,
    model varchar(20),
    brand varchar(20),
    color varchar(20),
    make int,
    primary key(id)
);

insert into cars_1 values(1, "Model S", "Tesla", "Blue", 2018);
insert into cars_1 values(2, "EQS", "Mercedes-Benz", "Black", 2022);
insert into cars_1 values(3, "iX", "BMW", "Red", 2022);
insert into cars_1 values(4, "Ioniq", "Hyundai", "White", 2021);
insert into cars_1 values(5, "Model S", "Tesla", "Blue", 2018);
insert into cars_1 values(6, "Ioniq", "Hyundai", "White", 2021);


delete from cars_1 where id not in (
  select max(id) from cars_1 group by model, brand, color, make
);

-- 2nd problem
CREATE TABLE cars_2 (
  id int(11) DEFAULT NULL,
  model varchar(20) DEFAULT NULL,
  brand varchar(20) DEFAULT NULL,
  color varchar(20) DEFAULT NULL,
  make int(11) DEFAULT NULL
);

insert into cars_2 values(1, "Model S", "Tesla", "Blue", 2018);
insert into cars_2 values(2, "EQS", "Mercedes-Benz", "Black", 2022);
insert into cars_2 values(3, "iX", "BMW", "Red", 2022);
insert into cars_2 values(4, "Ioniq", "Hyundai", "White", 2021);
insert into cars_2 values(1, "Model S", "Tesla", "Blue", 2018);
insert into cars_2 values(4, "Ioniq", "Hyundai", "White", 2021);

alter table cars_2 add column tmp_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY FIRST;

delete from cars_2 where tmp_id not in (
  select max(tmp_id) from cars_2 group by id, model, brand, color, make
);

alter table cars_2 drop column tmp_id;

/*
 1. Distinct sobre los campos repetidos
 2. Crear una tabla temporal insertando los row del paso anterior
 3. Delete a la tabla original
 4. Insert INTO del la tabla temporal hacia la tabla original.
 */


-- 3rd problem

create employee(
    id int,
    name varchar(30),
    manager_id int
);

insert into employee values (1, "Carlos", 5);
insert into employee values (2, "Diego", 3);
insert into employee values (3, "Ricardo", 5);
insert into employee values (4, "Miguel", 5);
insert into employee values (5, "Ram", 3);
insert into employee values (6, "Thompson", 5);

SELECT
  ee.manager_id, 
  (SELECT group_concat(name) FROM employee es
   WHERE es.manager_id = ee.manager_id) AS assignments
FROM employee ee GROUP BY ee.manager_id;
