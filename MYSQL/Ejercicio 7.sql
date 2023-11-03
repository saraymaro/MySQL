
CREATE SCHEMA IF NOT EXISTS ej7;
USE ej7;

-- Tablas a relacionar
CREATE TABLE IF NOT EXISTS Estudiantes(
estudiante_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre  VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS Profesores(
profesor_id INT UNSIGNED AUTO_INCREMENT,
nombre  VARCHAR(40) NOT NULL,
PRIMARY KEY (profesor_id)
);
CREATE TABLE IF NOT EXISTS Cursos(
curso_id INT UNSIGNED AUTO_INCREMENT,
nombre  VARCHAR(40) NOT NULL,
profesor_id_tprof INT UNSIGNED,
PRIMARY KEY (curso_id, profesor_id_tprof),
FOREIGN KEY (profesor_id_tprof)
REFERENCES ej7.Profesores(profesor_id)
);

-- Tablas que relacionan
CREATE TABLE IF NOT EXISTS Estudiantes_Cursos(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
estudiante_id INT UNSIGNED,
curso_id INT UNSIGNED,
FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(estudiante_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
ON DELETE CASCADE
ON UPDATE CASCADE);

INSERT INTO Estudiantes (estudiante_id, nombre) VALUES
(null, 'Juan Pérez'),
(null, 'María López'),
(null, 'Luis Ramírez'),
(null, 'Ana Martínez'),
(null, 'Carlos Sánchez');

SELECT * FROM ej7.estudiantes;

INSERT INTO Profesores (profesor_id, nombre) VALUES
(null, 'Isabel García'),
(null, 'Alejandro Martínez'),
(null, 'Laura Rodríguez'),
(null, 'Antonio Fernández'),
(null, 'Carmen Pérez');

SELECT * FROM ej7.profesores;

INSERT INTO Cursos (curso_id, nombre, profesor_id_tprof) VALUES
(null, 'Curso de Matemáticas', 1),
(null, 'Curso de Historia', 2),
(null, 'Curso de Ciencias', 3),
(null, 'Curso de Literatura', 4),
(null, 'Curso de Artes', 5);

SELECT * FROM ej7.cursos;

INSERT INTO Estudiantes_Cursos (id, estudiante_id, curso_id) VALUES
(null, 1, 1),
(null, 2, 2),
(null, 3, 3),
(null, 4, 4),
(null, 5, 5);

SELECT * FROM ej7.Estudiantes_Cursos;

-- Muestra los alumnos a ls que un profesor les da clase
SELECT p.nombre AS Nombre_Profesor, e.nombre AS Nombre_Alumno, c.nombre AS Curso
FROM Profesores p
INNER JOIN Cursos c ON p.profesor_id = c.profesor_id_tprof
INNER JOIN Estudiantes_Cursos ec ON c.curso_id = ec.curso_id
INNER JOIN Estudiantes e ON ec.estudiante_id = e.estudiante_id;

-- Muestra el total de cursos que hace cada profesor
SELECT P.nombre AS Nombre_Profesor, COUNT(C.curso_id) AS Total_Cursos
FROM Profesores P
LEFT JOIN Cursos C ON P.profesor_id = C.profesor_id_tprof
GROUP BY P.profesor_id;

-- Muestra el total de cursos que hace cada alumno
SELECT e.nombre AS Nombre_Alumno, COUNT(ec.curso_id) AS Total_Cursos
FROM Estudiantes e
LEFT JOIN Estudiantes_Cursos ec ON e.estudiante_id = ec.estudiante_id
GROUP BY e.estudiante_id;






