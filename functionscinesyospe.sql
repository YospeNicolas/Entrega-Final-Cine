-- Cambiamos el delimitador para que pueda reconocer las funciones correctamente.
DELIMITER //

-- Eliminamos la función si ya existe, así evitamos conflictos.
DROP FUNCTION IF EXISTS CalcularTotalVentasEmpleado;

-- Creamos una función que calcule el total de ventas de un empleado en un rango de fechas.
CREATE FUNCTION CalcularTotalVentasEmpleado(empleado_id INT, fecha_inicio DATE, fecha_fin DATE) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    -- Declaramos una variable para almacenar el total de ventas.
    DECLARE total DECIMAL(10, 2) DEFAULT 0;
    -- Buscamos en la tabla de ventas el total de ventas del empleado en el rango de fechas.
    SELECT COALESCE(SUM(v.TotalVenta), 0) INTO total 
    FROM Ventas v
    INNER JOIN Empleados e ON v.EmpleadoID = e.EmpleadoID
    WHERE v.EmpleadoID = empleado_id AND v.FechaVenta BETWEEN fecha_inicio AND fecha_fin;
    -- Retornamos el total de ventas, si no hay ventas, retornamos cero.
    RETURN total;
END //

-- Eliminamos la función si ya existe, así evitamos conflictos.
DROP FUNCTION IF EXISTS ObtenerNombreCompletoEmpleado;

-- Creamos una función que obtiene el nombre completo de un empleado dado su ID.
CREATE FUNCTION ObtenerNombreCompletoEmpleado(empleado_id INT) RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    -- Declaramos una variable para almacenar el nombre completo.
    DECLARE nombre_completo VARCHAR(200);
    -- Buscamos en la tabla de empleados el nombre completo del empleado.
    SELECT CONCAT(Nombre, ' ', Apellido) INTO nombre_completo FROM Empleados WHERE EmpleadoID = empleado_id;
    -- Retornamos el nombre completo del empleado.
    RETURN nombre_completo;
END //

-- Eliminamos la función si ya existe, así evitamos conflictos.
DROP FUNCTION IF EXISTS ContarReservasPorCliente;

-- Creamos una función que cuenta el número de reservas realizadas por un cliente dado su ID.
CREATE FUNCTION ContarReservasPorCliente(cliente_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    -- Declaramos una variable para almacenar el total de reservas.
    DECLARE total_reservas INT DEFAULT 0;
    -- Contamos el número de reservas asociadas al cliente.
    SELECT COUNT(*) INTO total_reservas FROM Reservas WHERE ClienteID = cliente_id;
    -- Retornamos el total de reservas.
    RETURN total_reservas;
END
 //

-- Eliminamos la función si ya existe, así evitamos conflictos.
DROP FUNCTION IF EXISTS ObtenerDuracionTotalPeliculasDirector;

-- Creamos una función que obtiene la duración total de las películas dirigidas por un director específico.
CREATE FUNCTION ObtenerDuracionTotalPeliculasDirector(director_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    -- Declaramos una variable para almacenar la duración total.
    DECLARE duracion_total INT DEFAULT 0;
    -- Buscamos en la tabla de películas la suma de las duraciones dirigidas por el director.
    SELECT COALESCE(SUM(DuracionMinutos), 0) INTO duracion_total FROM Peliculas WHERE DirectorID = director_id;
    -- Retornamos la duración total, si no hay películas, retornamos cero.
    RETURN duracion_total;
END //

-- Eliminamos la función si ya existe, así evitamos conflictos.
DROP FUNCTION IF EXISTS ObtenerNombreGenero;

-- Creamos una función que obtiene el nombre del género de una película dado su ID de género.
CREATE FUNCTION ObtenerNombreGenero(genero_id INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    -- Declaramos una variable para almacenar el nombre del género.
    DECLARE nombre_genero VARCHAR(50);
    -- Buscamos en la tabla de géneros el nombre del género correspondiente al ID proporcionado.
    SELECT Nombre INTO nombre_genero FROM Generos WHERE GeneroID = genero_id;
    -- Retornamos el nombre del género.
    RETURN nombre_genero;
END //

-- Eliminamos la función si ya existe, así evitamos conflictos.
DROP FUNCTION IF EXISTS CalcularEdadCliente;

-- Creamos una función que calcula la edad de un cliente basada en su año de nacimiento.
CREATE FUNCTION CalcularEdadCliente(year_of_birth INT) RETURNS INT
DETERMINISTIC
BEGIN
    -- Declaramos variables para almacenar el año actual y la edad del cliente.
    DECLARE current_year INT;
    DECLARE age INT;
    -- Obtenemos el año actual.
    SET current_year = YEAR(CURRENT_DATE());
    -- Calculamos la edad restando el año de nacimiento al año actual.
    SET age = current_year - year_of_birth;
    -- Retornamos la edad calculada.
    RETURN age;
END //

-- Eliminamos la función si ya existe, así evitamos conflictos.
DROP FUNCTION IF EXISTS ObtenerNombrePromocion;

-- Creamos una función que obtiene el nombre de una promoción dado su ID de promoción.
CREATE FUNCTION ObtenerNombrePromocion(promocion_id INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    -- Declaramos una variable para almacenar el nombre de la promoción.
    DECLARE nombre_promocion VARCHAR(100);
    -- Buscamos en la tabla de promociones el nombre de la promoción correspondiente al ID proporcionado.
    SELECT Nombre INTO nombre_promocion FROM Promociones WHERE PromocionID = promocion_id;
    -- Retornamos el nombre de la promoción.
    RETURN nombre_promocion;
END //

-- Eliminamos la función si ya existe, así evitamos conflictos.
DROP FUNCTION IF EXISTS ObtenerDescripcionPelicula;

-- Creamos una función que obtiene la descripción de una película dado su ID de película.
CREATE FUNCTION ObtenerDescripcionPelicula(pelicula_id INT) RETURNS TEXT
DETERMINISTIC
BEGIN
    -- Declaramos una variable para almacenar la descripción de la película.
    DECLARE descripcion_pelicula TEXT;
    -- Buscamos en la tabla de películas la sinopsis correspondiente al ID proporcionado.
    SELECT Sinopsis INTO descripcion_pelicula FROM Peliculas WHERE PeliculaID = pelicula_id;
    -- Retornamos la descripción de la película.
    RETURN descripcion_pelicula;
END //

DELIMITER ;
