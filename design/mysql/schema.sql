DROP TABLE IF EXISTS user;

#role: admin, owner
#INSERT INTO Table (FieldBin) VALUES (UNHEX("110E8400E29B11D4A716446655440000"))
#110E8400E29B11D4A716446655440000
CREATE TABLE user (
  id binary(16) NOT NULL UNIQUE,
  name VARCHAR(32) NOT NULL,
  email VARCHAR(64) NOT NULL UNIQUE,
  password BINARY(32) NOT NULL,
  role VARCHAR(8) NOT NULL DEFAULT 'owner',
  attempts INT(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into user(id,name,email,password, role) values (UNHEX("110E8400E29B11D4A716446655440000"),'dave','dave@abc.com','1234', 'owner');
insert into user(id,name,email,password, role) values (UNHEX("110E8400E29B11D4A716446655440001"), 'admin','admin@abc.com','1234', 'admin');

CREATE TABLE customer (
  id binary(16) NOT NULL UNIQUE,
  name VARCHAR(32) NOT NULL,
  email VARCHAR(64) NOT NULL UNIQUE,
  phone VARCHAR(16) NOT NULL,
  Address VARCHAR(128),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE category (
  id binary(16) NOT NULL UNIQUE,
  name VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into category(id,name) values (UNHEX("110E8400E29B11D4A716446655440030"),'cloth');
insert into category(id,name) values (UNHEX("110E8400E29B11D4A716446655440031"), 'food');

CREATE TABLE product (
  id binary(16) NOT NULL UNIQUE,
  code VARCHAR(8) NOT NULL,
  name VARCHAR(32) NOT NULL,
  purchase_price DECIMAL(8, 2),
  sell_price DECIMAL(8, 2),
  market_price DECIMAL(8, 2),
  category_id binary(16) NOT NULL,
  
  PRIMARY KEY (id),
  FOREIGN KEY (category_id)
      REFERENCES category(id)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into product(id, code,name, purchase_price, sell_price, market_price, category_id) values 
(UNHEX("110E8400E29B11D4A716446655440040"),'40040','cloth1',20.34, 120.33, 100.00,UNHEX("110E8400E29B11D4A716446655440030")),
(UNHEX("110E8400E29B11D4A716446655440041"), '40041','food1',5.68, 56.94, 50.89,UNHEX("110E8400E29B11D4A716446655440031"));

#date format 'YYYY-MM-DD'
CREATE TABLE rate (
  id binary(16) NOT NULL UNIQUE,
  rate DECIMAL(8, 2),
  user_id binary(16) NOT NULL,
  created DATE,
  active TINYINT(1) default 0,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)
      REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into rate(id, rate, user_id, created, active) values 
(UNHEX("110E8400E29B11D4A716446655440060"), 5.00 , UNHEX("110E8400E29B11D4A716446655440000"), '2015-09-18', 1);
