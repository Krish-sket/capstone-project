CREATE TABLE IF NOT EXISTS SALESMAN(
salesman_id TEXT PRIMARY KEY,
name TEXT,
city TEXT,
commision REAL
);
INSERT INTO SALESMAN (salesman_id,name,city,commision) VALUES
('5001','James Hoog','New York',0.15),
('5002','Nail Knite','Paris',0.13),
('5005','Pit Alex','London',0.11),
('5006','Mc Lyon','Paris',0.14),
('5007','Paul Adam','Rome',0.13),
('5003','Lauson Hen','San Jose',0.12);

-- Second Table
CREATE TABLE IF NOT EXISTS customer(
customer_id TEXT PRIMARY KEY,
cust_name TEXT,
city TEXT,
grade INTEGER,
salesman_id TEXT,
FOREIGN KEY(salesman_id) REFERENCES SALESMAN(salesman_id)
);

-- insert data
INSERT INTO customer(customer_id,cust_name,city,grade, salesman_id) VALUES
('3002','Nick Rimando','New York',100,'5001'),
('3007','Brad Davis','New York',200,'5001'),
('3005','Graham Zusi','California',200,'5002'),
('3008','Julian Green','London',300,'5002'),
('3004','Fabian Johnson','Paris',300,'5006'),
('3009','Geoff Cameron','Berlin',100,'5003'),
('3003','Jozy Altidor','Moscow',200,'5007'),
('3001','Brad Guzan','London',NULL,'5005');

--orders table

CREATE TABLE IF NOT EXISTS orders(
ord_no TEXT PRIMARY KEY,
purch_amt REAL,
ord_date TEXT,
customer_id TEXT,
salesman_id TEXT,
FOREIGN KEY(customer_id) REFERENCES customer(salesman_id)
);

--insert data
INSERT INTO orders(ord_no,purch_amt,ord_date,customer_id,salesman_id) VALUES
('70001',150.5,'2012-10-05','3005','5002'),
('70009',270.65,'2012-09-10','3001','5001'),
('70002',65.26,'2012-10-05','3002','5003'),
('70004',110.5,'2012-08-17','3009','5007'),
('70007',948.5,'2012-09-10','3005','5005'),
('70005',2400.6,'2012-07-27','3007','5006');

--queries

--matching customers and salesman by city
SELECT customer.cust_name, salesman.name, salesman.city
FROM customer
JOIN salesman ON customer.city=salesman.city;

--linking customers to their salesman
SELECT customer.cust_name,salesman.name
FROM customer
JOIN salesman ON customer.salesman_id=salesman.salesman_id;

--fetching orders where customer's city does not match salesman's city
SELECT orders.ord_no, customer.cust_name,orders.customer_id, orders.salesman_id
FROM orders
JOIN customer ON orders.customer_id=customer.customer_id
JOIN salesman ON orders.customer_id=salesman.salesman_id
WHERE customer.city <> salesman.city;