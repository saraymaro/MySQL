# Preparando la database (BBDD)
DROP DATABASE IF EXISTS DB_MOVIES;
CREATE DATABASE IF NOT EXISTS DB_MOVIES;
USE DB_MOVIES;
# Creando las tablas
CREATE TABLE IF NOT EXISTS movies(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    year INT,
    image_url VARCHAR(255),
    certificate VARCHAR(255),
    runtime INT,
    imdb_rating FLOAT,
    description TEXT,
    metascore INT,
    votes INT,
    gross INT
);
    
CREATE TABLE IF NOT EXISTS directors(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45),
    about TEXT
);

CREATE TABLE IF NOT EXISTS movies_directors(
    movies_id integer NOT NULL,
	directors_id integer NOT NULL,
	primary key (movies_id, directors_id),
	foreign key (movies_id) references movies(id),
	foreign key (directors_id) references directors(id)
);

CREATE TABLE IF NOT EXISTS stars(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45),
    about TEXT
);

CREATE TABLE movies_stars(
    movies_id INT AUTO_INCREMENT,
	stars_id INT,
	PRIMARY KEY (movies_id, stars_id),
	FOREIGN KEY (movies_id) REFERENCES movies(id),
	FOREIGN KEY (stars_id) REFERENCES stars(id)
);

CREATE TABLE IF NOT EXISTS genres(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
	INDEX (id) 
);

CREATE TABLE IF NOT EXISTS movies_genres(
    movies_id INT NOT NULL,
	genres_id INT NOT NULL,
	PRIMARY KEY (movies_id, genres_id),
	CONSTRAINT `fk_movies_genres_movies_id`
	FOREIGN KEY (movies_id) REFERENCES movies(id),
	INDEX (genres_id) ,
    CONSTRAINT `fk_movies_genres_genres_id`
	FOREIGN KEY (genres_id) REFERENCES genres(id)
);

# Introduciendo los datos en las tablas (INSERTS)
INSERT INTO 
	movies (id, title, year, image_url, certificate, runtime, imdb_rating, description, metascore, votes, gross) 
VALUES
	(NULL, 'Pulp Fiction', 1994, 'https://www.imdb.com/title/tt0110912/mediaviewer/rm4283528192/?ref_=tt_ov_i', 'NO', 1, 8.9, 'Las vidas de dos mafiosos, un boxeador, la esposa de un gánster y un par de bandidos se entrelazan en cuatro historias de violencia y redención', 89, 2000000, 1),
	(NULL, 'Interstellar', 2014, 'https://www.imdb.com/title/tt0816692/mediaviewer/rm2861200384/?ref_=tt_ov_i', 'NO', 1, 8.6, 'Un equipo de exploradores viaja a través de un agujero de gusano en el espacio en un intento de garantizar la supervivencia de la humanidad.', 86, 1700000, NULL),
    (NULL, 'The Equalizer: El protector', 2014,   'https://www.imdb.com/title/tt0455944/mediaviewer/rm2786566657/?ref_=tt_ov_i', 'NO', 1, 7.2, 'Un hombre cree que ha dejado su misterioso pasado atrás y que puede llevar una nueva vida en paz. Pero cuando conoce a una joven bajo el control de gánsteres rusos ultra-violentos, no puede quedarse de brazos cruzados - tiene que ayudarla.', 72, 364000, NULL),
    (NULL, 'El indomable Will Hunting', 1997,   'https://www.imdb.com/title/tt0119217/mediaviewer/rm2548229889/?ref_=tt_ov_i', 'NO', 1, 8.3, 'Will Hunting, un conserje del MIT, tiene un don para las matemáticas, pero necesita la ayuda de un psicólogo para encontrar el rumbo de su vida.', 83, 941000, NULL),
    (NULL, 'Regreso al futuro', 1895,  'https://www.imdb.com/title/tt0088763/mediaviewer/rm3415438592/?ref_=tt_ov_i', 'NO', 1, 8.5, 'Marty McFly, un estudiante de secundaria de 17 años, es enviado accidentalmente treinta años al pasado en un DeLorean que viaja en el tiempo, inventado por su gran amigo, el excéntrico científico Doc Brown.', 85, 12000000, NULL),
	(NULL, 'Kill Bill: Volumen 1', 2003,  'https://www.imdb.com/title/tt0266697/mediaviewer/rm3086980609/?ref_=tt_ov_i', 'NO', 1, 8.2, 'Tras despertar de un coma de cuatro años, una antigua asesina se venga del equipo de asesinos que la traicionó.', 82, 11000000, NULL),
    (NULL, 'Pearl Harbor', 2001,  'https://www.imdb.com/title/tt0213149/mediaviewer/rm2150209536/?ref_=tt_ov_i', 'NO', 1, 6.2, 'Un cuento de guerra y amor mezclado con historia, sigue a dos amigos de toda la vida y a una hermosa enfermera que se encuentran atrapados en el horror de la mañana de domingo más famosa de 1941.', 62, 3290000, NULL),
    (NULL, 'The Purge: La noche de las bestias', 2013,  'https://www.imdb.com/title/tt2184339/mediaviewer/rm4233849600/?ref_=tt_ov_i', 'NO', 1, 5.7, 'Una familia adinerada es retenida como rehén por albergar al objetivo de un sindicato asesino durante la Purga, un período de 12 horas en el que cualquier delito es legal.', 57, 2200000, NULL),
	(NULL, 'Náufrago', 2013,  'https://www.imdb.com/title/tt0162222/mediaviewer/rm2572386305/?ref_=tt_ov_i', 'NO', 1, 7.8, 'Un ejecutivo de FedEx debe transformarse física y emocionalmente para sobrevivir a un aterrizaje forzoso en una isla desierta.', 78, 578000, NULL);

