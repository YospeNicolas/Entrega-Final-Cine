-- Eliminar el trigger ActualizarTotalVenta si existe
DROP TRIGGER IF EXISTS ActualizarTotalVenta;

-- Crear el trigger ActualizarTotalVenta
DELIMITER //
CREATE TRIGGER ActualizarTotalVenta AFTER INSERT ON DetallesVenta
FOR EACH ROW
BEGIN
    DECLARE total_venta DECIMAL(10, 2);
    SELECT SUM(PrecioUnitario * NumAsientos) INTO total_venta FROM DetallesVenta WHERE VentaID = NEW.VentaID;
    UPDATE Ventas SET TotalVenta = total_venta WHERE VentaID = NEW.VentaID;
END;
//
DELIMITER ;

-- Eliminar el trigger ActualizarIngresosDiarios si existe
DROP TRIGGER IF EXISTS ActualizarIngresosDiarios;

-- Crear el trigger ActualizarIngresosDiarios
DELIMITER //
CREATE TRIGGER ActualizarIngresosDiarios AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
    DECLARE ingreso_total DECIMAL(10, 2);
    SELECT SUM(TotalVenta) INTO ingreso_total FROM Ventas WHERE FechaVenta = NEW.FechaVenta;
    INSERT INTO HistorialIngresos (Fecha, IngresoTotal) VALUES (NEW.FechaVenta, ingreso_total) ON DUPLICATE KEY UPDATE IngresoTotal = ingreso_total;
END;
//
DELIMITER ;
