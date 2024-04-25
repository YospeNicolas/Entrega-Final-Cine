DROP SCHEMA IF EXISTS cinesyospe;
CREATE SCHEMA IF NOT EXISTS cinesyospe;

-- Creación de la base de datos si es que no existe
CREATE DATABASE IF NOT EXISTS cinesyospe;

-- Uso de la base de datos creada
USE cinesyospe;

-- Tabla Generos: Almacena los géneros de las películas.
CREATE TABLE IF NOT EXISTS Generos (
    GeneroID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL -- Nombre del género
);

-- Tabla Directores: Almacena los directores de las películas.
CREATE TABLE IF NOT EXISTS Directores (
    DirectorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL -- Nombre del director
);

-- Tabla Peliculas: Almacena información sobre las películas.
CREATE TABLE IF NOT EXISTS Peliculas (
    PeliculaID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL, -- Título de la película
    GeneroID INT, -- ID del género de la película
    DirectorID INT, -- ID del director de la película
    DuracionMinutos INT, -- Duración en minutos
    Clasificacion VARCHAR(10), -- Clasificación de la película
    Sinopsis TEXT, -- Sinopsis de la película
    FOREIGN KEY (GeneroID) REFERENCES Generos(GeneroID), -- Clave foránea al género
    FOREIGN KEY (DirectorID) REFERENCES Directores(DirectorID) -- Clave foránea al director
);


-- Tabla Actores: Almacena información sobre los actores de las películas.
CREATE TABLE IF NOT EXISTS Actores (
    ActorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL -- Nombre del actor
);

-- Tabla CalificacionesPeliculas: Almacena las calificaciones de las películas.
CREATE TABLE IF NOT EXISTS CalificacionesPeliculas (
    CalificacionID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL -- Nombre de la calificación
);

-- Tabla Promociones: Almacena información sobre las promociones del cine.
CREATE TABLE IF NOT EXISTS Promociones (
    PromocionID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL, -- Nombre de la promoción
    Descripcion TEXT, -- Descripción de la promoción
    Descuento DECIMAL(5, 2) -- Descuento de la promoción
);

-- Tabla CategoriasAsientos: Almacena las categorías de los asientos en las salas.
CREATE TABLE IF NOT EXISTS CategoriasAsientos (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL, -- Nombre de la categoría de asientos
    Descripcion TEXT -- Descripción de la categoría de asientos
);

-- Tabla Sucursales: Almacena información sobre las sucursales.
CREATE TABLE IF NOT EXISTS Sucursales (
    SucursalID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL, -- Nombre de la sucursal
    Direccion VARCHAR(255) NOT NULL, -- Dirección de la sucursal
    Ciudad VARCHAR(100) NOT NULL, -- Ciudad de la sucursal
    Estado VARCHAR(100) NOT NULL, -- Estado de la sucursal
    CodigoPostal VARCHAR(10) NOT NULL -- Código postal de la sucursal
);

-- Tabla Empleados: Almacena información sobre los empleados.
CREATE TABLE IF NOT EXISTS Empleados (
    EmpleadoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL, -- Nombre del empleado
    Apellido VARCHAR(100) NOT NULL, -- Apellido del empleado
    Email VARCHAR(255) NOT NULL, -- Correo electrónico del empleado
    Telefono VARCHAR(20), -- Teléfono del empleado
    Direccion VARCHAR(255), -- Dirección del empleado
    SucursalID INT, -- ID de la sucursal donde trabaja el empleado
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID) -- Clave foránea a la sucursal
);

-- Tabla Salas: Almacena información sobre las salas de los cines.
CREATE TABLE IF NOT EXISTS Salas (
    SalaID INT AUTO_INCREMENT PRIMARY KEY,
    SucursalID INT, -- ID de la sucursal a la que pertenece la sala
    Nombre VARCHAR(100) NOT NULL, -- Nombre de la sala
    Capacidad INT, -- Capacidad de la sala
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID) -- Clave foránea a la sucursal
);

-- Tabla Asientos: Almacena información sobre los asientos de las salas.
CREATE TABLE IF NOT EXISTS Asientos (
    AsientoID INT AUTO_INCREMENT PRIMARY KEY,
    SalaID INT, -- ID de la sala a la que pertenece el asiento
    CategoriaID INT, -- ID de la categoría de asiento
    Numero INT, -- Número del asiento
    FOREIGN KEY (SalaID) REFERENCES Salas(SalaID), -- Clave foránea a la sala
    FOREIGN KEY (CategoriaID) REFERENCES CategoriasAsientos(CategoriaID) -- Clave foránea a la categoría de asiento
);