INSERT INTO 
	directors (id, name, about) 
VALUES
	(NULL, 'Robert Zemeckis', 'Un niño prodigio con efectos especiales, Robert es del campo de la realización de películas de Spielberg ( Steven Spielberg produjo muchas de sus películas). Trabajando generalmente con su compañero de escritura Bob Gale , las películas anteriores de Robert muestran que tiene talento para la comedia alocada'),
	(NULL, 'Quentin Tarantino', 'Quentin Jerome Tarantino es un director, productor, guionista, escritor y editor estadounidense. Su carrera comenzó a finales de la década de 1980, cuando escribió y dirigió My Best Friends Birthday'),
    (NULL, 'Christopher Nolan', 'Christopher Edward Nolan es un director de cine, guionista, productor y editor británico-estadounidense. Nacido y criado en Londres, Nolan desarrolló un interés por el cine desde una edad temprana. Después de estudiar literatura inglesa en el University College de Londres, debutó en el largometraje con Following.'),
    (NULL, 'Antoine Fuqua', 'Antoine Fuqua es un director de cine estadounidense. Dirigió Training Day, The Replacement Killers, Tears of the Sun, King Arthur, Shooter y Brooklyns Finest, entre otras películas'),
	(NULL, 'Gus Van Sant', 'Gus Van Sant es un director de cine, productor, guionista y escritor estadounidense. Candidato al Premio Óscar como mejor director por Good Will Hunting y Milk y ganador de la Palma de Oro en el prestigioso festival de Cannes por Elephant.'),
    (NULL, 'Michael Bay', 'Michael Benjamin Bay ​ es un cineasta estadounidense conocido por dirigir y producir películas de acción de gran presupuesto caracterizadas por su narración rápida y el uso extensivo de efectos especiales, incluyendo frecuentemente explosiones.​​'),
	(NULL, 'James DeMonaco', 'James DeMonaco​ es un guionista, director y productor estadounidense más conocido por su trabajo en las películas de The Purge, ​ The Purge: Anarchy, The Purge: Election Year, ​ y Staten Island.​');

INSERT INTO 
	movies_directors(movies_id, directors_id)
VALUES
	(1, 2), (2,3), (3,4), (4,5), (5,1), (6,2), (7, 6), (8, 7), (9, 1);

INSERT INTO
	stars(id, name, about)
