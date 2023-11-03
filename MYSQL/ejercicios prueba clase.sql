create schema java_bcn_4;
use java_bcn_4;
create table if not exists alumno (
idAlumno int unsigned auto_increment primary key,
nombre varchar(45) not null,
fecha_nacimiento date
);
describe alumno;
select * from alumno;

insert into alumno values (1, 'Saray', 1995-11-25);