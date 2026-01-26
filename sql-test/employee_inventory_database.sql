CREATE DATABASE IF NOT EXISTS example_database;

USE example_database;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE user(
    id int UNSIGNED AUTO_INCREMENT,
    username VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE user_session(
    id int UNSIGNED AUTO_INCREMENT,
    user_id int UNSIGNED,
    client_ip varchar(100),
    user_agent varchar(100),
    start_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    end_timestamp DATETIME,
    PRIMARY KEY(id),
    CONSTRAINT user_sessions
        FOREIGN KEY(user_id)
        REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE inventory(
    id INT UNSIGNED AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price FLOAT,
    PRIMARY KEY(id)
);

INSERT INTO user(username, email) values("rbermudezijk", "ricardob.sistemas@gmail.com");
INSERT INTO user(username, email) values("rbermudezijk", "ricardob.sistemas@gmail.com");
INSERT INTO user(username, email) values("jhond", "jd@test.com");
INSERT INTO user(username, email) values("jhond", "jd@test.com");
INSERT INTO user(username, email) values("test1", "test@gmail.com");
INSERT INTO user(username, email) values("test2", "test2@gmail.com");
INSERT INTO user(username, email) values("xavier_m", "xavier@example.com");
INSERT INTO user(username, email) values("xavier_m", "xavier@example.com");
INSERT INTO user(username, email) values("normal_user", "nu@data.com");
INSERT INTO user(username, email) values("final_user", "data@tcs.com");

insert into user_session values (1, 2,"192.168.1.1", "Postman 2.1", now(), now());
insert into user_session values (2, 10,"192.168.1.254", "Chrome 80.1", now(), now());

insert into inventory values (1, "tape", "office", 10.0);
insert into inventory values (2, "pencil", "office", 5.0);
insert into inventory values (3, "rule", "office", 2.0);
insert into inventory values (4, "box", "office", 2.0);
insert into inventory values (5, "paper", "office", 1.0);
insert into inventory values (6, "hammer", "home tools", 1.0);
insert into inventory values (7, "flat screwdriver", "home tools", 2.0);
insert into inventory values (8, "cross screwdriver", "home tools", 3.5);
insert into inventory values (9, "gloves", "home tools", 0.5);
insert into inventory values (10, "smart tv", "electronics", 1000.0);
insert into inventory values (11, "bluetooth speaker", "electronics", 100.0);
insert into inventory values (12, "laptop", "electronics", 2000.0);
insert into inventory values (13, "air pods", "electronics", 50.0);
insert into inventory values (14, "pillows", "home basics", 11.0);