VALUES
	(NULL, 'John Travolta', 'John Joseph Travolta es un actor, cantante, músico, bailarín, productor de cine, productor discográfico de cine, televisión y teatro, además de piloto estadounidense y ganador de un Globo de Oro.'),
	(NULL, 'Uma Thurman', 'Uma Karuna Thurman es una actriz de cine y exmodelo estadounidense nominada al Óscar y ganadora del Globo de Oro. Comenzó como modelo profesional y acabó dedicándose al cine en 1988, donde ha trabajado tanto en producciones de bajo presupuesto como en superproducciones de grandes estudios.'),
	(NULL, 'Samuel L. Jackson', 'Samuel Leroy Jackson (Washington D. C., 21 de diciembre de 1948), conocido como Samuel L. Jackson, es un actor y productor de cine, televisión y teatro estadounidense. Ha sido candidato al premio Óscar, a los Globos de Oro y al Premio del Sindicato de Actores, así como ganador de un BAFTA al mejor actor de reparto y en 2022 se le entregó un Óscar honorífico a su trayectoria profesional.'),
    (NULL, 'Matthew McConaughey', 'Matthew David McConaughey (Uvalde, Texas; 4 de noviembre de 1969) es un actor y productor de cine y televisión estadounidense. Es ganador de un premio Óscar, un Globo de Oro y un SAG. Conocido por su participación en películas como Dazed and Confused (1993), A Time to Kill (1996), Contact (1997), Frailty (2001), We Are Marshall (2006), Killer Joe (2011), The Lincoln Lawyer (2011), Magic Mike (2012), Bernie (2012), Mud (2012), El lobo de Wall Street (2013), Dallas Buyers Club (2013), Interstellar (2014), Free State of Jones (2016) y The Gentlemen (2019).'),
	(NULL, 'Anne Hathaway', 'Anne Jacqueline Hathaway (Brooklyn, Nueva York; 12 de noviembre de 1982) es una actriz estadounidense. Ganó el premio Óscar, el Globo de Oro, el BAFTA y el SAG a la Mejor actriz de reparto por su interpretación en Los miserables.'),
	(NULL, 'Jessica Chastain', 'Jessica Chastain, ganadora del Oscar tras su papel en Los ojos de Tammy Faye, es una de las actrices de su generación más solicitadas de Hollywood. Ha recibido numerosas nominaciones y reconocimientos mundiales por su trabajo de LA Film Critics, British Academy of Film and TV, Broadcast Film Critics, HFPA, National Board of Review, Screen Actors Guild, Film Independent y de la Academy of Motion Pictures Arts and Sciences, entre otras.Chastain, que comenzó su carrera con pequeños papeles en series como Urgencias o Veronica Mars, dió el salto al cine en 2008 con la película independiente Jolene. Sin embargo, fueron sus papeles en las películas Take Shelter y El árbol de la vida los que le dieron a conocer entre el gran público.'),
	(NULL, 'Denzel Washington', 'Denzel Hayes Washington, Jr. es un actor y director de cine estadounidense, ganador de tres Globos de Oro, un Premio del Sindicato de Actores, un premio Tony y dos premios Óscar; estos por las cintas Glory como mejor actor de reparto en 1989, y por Día de entrenamiento como mejor actor principal en 2001.'),
	(NULL, 'Marton Csokas', 'Marton Csokas es un actor húngaro-neozelandés, pues nació en Nueva Zelanda, pero es hijo de padre húngaro. Reside de manera habitual en los Estados Unidos. En 1989 terminó sus estudios en la New Zealand Drama School.'),
	(NULL, 'Chloë Grace Moretz', 'Chloë Grace Moretz es una actriz y modelo estadounidense. Sus primeras actuaciones las realizó a los siete años en series y películas como The Amityville Horror, Days of Summer, Diary of a Wimpy Kid, Mujeres desesperadas o Dirty Sexy Money. Con estas producciones fue nominada a varios Premios Young Artist.'),
    (NULL, 'Robin Williams', 'Robin McLaurin Williams ​​fue un comediante, actor y actor de voz estadounidense, ganador de un Premio Óscar, cinco Globos de Oro, un Premio del Sindicato de Actores, dos Premios Emmy y tres Premios Grammy. Fue conocido sobre todo por sus actuaciones en películas cómicas tales como Mrs.'),
	(NULL, 'Matt Damon', 'Matthew Paige Damon, conocido simplemente como Matt Damon, es un actor, guionista y productor estadounidense. Desde temprana edad se destacó en sus estudios y comenzó a mostrar interés por la actuación durante la secundaria gracias a sus maestros.'),
	(NULL, 'Ben Affleck', 'Benjamin Géza Affleck-Boldt, conocido simplemente como Ben Affleck, es un actor, director, productor y guionista estadounidense.'),
	(NULL, 'Michael J. Fox', 'Michael Andrew Fox, más conocido como Michael J. Fox, es un ex-actor canadiense-estadounidense, ​​ ocasionalmente es cantante y músico. Su carrera en el cine y la televisión comenzó a fines de los años 70. Entre sus papeles se destacan: Marty McFly en la trilogía de Volver al futuro; Alex P.'),
	(NULL, 'Christopher Lloyd', 'Christopher Alan Lloyd es un actor estadounidense. Ha interpretado a Doc Emmett Brown en la trilogía de Back to the Future, a Fester Addams en The Addams Family y Addams Family Values, y al Juez Doom en ¿Quién engañó a Roger Rabbit?.'),
	(NULL, 'Lea Thompson', 'Lea Kathleen Thompson es una actriz estadounidense conocida principalmente por su papel como Lorraine McFly en la trilogía Back to the Future además de por La Clave Del Éxito con Tom Cruise y Tiburón 3. '),
    (NULL, 'David Carradine', 'John Arthur Carradine, conocido en el cine como David Carradine, fue un actor estadounidense, célebre por su trabajo en la serie de televisión Kung fu y la película Kill Bill.​​ Fue miembro de la familia de actores Carradine la cual se inició con su padre, John Carradine.'),
	(NULL, 'Daryl Hannah', 'Daryl Christine Hannah es una actriz estadounidense. Hizo su debut en la pantalla en 1978. Saltó a la fama tras aparecer en filmes como Blade Runner, donde da vida a la replicante Pris, o la comedia Splash, en la que interpreta a la sirena Madison.'),
    (NULL, 'Kate Beckinsale', 'Kathrin Romany "Kate" Beckinsale es una actriz y modelo británica con un largo recorrido, conocida por su papel como Selene en la saga Underworld entre otras películas de acción y por películas de romance como Much Ado About Nothing o Serendipity.'),
	(NULL, 'Josh Hartnett', 'Joshua Daniel "Josh" Hartnett es un actor y productor de cine estadounidense, protagonista de filmes como La dalia negra, Black Hawk Down, Lucky Number Slevin, Pearl Harbor o Wrath of Man.'),
    (NULL, 'Ethan Hawke', 'Ethan Green Hawke, conocido como Ethan Hawke, es un actor, escritor y director estadounidense. Nominado a los premios Óscar en cuatro ocasiones —tanto como actor y guionista— y a un premio Tony'),
    (NULL, 'Lena Headey', 'Lena Kathren Headey es una actriz británica conocida por su papeles de la reina Gorgo en 300, Sarah Connor en Terminator: The Sarah Connor Chronicles y el de Cersei Lannister en Game of Thrones.'),
	(NULL, 'Max Burkholder', 'Max Henry Wolf Burkholder es un actor estadounidense conocido por interpretar a Max Braverman en la serie Parenthood. Anteriormente trabajó como actor de voz en series animadas como The Land Before Time y en My Friends Tigger & Pooh donde prestaba su voz a Chomper y a Roo respectivamente.'),
	(NULL, 'Tom Hanks', 'Thomas Jeffrey Hanks, más conocido como Tom Hanks, es un actor y productor estadounidense​​. Es uno de los intérpretes más reconocidos de Hollywood, y muchas de sus películas, ya sean dramas o comedias, han recibido reconocimiento internacional.'),
    (NULL, 'Helen Hunt', 'Helen Elizabeth Hunt, conocida como Helen Hunt, es una actriz y cineasta estadounidense, ganadora de los premios Óscar, Globo de Oro y Emmy.'),
	(NULL, 'Paul Sanchez', 'Paul es nativo de California, igualmente orgulloso de sus raíces mexicano-americanas y nativas americanas. Después de graduarse de la escuela secundaria, Paul recibió una beca deportiva para la Universidad de Hawái, se graduó con dos títulos y decidió probar suerte como actor.');

