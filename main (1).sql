-- crear tabla "Restaurantes"
CREATE TABLE Restaurantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Ubicacion VARCHAR(100) NOT NULL
);
-- crear tabla "Comidas"
CREATE TABLE Comidas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  Precio DECIMAL(10, 2) NOT NULL,
  Restaurante_ID INT,
  FOREIGN KEY (restaurante_ID) REFERENCES Restaurantes(ID) ON DELETE CASCADE
);

-- insertar información "Restaurantes"
INSERT INTO Restaurantes (Nombre, Ubicacion)
VALUES
('La cocina Italiana', 'Centro'),
('Sabor Tropical', 'Norte'),
('Delicias del Mar', 'Sur');

-- insertar información "Comidas"
INSERT INTO Comidas (Nombre, Tipo, Precio, Restaurante_ID)
VALUES
('Pizza Margarita', 'Italiana', 20.50, 1),
('Lasaña de carne', 'Italiana', 25.00, 1),
('Arepa de Queso', 'Colombiana', 5.00, 2),
('Cazuela de Mariscos', 'Mariscos', 30.00, 3),
('Sancocho de Pescado', 'Mariscos', 18.00, 3);

SELECT * FROM Restaurantes;
SELECT * FROM Comidas;

-- buscar platillos que su precio sea  mayor a 20.00

SELECT Nombre, Tipo, Precio
FROM Comidas
WHERE Precio > 20.00;

-- Obtener "Comidas" de un Restaurante en especifico

SELECT Comidas.Nombre, Comidas.Tipo, Comidas.Precio
FROM Comidas
JOIN Restaurantes ON Comidas.Restaurante_ID = Restaurantes.ID
WHERE Restaurantes.Nombre = 'Delicias del Mar';

-- Obtener Restaurantes con mas de 1 comida

SELECT Restaurantes.Nombre, COUNT(Comidas.ID) AS Cantidad_Comidas
FROM Comidas
JOIN Restaurantes ON Comidas.Restaurante_ID = Restaurantes.ID
GROUP BY Restaurantes.Nombre
HAVING Cantidad_Comidas > 1;

-- Actualizar tipo de una comida especifica

UPDATE Comidas
SET Tipo = 'Fusión'
WHERE Nombre = 'Pizza Margarita';

SELECT * FROM Comidas;

-- Eliminar Restaurante y asegurarse de que los platos relacionados tambien sean eliminados

DELETE FROM Restaurantes
WHERE Nombre = 'Sabor Tropical';

SELECT * FROM Restaurantes;
SELECT * FROM Comidas;