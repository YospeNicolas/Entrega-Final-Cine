-- Vistas.
-- Vista 1: Películas por Género
-- Esta vista muestra el título de la película junto con su género.

DROP VIEW IF EXISTS PeliculasPorGenero;

CREATE VIEW PeliculasPorGenero AS
SELECT p.Titulo, g.Nombre AS Genero
FROM Peliculas p
INNER JOIN Generos g ON p.GeneroID = g.GeneroID;

-- Vista 2: Empleados por Sucursal
-- Esta vista muestra el nombre y apellido de los empleados junto con el nombre de la sucursal en la que trabajan.

DROP VIEW IF EXISTS EmpleadosPorSucursal;

CREATE VIEW EmpleadosPorSucursal AS
SELECT e.Nombre, e.Apellido, s.Nombre AS Sucursal
FROM Empleados e
INNER JOIN Sucursales s ON e.SucursalID = s.SucursalID;

-- Vista 3: Ventas Detalladas
-- Esta vista muestra información detallada sobre las ventas, incluyendo el nombre del empleado que realizó la venta y el total de la venta.

DROP VIEW IF EXISTS VentasDetalladas;


CREATE VIEW VentasDetalladas AS
SELECT v.VentaID, e.Nombre AS Empleado, v.FechaVenta, v.TotalVenta
FROM Ventas v
INNER JOIN Empleados e ON v.EmpleadoID = e.EmpleadoID;

-- Vista 4: Asientos Disponibles
-- Esta vista muestra los asientos disponibles en cada sala.

DROP VIEW IF EXISTS AsientosDisponibles;


CREATE VIEW AsientosDisponibles AS
SELECT s.Nombre AS Sala, COUNT(a.AsientoID) AS AsientosDisponibles
FROM Salas s
LEFT JOIN Asientos a ON s.SalaID = a.SalaID
GROUP BY s.SalaID, s.Nombre;

-- Vista 5: Reservas por Cliente
-- Esta vista muestra las reservas realizadas por cada cliente.

DROP VIEW IF EXISTS ReservasPorCliente;

CREATE VIEW ReservasPorCliente AS
SELECT c.Nombre, c.Apellido, COUNT(r.ReservaID) AS TotalReservas
FROM Clientes c
INNER JOIN Reservas r ON c.ClienteID = r.ClienteID
GROUP BY c.ClienteID, c.Nombre, c.Apellido;

-- Vista 6: Películas Proyectadas Hoy
-- Esta vista muestra las películas que se proyectan hoy en cada sala.

DROP VIEW IF EXISTS PeliculasProyectadasHoy;


CREATE VIEW PeliculasProyectadasHoy AS
SELECT s.Nombre AS Sala, p.Titulo AS Pelicula, h.HoraInicio
FROM Horarios h
INNER JOIN Peliculas p ON h.PeliculaID = p.PeliculaID
INNER JOIN Salas s ON h.SalaID = s.SalaID
WHERE h.Fecha = CURDATE();

-- Vista 7: Ingresos Diarios
-- Esta vista muestra los ingresos generados por ventas en cada día.

DROP VIEW IF EXISTS IngresosDiarios;

CREATE VIEW IngresosDiarios AS
SELECT FechaVenta AS Fecha, SUM(TotalVenta) AS Ingresos
FROM Ventas
GROUP BY FechaVenta;

-- Vista 8: Películas Más Vendidas
-- Esta vista muestra las películas más vendidas junto con el número total de ventas.

DROP VIEW IF EXISTS PeliculasMasVendidas;


CREATE VIEW PeliculasMasVendidas AS
SELECT p.Titulo, COUNT(dv.DetalleVentaID) AS TotalVentas
FROM Peliculas p
INNER JOIN DetallesVenta dv ON p.PeliculaID = dv.PeliculaID
GROUP BY p.PeliculaID, p.Titulo
ORDER BY TotalVentas DESC;
