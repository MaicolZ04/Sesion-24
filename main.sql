-- Crear tabla "Bibliotecas"
CREATE TABLE Bibliotecas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Ubicacion VARCHAR(100) NOT NULL
);

-- Crear tabla "Autores"
CREATE TABLE Autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Nacionalidad VARCHAR(50) NOT NULL
);

-- Crear tabla "Libros"
CREATE TABLE Libros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Titulo VARCHAR(100) NOT NULL,
  Genero VARCHAR(50) NOT NULL,
  Ano_Publicacion INT NOT NULL,
  Autor_ID INT,
  FOREIGN KEY (Autor_ID) REFERENCES Autores(id) ON DELETE CASCADE
);

-- Insertar información "Autores"
INSERT INTO Autores (Nombre, Nacionalidad)
VALUES
('William Shakespeare', 'Inglesa'),
('Gabriel García Márquez', 'Colombiana'),
('Dante Alighieri', 'Italiana'),
('Donald Knuth', 'Estadounidense');

-- Insertar información "Libros"
INSERT INTO Libros (Titulo, Genero, Ano_Publicacion, Autor_ID)
VALUES
('El sueño de una noche de verano', 'Teatro, Comedia', 1600, 1),
('Cien años de soledad', 'Novela, Realismo mágico', 1967, 2),
('El amor en los tiempos del cólera', 'Novela, Novela de amor', 1985, 2),
('Romeo y Julieta', 'Tragedia', 1597, 1),
('La Divina Comedia', 'Epopeya', 1320, 3),
('El arte de la programación', 'Tecnología', 2010, 4);

-- Consultar datos
SELECT * FROM Autores;
SELECT * FROM Libros;

-- consulta para obtener todos los libros de un autor específico

SELECT Libros.Titulo, Libros.Genero, Libros.Ano_Publicacion, Autores.Nombre AS Autor
FROM Libros
JOIN Autores ON Libros.Autor_ID = Autores.ID
WHERE Autores.Nombre = 'Gabriel García Márquez';

--  consulta para obtener todos los libros publicados después del año 2000

SELECT Libros.Titulo, Libros.Ano_Publicacion, Autores.Nombre AS Autor
FROM Libros
JOIN Autores ON Libros.Autor_ID = Autores.id
WHERE Libros.Ano_Publicacion > 2000;

--  consulta para obtener los autores que han publicado más de un libro

SELECT Autores.Nombre, COUNT(Libros.ID) as Cantidad_Libros 
from Libros 
JOIN Autores ON Libros.Autor_ID=Autores.ID 
GROUP by Autores.Nombre 
HAVING Cantidad_Libros>1;

-- Actualizar el género de un libro específico

UPDATE Libros
SET Genero = 'melodrama'
WHERE Titulo = 'Romeo y Julieta';

SELECT * FROM Libros;

--  Elimina un registro de la tabla "Autores" y asegúrate de que los libros relacionados también se eliminen

DELETE FROM Autores
WHERE id = 4;

SELECT * FROM Autores;
SELECT * FROM Libros;