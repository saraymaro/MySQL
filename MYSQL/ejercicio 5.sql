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
(null, 'España', '2023-10-31 00:00:00'),
(null, 'Italia', '2023-10-31 00:00:00'),
(null, 'Australia', '2023-10-31 00:00:00'),
(null, 'Brasil', '2023-10-31 00:00:00'),
(null, 'Japón', '2023-10-31 00:00:00'),
(null, 'México', '2023-10-31 00:00:00'),
(null, 'Argentina', '2023-10-31 00:00:00'),
(null, 'China', '2023-10-31 00:00:00'),
(null, 'India', '2023-10-31 00:00:00'),
(null, 'Rusia', '2023-10-31 00:00:00'),
(null, 'Sudáfrica', '2023-10-31 00:00:00'),
(null, 'Egipto', '2023-10-31 00:00:00'),
(null, 'Grecia', '2023-10-31 00:00:00'),
(null, 'Tailandia', '2023-10-31 00:00:00'),
(null, 'Nueva Zelanda', '2023-10-31 00:00:00'),
(null, 'Reino Unido', '2023-10-31 00:00:00');

select * from ej5.country;

insert into ej5.city (city_id, city, country_id, last_update) values
(null, 'Nueva York', 1, '2023-10-31 00:00:00'),
(null, 'Toronto', 2, '2023-10-31 00:00:00'),
(null, 'París', 3, '2023-10-31 00:00:00'),
(null, 'Madrid', 4, '2023-10-31 00:00:00'),
(null, 'Berlín', 5, '2023-10-31 00:00:00'),
(null, 'Roma', 6, '2023-10-31 00:00:00'),
(null, 'Sidney', 7, '2023-10-31 00:00:00'),
(null, 'Río de Janeiro', 8, '2023-10-31 00:00:00'),
(null, 'Tokio', 9, '2023-10-31 00:00:00'),
(null, 'Ciudad de México', 10, '2023-10-31 00:00:00'),
(null, 'Buenos Aires', 11, '2023-10-31 00:00:00'),
(null, 'Pekín', 12, '2023-10-31 00:00:00'),
(null, 'Nueva Delhi', 13, '2023-10-31 00:00:00'),
(null, 'Moscú', 14, '2023-10-31 00:00:00'),
(null, 'Ciudad del Cabo', 15, '2023-10-31 00:00:00'),
(null, 'El Cairo', 16, '2023-10-31 00:00:00'),
(null, 'Atenas', 17, '2023-10-31 00:00:00'),
(null, 'Bangkok', 18, '2023-10-31 00:00:00'),
(null, 'Auckland', 19, '2023-10-31 00:00:00'),
(null, 'Londres', 20, '2023-10-31 00:00:00');

select * from ej5.city;

insert into ej5.address (address_id, address, district, postal_code, phone, location, city_id, last_update) values
(null, '123 Main Street', 'Manhattan', '10001', '+1-555-123-4567', 'NYC', 1, '2023-10-31 00:00:00'),
(null, '456 Elm Avenue', 'Ontario', 'M5V 2N3', '+1-416-789-0123', 'Toronto', 2, '2023-10-31 00:00:00'),
(null, '567 Rue de la Paix', '8ème Arrondissement', '75008', '+33-1-2345-6789', 'París', 3, '2023-10-31 00:00:00'),
(null, '234 Friedrichstraße', 'Mitte', '10117', '+49-30-1234-5678', 'Berlín', 4, '2023-10-31 00:00:00'),
(null, '890 Gran Vía', 'Centro', '28013', '+34-91-987-6543', 'Madrid', 5, '2023-10-31 00:00:00'),
(null, '45 George Street', 'Central Business', '2000', '+61-2-3456-7890', 'Sidney', 7, '2023-10-31 00:00:00'),
(null, '678 Copacabana Avenue', 'Copacabana', '22050-002', '+55-21-98765-4321', 'Río de Janeiro', 8, '2023-10-31 00:00:00'),
(null, '12 Shibuya Crossing', 'Shibuya', '150-8010', '+81-3-1234-5678', 'Tokio', 9, '2023-10-31 00:00:00'),
(null, '234 Avenida Reforma', 'Cuauhtémoc', '06500', '+52-55-6789-1234', 'Ciudad de México', 10, '2023-10-31 00:00:00'),
(null, '456 Avenida Corrientes', 'Balvanera', 'C1043AAJ', '+54-11-3456-7890', 'Buenos Aires', 11, '2023-10-31 00:00:00'),
(null, '789 Wangfujing Street', 'Dongcheng', '100006', '+86-10-1234-5678', 'Pekín', 12, '2023-10-31 00:00:00'),
(null, '321 Connaught Place', 'Connaught Place', '110001', '+91-11-9876-5432', 'Nueva Delhi', 13, '2023-10-31 00:00:00'),
(null, '123 Tverskaya Street', 'Tverskoy', '125009', '+7-495-234-5678', 'Moscú', 14, '2023-10-31 00:00:00'),
(null, '567 Long Street', 'Ciudad del Cabo', '8001', '+27-21-8765-4321', 'Ciudad del Cabo', 15, '2023-10-31 00:00:00'),
(null, '890 Salah Salem Street', 'Heliopolis', '11762', '+20-2-3456-7890', 'El Cairo', 16, '2023-10-31 00:00:00'),
(null, '234 Ermou Street', 'Monastiraki', '105 63', '+30-21-1234-5678', 'Atenas', 17, '2023-10-31 00:00:00'),
(null, '123 Sukhumvit Road', 'Watthana', '10110', '+66-2-3456-7890', 'Bangkok', 18, '2023-10-31 00:00:00'),
(null, '45 Queen Street', 'Auckland Central', '1010', '+64-9-3456-7890', 'Auckland', 19, '2023-10-31 00:00:00'),
(null, '789 Oxford Street', 'Westminster', 'SW1A 1AA', '+44-20-7123-4567', 'Londres', 20, '2023-10-31 00:00:00');

select * from ej5.address;

select * from ej5.country 
inner join city
on country.country_id = city.country_id
inner join address
on city.city_id = address.city_id;