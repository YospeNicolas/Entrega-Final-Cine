-- Este stored procedure registra una nueva venta de boletos en la base de datos.
-- Recibe como parámetros el ID del empleado que realiza la venta, la fecha de la venta y el total de la venta.
-- Inserta una nueva fila en la tabla Ventas con la información proporcionada.
DELIMITER //
CREATE PROCEDURE RegistrarVentaBoletos (
    IN empleado_id INT,
    IN fecha_venta DATE,
    IN total_venta DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Ventas (EmpleadoID, FechaVenta, TotalVenta)
    VALUES (empleado_id, fecha_venta, total_venta);
END //
DELIMITER ;

-- Este stored procedure registra una nueva reserva de asientos en la base de datos.
-- Recibe como parámetros el ID del cliente que realiza la reserva, el ID del horario de proyección, el número de asientos reservados y el total de la reserva.
-- Inserta una nueva fila en la tabla Reservas con la información proporcionada.
DELIMITER //
CREATE PROCEDURE RegistrarReservaAsientos (
    IN cliente_id INT,
    IN horario_id INT,
    IN num_asientos INT,
    IN total DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Reservas (ClienteID, HorarioID, NumAsientos, Total)
    VALUES (cliente_id, horario_id, num_asientos, total);
END //
DELIMITER ;

-- Este stored procedure genera un reporte de ventas por empleado en un rango de fechas.
-- Recibe como parámetros la fecha de inicio y la fecha fin del período para el reporte.
-- Realiza una consulta para obtener el nombre del empleado y el total de ventas realizadas por él en el período especificado.
DELIMITER //
CREATE PROCEDURE ReporteVentasPorEmpleado (
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT e.Nombre AS Empleado, SUM(v.TotalVenta) AS TotalVentas
    FROM Ventas v
    INNER JOIN Empleados e ON v.EmpleadoID = e.EmpleadoID
    WHERE v.FechaVenta BETWEEN fecha_inicio AND fecha_fin
    GROUP BY e.Nombre;
END //
DELIMITER ;