-- Tabla Horarios: Almacena información sobre los horarios de las películas en las salas.
CREATE TABLE IF NOT EXISTS Horarios (
    HorarioID INT AUTO_INCREMENT PRIMARY KEY,
    SalaID INT, -- ID de la sala donde se proyecta la película
    PeliculaID INT, -- ID de la película proyectada
    Fecha DATE, -- Fecha de proyección
    HoraInicio TIME, -- Hora de inicio de la proyección
    FOREIGN KEY (SalaID) REFERENCES Salas(SalaID), -- Clave foránea a la sala
    FOREIGN KEY (PeliculaID) REFERENCES Peliculas(PeliculaID) -- Clave foránea a la película
);

-- Tabla Clientes: Almacena información sobre los clientes.
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL, -- Nombre del cliente
    Apellido VARCHAR(100) NOT NULL, -- Apellido del cliente
    Email VARCHAR(255) NOT NULL, -- Correo electrónico del cliente
    Telefono VARCHAR(20), -- Teléfono del cliente
    Direccion VARCHAR(255) -- Dirección del cliente
);

-- Tabla Reservas: Almacena información sobre las reservas de asientos para las películas.
CREATE TABLE IF NOT EXISTS Reservas (
    ReservaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT, -- ID del cliente que realiza la reserva
    HorarioID INT, -- ID del horario de proyección
    NumAsientos INT, -- Número de asientos reservados
    Total DECIMAL(10, 2), -- Total a pagar por la reserva
    FechaReserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID), -- Clave foránea al cliente
    FOREIGN KEY (HorarioID) REFERENCES Horarios(HorarioID) -- Clave foránea al horario de proyección
);

-- Tabla Ventas: Almacena información sobre las ventas de boletos o entradas.
CREATE TABLE IF NOT EXISTS Ventas (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    EmpleadoID INT, -- ID del empleado que realiza la venta
    FechaVenta DATE, -- Fecha de la venta
    TotalVenta DECIMAL(10, 2), -- Total de la venta
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID) -- Clave foránea al empleado
);

-- Tabla Facturas: Almacena información sobre las facturas generadas por las ventas.
CREATE TABLE IF NOT EXISTS Facturas (
    FacturaID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT, -- ID de la venta asociada a la factura
    FechaFactura DATE, -- Fecha de la factura
    TotalFactura DECIMAL(10, 2), -- Total de la factura
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID) -- Clave foránea a la venta
);

-- Tabla DetallesVenta: Almacena información detallada sobre las ventas de boletos o entradas.
CREATE TABLE IF NOT EXISTS DetallesVenta (
    DetalleVentaID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT, -- ID de la venta asociada al detalle
    PeliculaID INT, -- ID de la película vendida
    NumAsientos INT, -- Número de asientos vendidos
    PrecioUnitario DECIMAL(10, 2), -- Precio unitario del boleto
    Total DECIMAL(10, 2), -- Total de la venta
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID), -- Clave foránea a la venta
    FOREIGN KEY (PeliculaID) REFERENCES Peliculas(PeliculaID) -- Clave foránea a la película
);

-- Tabla HistorialIngresos: Almacena el historial de ingresos generados por las ventas.
CREATE TABLE IF NOT EXISTS HistorialIngresos (
    IngresoID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE, -- Fecha del ingreso
    IngresoTotal DECIMAL(10, 2) -- Total de ingresos en la fecha
);

-- Tabla Candy: Almacena información sobre la comida y bebida.
CREATE TABLE IF NOT EXISTS Candy (
    CandyID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL, -- Nombre del artículo de Candy
    Descripcion TEXT, -- Descripción del artículo de Candy
    Precio DECIMAL(10, 2) NOT NULL, -- Precio del artículo de Candy
    VentaID INT, -- ID de la venta asociada (opcional)
    DetalleVentaID INT, -- ID del detalle de venta asociado (opcional)
    FacturaID INT, -- ID de la factura asociada (opcional)
    PromocionID INT, -- ID de la promoción asociada (opcional)
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (DetalleVentaID) REFERENCES DetallesVenta(DetalleVentaID),
    FOREIGN KEY (FacturaID) REFERENCES Facturas(FacturaID),
    FOREIGN KEY (PromocionID) REFERENCES Promociones(PromocionID)
);


