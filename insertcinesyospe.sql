-- Inserción de datos en la tabla Generos
INSERT INTO Generos (Nombre) VALUES 
('Acción'),
('Drama'),
('Comedia'),
('Ciencia ficción'),
('Suspenso');

-- Selección de todos los registros de la tabla Generos
SELECT * FROM Generos;

-- Inserción de datos en la tabla Directores
INSERT INTO Directores (Nombre) VALUES 
('Christopher Nolan'),
('Quentin Tarantino'),
('Steven Spielberg'),
('Martin Scorsese'),
('James Cameron');

-- Selección de todos los registros de la tabla Directores
SELECT * FROM Directores;

-- Inserción de datos en la tabla Peliculas
INSERT INTO Peliculas (Titulo, GeneroID, DirectorID, DuracionMinutos, Clasificacion, Sinopsis) VALUES 
('Inception', 1, 1, 148, 'PG-13', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'),
('Pulp Fiction', 2, 2, 154, 'R', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.');

-- Selección de todos los registros de la tabla Peliculas
SELECT * FROM Peliculas;

-- Inserción de datos en la tabla Actores
INSERT INTO Actores (Nombre) VALUES 
('Leonardo DiCaprio'),
('Brad Pitt'),
('Tom Hanks'),
('Robert De Niro'),
('Meryl Streep');

-- Selección de todos los registros de la tabla Actores
SELECT * FROM Actores;

-- Inserción de datos en la tabla CalificacionesPeliculas
INSERT INTO CalificacionesPeliculas (Nombre) VALUES 
('G'),
('PG'),
('PG-13'),
('R'),
('NC-17');

-- Selección de todos los registros de la tabla CalificacionesPeliculas
SELECT * FROM CalificacionesPeliculas;

-- Inserción de datos en la tabla Promociones
INSERT INTO Promociones (Nombre, Descripcion, Descuento) VALUES 
('2x1 Miércoles', 'Promoción 2x1 en entradas los miércoles', 50.00),
('Día del Espectador', 'Descuento especial para el día del espectador', 25.00),
('Combo Familiar', 'Combo de palomitas y refrescos para toda la familia', 30.00);

-- Selección de todos los registros de la tabla Promociones
SELECT * FROM Promociones;

-- Inserción de datos en la tabla CategoriasAsientos
INSERT INTO CategoriasAsientos (Nombre, Descripcion) VALUES 
('VIP', 'Asientos VIP con mayor comodidad y servicios adicionales'),
('Preferencial', 'Asientos preferenciales con buena vista y espacio adicional'),
('General', 'Asientos estándar para el público general');

-- Selección de todos los registros de la tabla CategoriasAsientos
SELECT * FROM CategoriasAsientos;

-- Inserción de datos en la tabla Sucursales
INSERT INTO Sucursales (Nombre, Direccion, Ciudad, Estado, CodigoPostal) VALUES 
('CineCity', 'Calle Principal 123', 'Ciudad de México', 'CDMX', '12345'),
('CineStar', 'Avenida Central 456', 'Guadalajara', 'Jalisco', '67890'),
('CineMax', 'Calle Secundaria 789', 'Monterrey', 'Nuevo León', '54321');

-- Selección de todos los registros de la tabla Sucursales
SELECT * FROM Sucursales;

-- Inserción de datos en la tabla Empleados
INSERT INTO Empleados (Nombre, Apellido, Email, Telefono, Direccion, SucursalID) VALUES 
('Juan', 'García', 'juan.garcia@example.com', '555-123-4567', 'Calle Libertad 456', 1),
('María', 'Martínez', 'maria.martinez@example.com', '555-234-5678', 'Avenida Independencia 789', 2),
('Carlos', 'López', 'carlos.lopez@example.com', '555-345-6789', 'Paseo de la Reforma 123', 3);

-- Selección de todos los registros de la tabla Empleados
SELECT * FROM Empleados;

-- Inserción de datos en la tabla Salas
INSERT INTO Salas (SucursalID, Nombre, Capacidad) VALUES 
(1, 'Sala 1', 100),
(2, 'Sala 2', 120),
(3, 'Sala 3', 150);

-- Selección de todos los registros de la tabla Salas
SELECT * FROM Salas;

-- Inserción de datos en la tabla Asientos
INSERT INTO Asientos (SalaID, CategoriaID, Numero) VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 2, 3),
(2, 2, 1),
(2, 3, 2),
(3, 3, 1);

-- Selección de todos los registros de la tabla Asientos
SELECT * FROM Asientos;

-- Inserción de datos en la tabla Horarios
INSERT INTO Horarios (SalaID, PeliculaID, Fecha, HoraInicio) VALUES 
(1, 1, '2024-04-24', '15:00:00'),
(2, 2, '2024-04-24', '16:00:00'),
(3, 1, '2024-04-25', '18:00:00');

-- Selección de todos los registros de la tabla Horarios
SELECT * FROM Horarios;

-- Inserción de datos en la tabla Clientes
INSERT INTO Clientes (Nombre, Apellido, Email, Telefono, Direccion) VALUES 
('Ana', 'Pérez', 'ana.perez@example.com', '555-456-7890', 'Calle Principal 789'),
('Luis', 'Gómez', 'luis.gomez@example.com', '555-567-8901', 'Avenida Juárez 234'),
('Laura', 'Fernández', 'laura.fernandez@example.com', '555-678-9012', 'Paseo de la Reforma 567');

-- Selección de todos los registros de la tabla Clientes
SELECT * FROM Clientes;

-- Inserción de datos en la tabla Reservas
INSERT INTO Reservas (ClienteID, HorarioID, NumAsientos, Total) VALUES 
(1, 1, 2, 20.00),
(2, 2, 3, 30.00),
(3, 3, 4, 40.0000);

-- Selección de todos los registros de la tabla Reservas
SELECT * FROM Reservas;

-- Inserción de datos en la tabla Ventas
INSERT INTO Ventas (EmpleadoID, FechaVenta, TotalVenta) VALUES 
(1, '2024-04-24', 100.00),
(2, '2024-04-25', 150.00),
(3, '2024-04-26', 200.00);

-- Selección de todos los registros de la tabla Ventas
SELECT * FROM Ventas;

-- Inserción de datos en la tabla Facturas
INSERT INTO Facturas (VentaID, FechaFactura, TotalFactura) VALUES 
(1, '2024-04-24', 100.00),
(2, '2024-04-25', 150.00),
(3, '2024-04-26', 200.00);

-- Selección de todos los registros de la tabla Facturas
SELECT * FROM Facturas;

-- Inserción de datos en la tabla DetallesVenta
INSERT INTO DetallesVenta (VentaID, PeliculaID, NumAsientos, PrecioUnitario, Total) VALUES 
(1, 1, 2, 10.00, 20.00),
(2, 2, 3, 10.00, 30.00),
(3, 1, 4, 10.00, 40.00);

-- Selección de todos los registros de la tabla DetallesVenta
SELECT * FROM DetallesVenta;

-- Inserción de datos en la tabla HistorialIngresos
INSERT INTO HistorialIngresos (Fecha, IngresoTotal) VALUES 
('2024-04-24', 1000.00),
('2024-04-25', 1500.00),
('2024-04-26', 2000.00);

-- Selección de todos los registros de la tabla HistorialIngresos
SELECT * FROM HistorialIngresos;

-- Inserción de datos en la tabla Candy
INSERT INTO Candy (Nombre, Descripcion, Precio, VentaID, DetalleVentaID, FacturaID, PromocionID) VALUES 
('Palomitas', 'Palomitas de maíz saladas', 5.00, 1, 1, 1, 1),
('Refresco', 'Refresco de cola grande', 4.00, 2, 2, 2, 2),
('Nachos', 'Nachos con queso', 6.00, 3, 3, 3, 3);

-- Selección de todos los registros de la tabla Candy
SELECT * FROM Candy;