INSERT INTO
	movies_stars(movies_id, stars_id)
VALUES
	(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (2, 6), (3, 7), (3, 8), (3, 9), (4, 10), (4, 11), (4, 12), (5, 13), (5, 14), (5, 15), (6, 2), (6, 16), (6, 17), (7, 12), (7, 18), (7, 19),
    (8, 20), (8, 21), (8, 22), (9, 23), (9, 24), (9, 25);

INSERT INTO
	genres(id, name)
VALUES 
	(NULL, 'CRIMEN'),
    (NULL, 'DRAMA'),
    (NULL, 'AVENTURA'),
    (NULL, 'CIENCIA FICCIÓN'),
	(NULL, 'ACCIÓN'),
    (NULL, 'ROMANCE'),
    (NULL, 'COMEDIA'),
	(NULL, 'SUSPENSE');

INSERT INTO 
	movies_genres(movies_id, genres_id)
VALUES 
	(1, 1), (1, 2), (2, 3), (2, 2), (2, 4), (3, 5), (3, 1), (3, 2), (4, 2), (4, 6), (5, 3), (5, 7), (5, 8);

# Mostrando todos los campos de las tablas
SELECT * FROM movies;
SELECT * FROM movies_directors;
SELECT * FROM stars;
SELECT * FROM movies_stars;
SELECT * FROM genres;
SELECT * FROM movies_genres;

-- 1. Selecciona todos los camos de directores
SELECT * FROM directors;

-- 2. Selecciona solo el campo name y añade 1 alias
SELECT name as nombre_del_director from directors;

-- 3. Orderna la tabla alfabéticamente
select * from directors order by name;

-- 4. Selecciona las películas que tengan en el título ':'
select * from movies where title like '%:%';

-- 5. Selecciona las estrellas que empiecen por M
select * from stars where name like 'M%';

-- 6. Selecciona las estrellas que acabe por E y otro caracter
select * from stars where name like '%E_';

-- 7. Selecciona los años de las películas sin que se repitan
select distinct year from movies;

-- 8. Mostrar cuantos años son diferentes con el alias TOTAL
select count(distinct year) as TOTAL from movies;

-- 9. Muestra la película Pulp Fiction
select * from movies where title = 'Pulp Fiction';

-- 10. Selecciona la película con un id6
select * from movies where id = 6;

-- 11. Selecciona las película con un id superior a 3
select * from movies where id > 3;

-- 12. Selecciona las película con un id inferior o igual a 5
select * from movies where id <= 5;

-- 13. Selecciona las película con un id entre 3-6 incluidos con >< y between
select * from movies where id >= 3 and id <= 6;
select * from movies where id between 3 and 6;

-- 14. Selecciona las películas que no sean del 2013
select * from movies where year != 2013;
select * from movies where year <> 2013;

-- 15. Selecciona las películas que sean del 1895, 1994, 1997
select * from movies where year in (1895, 1994, 1997);

-- 16. Selecciona las películas que no sean del 2013, 2014, 1994
select * from movies where year not in (2013, 2014, 1994);

-- 17. Selecciona las películas que sean del 2000 o posterior y que de valoración sea 8,5 o más
select * from movies where year >= 2000 or imdb_rating >= 8.5;

-- 18. Selecciona las películas que sea menor del 2000 y que de valoración sea más de 8,5
select * from movies where year < 2005  or imdb_rating > 8.5;

-- 19. Ordena las películas por antigüedad y también por valoración
select * from movies order by year, imdb_rating desc;
select * from movies order by 3, 7 desc;

-- 20. Muestra solo 3 estrellas
select * from stars limit 3;

-- 21. Muestra un ranking de 5 películas ordenadas por valoración
select * from movies order by imdb_rating desc limit 5;

-- 22. Saca el valor mínimo y máximo de valoración y pon un alias
select min(imdb_rating) as min_rating, max(imdb_rating) as max_rating from movies;

-- 23. Saca la media de la valoración y pon un alias
select avg(imdb_rating) as rating_avg from movies;

-- 24. Saca la media de la valoración pero solo con dos decimales y pon un alias
select round(avg(imdb_rating), 2) as rating_avg from movies;

-- 25. Muestra el total de directores
select count(*) from directors;

-- 26. Suma todas las valoraciones y redondea a dos decimales
select round(sum(imdb_rating), 2) as rating_points from movies;

-- 27. Saca todas las películas cuya valoración sea más de la media de todas las valoraciones
select * from movies where imdb_rating > (select avg(imdb_rating) from movies);

-- 28. Selecciona todas las películas que no esten entre en id 2 y el 4
select * from movies where not (id between 2 and 4);

-- 29. Muestra el director de todas las películas y ordena por el id del director
select m.title, d.name from movies m
join movies_directors md on m.id = md.movies_id
join directors d on md.directors_id = d.id
order by d.id;

-- 30. Muestra las estrellas que han formado parte de Pulp Fiction, solo muestra title y name
select m.title, s.name from movies m
join movies_stars ms on m.id = ms.movies_id
join stars s on ms.stars_id = s.id
where title = 'Pulp Fiction';

-- 31. Muestra de todas las películas, los géneros a los que pertenezcan
select m.title as Título, g.name as Género from movies m
join movies_genres mg on m.id = mg.movies_id
join genres g on mg.genres_id = g.id;

-- 32. Muestra el título de la plícula, el director y los generos a los que pertenecen las películas
select m.title as Título, d.name as Director, g.name as Género from movies m
join movies_directors md on m.id = md.movies_id
join directors d on md.directors_id = d.id
join movies_genres mg on m.id = mg.movies_id
join genres g on mg.genres_id = g.id;

-- 33. Muestra un listado con todas las películas junto a la suma de los géneros de dicha película
select m.title as Título, count(g.name) as Genres from movies m
join movies_genres mg on m.id = mg.movies_id
join genres g on mg.genres_id = g.id
group by m.title;

-- 34. Muestra el nombre del director y la cantidad de peliculas que tiene
select d.name as Director, count(m.title) as Total_Películas from directors d
join movies_directors md on d.id = md.directors_id
join movies m on md.movies_id = m.id
group by d.name;

-- 35. Muestra la película junto a la valoración en nota (menos de 5 insuficiente, 5 suficiente, etc)
select title as Película,
    case
        when imdb_rating >= 1 and imdb_rating < 5 then 'Insuficiente'
        when imdb_rating >= 5 and imdb_rating < 6 then 'Suficiente'
        when imdb_rating >= 6 and imdb_rating < 7 then 'Bien'
        when imdb_rating >= 7 and imdb_rating < 8 then 'Muy bien'
        when imdb_rating >= 8 and imdb_rating < 9 then 'Notable'
        when imdb_rating >= 9 and imdb_rating < 10 then 'Excelente'
        else 'Error'
    end as Nota
from movies;

-- 36. Actualiza algun caso para que sea 0 o mayor de 10 y volvemos a hacer el ejercicio anterior
update movies set imdb_rating = '0' where imdb_rating = '7,2';

select title as Película,
    case
        when imdb_rating >= 1 and imdb_rating < 5 then 'Insuficiente'
        when imdb_rating >= 5 and imdb_rating < 6 then 'Suficiente'
        when imdb_rating >= 6 and imdb_rating < 7 then 'Bien'
        when imdb_rating >= 7 and imdb_rating < 8 then 'Muy bien'
        when imdb_rating >= 8 and imdb_rating < 9 then 'Notable'
        when imdb_rating >= 9 and imdb_rating < 10 then 'Excelente'
        else 'Error'
    end as Nota
from movies;