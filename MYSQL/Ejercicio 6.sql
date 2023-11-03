CREATE SCHEMA IF NOT EXISTS ej6;
USE ej6;

CREATE TABLE IF NOT EXISTS ej6.salesman (
  salesman_id INT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(40) NOT NULL,
  city VARCHAR(15) NOT NULL,
  comission DECIMAL(5,3) NOT NULL,
  PRIMARY KEY (salesman_id));

  CREATE TABLE IF NOT EXISTS ej6.orders (
  order_no INT UNSIGNED AUTO_INCREMENT,
  purch_amt DECIMAL(8,2) NOT NULL,
  oro_date DATE,
  salesman_id_tablasalesman INT UNSIGNED NOT NULL,
  customer_id_tablacustomer INT UNSIGNED NOT NULL,
  PRIMARY KEY (order_no, salesman_id_tablasalesman, customer_id_tablacustomer),
  FOREIGN KEY (salesman_id_tablasalesman) 
  REFERENCES ej6.salesman(salesman_id),
  FOREIGN KEY (customer_id_tablacustomer) 
  REFERENCES ej6.customer(customer_id));
    
CREATE TABLE IF NOT EXISTS ej6.customer (
  customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cust_name VARCHAR(45) NOT NULL,
  city VARCHAR(15)  NOT NULL,
  grade NUMERIC(3) NOT NULL
);

-- Haz 10 inserts en cada tabla
INSERT INTO ej6.salesman (nombre, city, comission) VALUES
  ('Juan Pérez', 'Madrid', 0.05),
  ('María López', 'Barcelona', 0.06),
  ('Luis Ramírez', 'Valencia', 0.04),
  ('Ana Martínez', 'Sevilla', 0.03),
  ('Carlos Sánchez', 'Málaga', 0.05),
  ('Sofía Rodríguez', 'Bilbao', 0.04),
  ('Pedro Gómez', 'Alicante', 0.06),
  ('Laura Torres', 'Zaragoza', 0.03),
  ('Diego Fernández', 'Murcia', 0.05),
  ('Elena Soto', 'Granada', 0.04);

SELECT * FROM ej6.salesman;

INSERT INTO ej6.customer (cust_name, city, grade) VALUES
  ('Cliente A', 'Madrid', 1),
  ('Cliente B', 'Barcelona', 2),
  ('Cliente C', 'Valencia', 3),
  ('Cliente D', 'Sevilla', 4),
  ('Cliente E', 'Málaga', 5),
  ('Cliente F', 'Bilbao', 1),
  ('Cliente G', 'Alicante', 2),
  ('Cliente H', 'Zaragoza', 3),
  ('Cliente I', 'Murcia', 4),
  ('Cliente J', 'Granada', 5);

SELECT * FROM ej6.customer;

INSERT INTO ej6.orders (purch_amt, oro_date, salesman_id_tablasalesman, customer_id_tablacustomer) VALUES
  (100.00, '2023-10-31', 1, 1),
  (75.50, '2023-10-30', 2, 2),
  (120.25, '2023-10-29', 3, 3),
  (50.75, '2023-10-28', 4, 4),
  (90.00, '2023-10-27', 5, 5),
  (85.50, '2023-10-26', 6, 6),
  (130.75, '2023-10-25', 7, 7),
  (95.25, '2023-10-24', 8, 8),
  (110.50, '2023-10-23', 9, 9),
  (70.00, '2023-10-22', 10, 10);

SELECT * FROM ej6.orders;

-- Cuenta los elementos el total de registros de la tabla orders
SELECT COUNT(*) as Total_Registros from ej6.orders;

-- Muestra los customers con diferente nombre, sin repetir
SELECT DISTINCT cust_name from ej6.customer;

-- Ordena los salesman en funcion de las ventas
SELECT s.salesman_id, s.nombre, s.city, s.comission, SUM(o.purch_amt) AS Ventas
FROM ej6.salesman s
LEFT JOIN ej6.orders o ON s.salesman_id = o.salesman_id_tablasalesman
GROUP BY s.salesman_id, s.nombre, s.city, s.comission
ORDER BY Ventas DESC;

-- Busca los 5 primeros customers ordenados por id
SELECT * FROM ej6.customer order by customer_id limit 5;

-- Saca el registro purch_amt menor
SELECT purch_amt FROM ej6.orders order by purch_amt limit 1;

-- Saca el registro purch_amt mayor
SELECT purch_amt FROM ej6.orders order by purch_amt desc limit 1;