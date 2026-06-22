----------------------
--CREACION DE TABLAS--
----------------------

CREATE DATABASE SistemaGestionVentasBD
GO
USE SistemaGestionVentasBD
GO
CREATE TABLE USUARIO (
	IdUsuario INT PRIMARY KEY IDENTITY (1,1),
	NombreUsuario VARCHAR(50) NOT NULL UNIQUE,
	Contrasena VARCHAR(100) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Rol INT NOT NULL,
	Email VARCHAR(150) NOT NULL UNIQUE,
	Telefono VARCHAR(30) NULL,
	Estado BIT NOT NULL DEFAULT 1
)
GO
CREATE TABLE CLIENTE (
	IdCliente INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(100) NOT NULL,
	Documento VARCHAR(20) NULL,
	Telefono VARCHAR(30) NULL,
	Email VARCHAR(150) NULL,
	Direccion VARCHAR(150) NULL,
	Estado BIT NOT NULL DEFAULT 1
)
GO
CREATE TABLE MARCA (
	IdMarca INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL UNIQUE,
	Descripcion VARCHAR(150) NULL,
	Estado BIT NOT NULL DEFAULT 1
)
GO
CREATE TABLE CATEGORIA (
	IdCategoria INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL UNIQUE,
	Descripcion VARCHAR(150) NULL,
	Estado BIT NOT NULL DEFAULT 1
)
GO
CREATE TABLE PRODUCTO (
	IdProducto INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(100) NOT NULL,
	Descripcion VARCHAR(250) NULL,
	UrlImagen VARCHAR(500) NULL,
	Precio DECIMAL(18,2) NOT NULL CHECK (Precio>0),
	Stock INT NOT NULL CHECK (Stock>=0),
	IdMarca INT NOT NULL,
	IdCategoria INT NOT NULL,
	Medida VARCHAR(50) NULL,
	Estado BIT NOT NULL DEFAULT 1,
	CONSTRAINT FK_PRODUCTO_MARCA FOREIGN KEY (IdMarca) REFERENCES MARCA(IdMarca),
	CONSTRAINT FK_PRODUCTO_CATEGORIA FOREIGN KEY (IdCategoria) REFERENCES CATEGORIA(IdCategoria)
)
GO
CREATE TABLE VENTA (
	IdVenta INT PRIMARY KEY IDENTITY (1,1),
	IdCliente INT NOT NULL,
	IdUsuario INT NOT NULL,
	Fecha DATETIME NOT NULL DEFAULT GETDATE(),
	Total DECIMAL(18,2) NOT NULL CHECK (Total >= 0),
	Estado BIT NOT NULL DEFAULT 1,

	CONSTRAINT FK_VENTA_CLIENTE FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente),
	CONSTRAINT FK_VENTA_USUARIO FOREIGN KEY (IdUsuario) REFERENCES USUARIO(IdUsuario)
)
GO
CREATE TABLE DETALLE_VENTA (
	IdDetalleVenta INT PRIMARY KEY IDENTITY (1,1),
	IdVenta INT NOT NULL,
	IdProducto INT NOT NULL,
	Cantidad INT NOT NULL CHECK (Cantidad > 0),
	PrecioUnitario DECIMAL(18,2) NOT NULL CHECK (PrecioUnitario > 0),

	CONSTRAINT UQ_DETALLE_VENTA_IDVENTA_IDPRODUCTO UNIQUE (IdVenta, IdProducto),
	CONSTRAINT FK_DETALLE_VENTA_VENTA FOREIGN KEY (IdVenta) REFERENCES VENTA(IdVenta),
	CONSTRAINT FK_DETALLE_VENTA_PRODUCTO FOREIGN KEY (IdProducto) REFERENCES PRODUCTO(IdProducto)
)
GO
-----------------
-- MARCAS
-----------------
INSERT INTO MARCA (Nombre, Descripcion)
VALUES ('Piero','Colchones y sommiers'),
('Cannon','Colchones y accesorios para descanso'),
('King Koil','Linea premium de descanso'),
('Simmons','Colchones de alta gama'),
('La Cardeuse','Fabricante argentino de colchones');
GO
-----------------
-- CATEGORIAS
-----------------
INSERT INTO CATEGORIA (Nombre, Descripcion)
VALUES ('Colchones','Colchones de distintos tamaños y tecnologías'),
('Sommiers','Bases y estructuras para colchones'),
('Almohadas','Almohadas viscoelásticas y tradicionales'),
('Protectores','Protectores impermeables y fundas'),
('Accesorios','Complementos para descanso');
GO
-----------------
-- PRODUCTOS
-----------------
INSERT INTO PRODUCTO (Nombre, Descripcion, UrlImagen, Precio, Stock, IdMarca, IdCategoria, Medida)
VALUES
('Colchon Premium Pocket','Resortes individuales con espuma de alta densidad','https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=400&q=80',489900,12,1,1,'190 x 140'),

('Colchon Ortopedico Comfort','Soporte firme para descanso diario','https://images.unsplash.com/photo-1505693533229-832721e85144?auto=format&fit=crop&w=400&q=80',329900,8,2,1,'190 x 140'),

('Sommier Queen Luxury','Base reforzada con patas de madera','https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=400&q=80',259900,5,3,2,'200 x 160'),

('Colchon Espuma Alta Densidad','Espuma 35kg para uso intensivo','https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=500&q=80',279900,15,4,1,'190 x 140'),

('Colchon Infantil Dreams','Diseñado para camas infantiles','https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=450&q=80',129900,7,5,1,'140 x 80'),

('Sommier King Premium','Base premium para colchones King Size','https://images.unsplash.com/photo-1505693533229-832721e85144?auto=format&fit=crop&w=450&q=80',389900,3,2,2,'200 x 180'),

('Colchon Viscoelastico Relax','Tecnologia memory foam para mayor confort','https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=450&q=80',559900,6,3,1,'200 x 160'),

('Colchon Hotel Collection','Linea utilizada en hoteles y alojamientos','https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=550&q=80',699900,4,4,1,'200 x 180'),

('Almohada Memory Foam','Almohada ergonomica viscoelastica','https://images.unsplash.com/photo-1505693533229-832721e85144?auto=format&fit=crop&w=350&q=80',45900,20,1,3,'60 x 40'),

('Protector Impermeable Premium','Proteccion contra liquidos y manchas','https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=350&q=80',28900,18,2,4,'Queen');
GO