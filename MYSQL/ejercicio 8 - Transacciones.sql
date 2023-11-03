DROP SCHEMA IF EXISTS ej5;
CREATE SCHEMA IF NOT EXISTS ej5;
USE ej5 ;

CREATE TABLE IF NOT EXISTS ej5.country (
  country_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  country VARCHAR(45) NOT NULL,
  last_update TIMESTAMP NOT NULL);
  
  CREATE TABLE IF NOT EXISTS ej5.city (
  city_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  city VARCHAR(45) NOT NULL,
  country_id SMALLINT UNSIGNED,
  last_update TIMESTAMP NOT NULL,
	FOREIGN KEY (country_id) REFERENCES country(country_id));
    
    CREATE TABLE IF NOT EXISTS ej5.address (
  address_id SMALLINT  UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  address VARCHAR(45) NOT NULL,
  address2 VARCHAR(45) NULL,
  district VARCHAR(20) NOT NULL,
  postal_code VARCHAR(20) NULL,
  phone VARCHAR(45) NOT NULL,
  location VARCHAR(45) NOT NULL,
  city_id SMALLINT UNSIGNED,
  last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (city_id) REFERENCES ej5.city (city_id));
    
    
insert into ej5.country (country_id, country, last_update) values
(null, 'Estados Unidos', '2023-10-31 00:00:00'),
(null, 'Canadá', '2023-10-31 00:00:00'),
(null, 'Francia', '2023-10-31 00:00:00'),
(null, 'Alemania', '2023-10-31 00:00:00'),
(null, 'España', '2023-10-31 00:00:00');

select * from ej5.country;

insert into ej5.city (city_id, city, country_id, last_update) values
(null, 'Nueva York', 1, '2023-10-31 00:00:00'),
(null, 'Toronto', 2, '2023-10-31 00:00:00'),
(null, 'París', 3, '2023-10-31 00:00:00'),
(null, 'Madrid', 4, '2023-10-31 00:00:00'),
(null, 'Berlín', 5, '2023-10-31 00:00:00');

select * from ej5.city;

insert into ej5.address (address_id, address, district, postal_code, phone, location, city_id, last_update) values
(null, '123 Main Street', 'Manhattan', '10001', '+1-555-123-4567', 'NYC', 1, '2023-10-31 00:00:00'),
(null, '456 Elm Avenue', 'Ontario', 'M5V 2N3', '+1-416-789-0123', 'Toronto', 2, '2023-10-31 00:00:00'),
(null, '567 Rue de la Paix', '8ème Arrondissement', '75008', '+33-1-2345-6789', 'París', 3, '2023-10-31 00:00:00'),
(null, '234 Friedrichstraße', 'Mitte', '10117', '+49-30-1234-5678', 'Berlín', 4, '2023-10-31 00:00:00'),
(null, '890 Gran Vía', 'Centro', '28013', '+34-91-987-6543', 'Madrid', 5, '2023-10-31 00:00:00');

select * from ej5.address;

-- Realiza una transacción con Rollback
BEGIN;
INSERT INTO ej5.country (country_id, country, last_update) VALUES (null, 'Nuevo País', '2023-11-03 00:00:00');
ROLLBACK; 

-- Realiza una transacción con Commit
BEGIN; 
INSERT INTO ej5.country (country_id, country, last_update) VALUES (null, 'Nuevo País', '2023-11-03 00:00:00');
COMMIT; 
