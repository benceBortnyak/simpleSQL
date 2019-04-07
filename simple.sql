DROP TABLE IF EXISTS COUSTUMER;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS ORDER;

CREATE TABLE COUSTUMER(
  costumer_id int NOT NULL,
  costumer_first_name VARCHAR(15) NOT NULL,
  costumer_second_name VARCHAR(15) NOT NULL,
  address VARCHAR(30) NOT NULL,
  zip_code int NOT NULL CHECK (zipcode BETWEEN 1000 AND 9999),
  phone character varying(14),
  country character varying(20) NOT NULL,
  PRIMARY KEY costumer_id
);

CREATE TABLE PRODUCT(
  product_id int NOT NULL,
  product_name VARCHAR(30) NOT NULL,
  product_price real NOT NULL,
  color_if VARCHAR(13),
  warrinty_in_years smallint,
  PRIMARY KEY product_id
);

CREATE TABLE ORDER(
  product_id int NOT NULL,
  costumer_id int NOT NULL,
  quantity int NOT NULL,
  discount int NOT NULL,
  FOREIGN KEY(product_id) REFERENCES PRODUCT(product_id),
	FOREIGN KEY(costumer_id) REFERENCES COUSTUMER(costumer_id)
);


INSERT INTO Customer VALUES (1,"Kiss","János","Valami út 13",3421,06700000000,"Hungary");
INSERT INTO Customer VALUES (2,"Valami","Valaki","Utca út 00"),1111,06400000000,"Csodaország");

INSERT INTO Product VALUES (1,"Fogkefe",1000,"kék",2);
INSERT INTO Product VALUES (2,"valami",1000,"szín",5);

INSERT INTO Product VALUES (1,2,4,30);
INSERT INTO Product VALUES (2,1,6,50);
