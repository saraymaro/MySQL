create database if not exists Ejercicios;
use Ejercicios;

create table if not exists Gnere(
idGnere integer unsigned auto_increment primary key,
Gnere varchar(255)
);
describe Ejercicios.Gnere;

create table if not exists Artist(
idArtist integer unsigned auto_increment primary key,
nameArtist varchar(255)
);
describe Ejercicios.Artist;

create table if not exists Album(
idAlbum integer unsigned auto_increment primary key,
nameAlbum varchar(255),
dateReleased datetime
);
describe Ejercicios.Album;

insert into Ejercicios.Gnere(idGnere, Gnere) values
(null, 'Pop'),
(null, 'Rock'),
(null, 'Flamenco'),
(null, 'Rap'),
(null, 'Freestyle'),
(null, 'Bachata'),
(null, 'Reggae'),
(null, 'Reggaeton'),
(null, 'Techno'),
(null, 'Salsa');

select * from Ejercicios.Gnere;

insert into Ejercicios.Artist(idArtist, nameArtist) values
(null, 'Bruno Mars'),
(null, 'David Bowie'),
(null, 'Rosalia'),
(null, 'Eminem'),
(null, 'Arkano'),
(null, 'Prince Royce'),
(null, 'Bob Marley'),
(null, 'Daddy Yankee'),
(null, 'Richie Hawtin'),
(null, 'Marc Anthony');

select * from Ejercicios.Artist;

insert into Ejercicios.Album(idAlbum, nameAlbum, dateReleased) values
(null, 'Doo-Wops & Hooligans', '2010-10-04'),
(null, 'Space Oddity', '1969-11-14'),
(null, 'El Malquerer', '2018-11-02'),
(null, 'The Eminem Show', '2002-05-26'),
(null, 'Bioluminiscencia', '2017-10-06'),
(null, 'Soy el mismo', '2013-10-08'),
(null, 'Gold', '2005-01-11'),
(null, 'El cartel 3', '2007-11-13'),
(null, 'From My Mind To Yours', '2015-01-01'),
(null, 'Valió la pena', '2004-07-24');

select * from Ejercicios.Album;
