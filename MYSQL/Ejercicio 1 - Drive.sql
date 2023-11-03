DROP SCHEMA IF EXISTS driveej1;
CREATE SCHEMA IF NOT EXISTS driveej1;
USE driveej1;

-- creación de tablas
CREATE TABLE IF NOT EXISTS movies(
	id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	year INT NOT NULL, 
	image_url VARCHAR(250) NOT NULL,
	certificate VARCHAR(45),
	runtime INT,
	imbd_rating FLOAT,
	description TEXT,
	metascore INT,
	votes INT,
	gross INT
);

CREATE TABLE IF NOT EXISTS directors(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	about TEXT
);

CREATE TABLE IF NOT EXISTS stars(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45),
	about TEXT
);

CREATE TABLE IF NOT EXISTS genres(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45)
);

-- tablas relacionadas

CREATE TABLE IF NOT EXISTS movies_directors(
	id INT UNSIGNED AUTO_INCREMENT,
	movies_id INT UNSIGNED,
	directors_id INT UNSIGNED,
    PRIMARY KEY (id, movies_id, directors_id),
	FOREIGN KEY (movies_id) REFERENCES movies(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (directors_id) REFERENCES directors(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS movies_stars(
	id INT UNSIGNED AUTO_INCREMENT,
	movies_id INT UNSIGNED,
	stars_id INT UNSIGNED,
    PRIMARY KEY (id, movies_id, stars_id),
	FOREIGN KEY (movies_id) REFERENCES movies(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (stars_id) REFERENCES stars(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS movies_genres(
	id INT UNSIGNED AUTO_INCREMENT,
	movies_id INT UNSIGNED,
	genres_id INT UNSIGNED,
    PRIMARY KEY (id, movies_id, genres_id),
	FOREIGN KEY (movies_id) REFERENCES movies(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (genres_id) REFERENCES genres(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
-- Inserts para la tabla 'movies'
INSERT INTO movies (title, year, image_url, certificate, runtime, imbd_rating, description, metascore, votes, gross)
VALUES
('Inception', 2010, 'https://www.example.com/inception.jpg', 'PG-13', 148, 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into someone\'s mind.', 74, 2026456, 829895144),
('Interstellar', 2014, 'https://www.example.com/interstellar.jpg', 'PG-13', 169, 8.6, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 74, 1554492, 677471339),
('La La Land', 2016, 'https://www.example.com/la_la_land.jpg', 'PG-13', 128, 8.0, 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.', 93, 539541, 151101803),
('Get Out', 2017, 'https://www.example.com/get_out.jpg', 'R', 104, 7.7, 'A young African-American visits his white girlfriend\'s parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point.', 84, 534712, 176040665),
('Parasite', 2019, 'https://www.example.com/parasite.jpg', 'R', 132, 8.6, 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', 96, 661674, 258817887),
('Joker', 2019, 'https://www.example.com/joker.jpg', 'R', 122, 8.4, 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.', 59, 1046976, 335451311),
('1917', 2019, 'https://www.example.com/1917.jpg', 'R', 119, 8.3, 'April 6th, 1917. As a regiment assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.', 78, 526846, 159227644),
('Nomadland', 2020, 'https://www.example.com/nomadland.jpg', 'R', 107, 7.3, 'After the economic collapse of a company town in rural Nevada, Fern becomes a modern-day nomad, exploring a life outside of conventional society as a modern-day nomad.', 93, 258370, 105185861),
('Dune', 2021, 'https://www.example.com/dune.jpg', 'PG-13', 155, 8.3, 'Feature adaptation of Frank Herbert\'s science fiction novel about the son of a noble family trying to avenge his father\'s death while saving a spice planet that he is entrusted to protect.', 74, 577564, 107308642),
('The Green Mile', 1999, 'https://www.example.com/green_mile.jpg', 'R', 189, 8.6, 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 61, 1137659, 136801374);

select * from movies;

-- Inserts para la tabla 'directors'
INSERT INTO directors (name, about)
VALUES
('Christopher Nolan', 'Christopher Edward Nolan is a British-American film director, producer, and screenwriter known for his distinct filmmaking style and nonlinear storytelling.'),
('Damien Chazelle', 'Damien Sayre Chazelle is an American filmmaker. He is best known for his films Whiplash, La La Land, and First Man.'),
('Quentin Tarantino', 'Quentin Jerome Tarantino is an American film director, screenwriter, producer, and actor known for his unique and often violent style.'),
('Steven Spielberg', 'Steven Allan Spielberg is an American filmmaker. He is considered one of the founding pioneers of the New Hollywood era and one of the most popular directors and producers in film history.'),
('Martin Scorsese', 'Martin Charles Scorsese is an American film director, producer, screenwriter, and actor known for his work on crime and gangster films.'),
('Greta Gerwig', 'Greta Celeste Gerwig is an American actress, playwright, screenwriter, and director known for her work in independent films.'),
('Ava DuVernay', 'Ava Marie DuVernay is an American filmmaker and film distributor known for her work on films promoting social justice and racial equality.'),
('Wes Anderson', 'Wesley Wales Anderson is an American film director, producer, and screenwriter known for his distinctive visual and narrative style.'),
('James Cameron', 'James Francis Cameron is a Canadian filmmaker known for his work on science fiction and epic films, including Titanic and Avatar.'),
('Alfonso Cuarón', 'Alfonso Cuarón Orozco is a Mexican filmmaker known for his work on films such as Gravity and Roma.');

select * from directors;
-- Inserts para la tabla 'stars'

INSERT INTO stars (name, about)
VALUES
('Leonardo DiCaprio', 'Leonardo Wilhelm DiCaprio is an American actor, producer, and environmental activist. He has been nominated for six Academy Awards and has won one for his role in The Revenant.'),
('Joaquin Phoenix', 'Joaquin Rafael Phoenix is an American actor and producer. He has received several accolades, including an Academy Award, a Grammy Award, and two Golden Globe Awards.'),
('Scarlett Johansson', 'Scarlett Ingrid Johansson is an American actress and singer known for her versatile roles in film and her contributions to the Marvel Cinematic Universe.'),
('Meryl Streep', 'Meryl Streep is an American actress known for her exceptional acting skills and numerous awards, including multiple Academy Awards.'),
('Brad Pitt', 'William Bradley Pitt is an American actor and film producer known for his roles in various acclaimed films.'),
('Tom Hanks', 'Tom Hanks is an American actor and filmmaker known for his warm and relatable performances in movies like Forrest Gump and Saving Private Ryan.'),
('Natalie Portman', 'Natalie Portman is an Israeli-American actress known for her versatility and powerful on-screen presence.'),
('Keanu Reeves', 'Keanu Charles Reeves is a Canadian actor known for his roles in The Matrix series and John Wick franchise.'),
('Emma Stone', 'Emma Stone is an American actress known for her charming and charismatic performances in movies like La La Land and The Help.'),
('Robert Downey Jr.', 'Robert John Downey Jr. is an American actor and producer known for his portrayal of Iron Man in the Marvel Cinematic Universe.');

select * from stars;
-- Inserts para la tabla 'genres'
INSERT INTO genres (name)
VALUES
('Action'),
('Comedy'),
('Romance'),
('Horror'),
('Fantasy'),
('Adventure'),
('Animation'),
('Crime'),
('Biography'),
('Musical');
select * from genres;

-- Haz las verificaciones pertinentes para que no se añadan actores repetidos en la tabla stars
ALTER TABLE stars
ADD CONSTRAINT unique_star_name UNIQUE (name);

-- Elimina todos los registros mediante DELETE.
DELETE FROM movies;
DELETE FROM directors;
DELETE FROM stars;
DELETE FROM genres;


