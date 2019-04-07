DROP TABLE IF EXISTS COUSTUMER CASCADE;
DROP TABLE IF EXISTS PRODUCT CASCADE;
DROP TABLE IF EXISTS ORDER CASCADE;

CREATE TABLE CUSTUMER(
  custumer_id int NOT NULL,
	company_name VARCHAR(30),
	contact_name VARCHAR(30) NOT NULL,
	contact_title VARCHAR(20),
	address VARCHAR(25) NOT NULL,
	city VARCHAR(20) NOT NULL,
	region VARCHAR(20) NOT NULL,
	postal_code int NOT NULL CHECK(postal_code BETWEEN 1 AND 999999999),
	country VARCHAR(20) NOT NULL,
	phone VARCHAR(15),
	fax VARCHAR(15),
	PRIMARY KEY(customer_id)
);

CREATE TABLE ORDERS(
  order_id int NOT NULL,
  custumer_id int NOT NULL,
  empployee_id int,
  order_date date NOT NULL,
  required_date date,
  shipped_date date,
  ship_via int,
  freight real,
  ship_name VARCHAR(25),
	ship_address VARCHAR(60),
	ship_city VARCHAR(15),
	ship_region VARCHAR(15),
	ship_postal_code int NOT NULL CHECK(postal_code BETWEEN 1 AND 999999999),
	ship_country VARCHAR(15),
	PRIMARY KEY(order_id),
	FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE PRODUCT(
  product_id smallint NOT NULL,
	product_name VARCHAR(20) NOT NULL,
	supplier_id smallint,
	category_id smallint,
	quantity_per_unit VARCHAR(25),
	unit_price float,
	units_in_stock smallint,
	units_on_order smallint,
	reorder_level smallint,
	discontinued integer,
	PRIMARY KEY(product_id)
);

CREATE TABLE order_detail (
  order_id int NOT NULL,
	product_id int NOT NULL,
	unit_price float NOT NULL,
	quantity smallint NOT NULL,
	discount real NOT NULL,
	FOREIGN KEY(order_id) REFERENCES Orders(order_id),
	FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

INSERT INTO Customer VALUES (1, 'valami kft', 'Valaki Valami', 'Mr', 'Valami út 20', 'Valahollandia', 'Izémegye', 5555, 'Csodaország', 0620-123-1234, 0648-321-312);
INSERT INTO Customer VALUES (2, 'Izé kft', 'Kiss Béla', 'Valami', 'Útca út 1.', 'Valahol', 'Megyemegye', 6666, 'Nagyország', 0620-223-2234, 0688-333-333);

INSERT INTO Orders VALUES (43211, 1, 99, '2010-08-24', '2011-09-21', '2010-09-04', 5, 25.4587541, 'Titanic', 'Adress','London', 'Region',51100, 'UK');
INSERT INTO Orders VALUES (98989, 2, 100,'2011-09-14', '2012-07-21', '2011-09-14', 7, 14.45454554, 'ship', 'Adress1','Manchester','Regionasd',47222, 'UK');


INSERT INTO Products VALUES (1, 'Prodasd', 5, 2, '10 boxes', NULL, 50, 1, 1, 2);
INSERT INTO Products VALUES (2, 'Fogkefe', 1, 1, '10 bottles(1l)', 500, 40, 4, 5, NULL);

INSERT INTO Order_details VALUES (43211,1,30.22468423,10,30);
INSERT INTO Order_details VALUES (98989,2,10.555555,5,80);
