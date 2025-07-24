-- Base de datos para gestión de panadería
CREATE DATABASE ProductosRossi
GO
USE ProductosRossi

-- Tabla: Direcciones
CREATE TABLE Direcciones (
    DireccionID INT PRIMARY KEY IDENTITY(1,1),
    Calle NVARCHAR(100),
    Numero NVARCHAR(10),
    Localidad NVARCHAR(100),
    Provincia NVARCHAR(100),
    Telefono NVARCHAR(20),
    Email NVARCHAR(100)
);

-- Tabla: Clientes
CREATE TABLE Clientes
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    NombreCompleto NVARCHAR(100) NOT NULL,
    CUIT_CUIL NVARCHAR(20),
    DireccionID INT FOREIGN KEY REFERENCES Direcciones(DireccionID),
    FechaAlta DATE DEFAULT GETDATE(),
    EsActivo BIT DEFAULT 1,
    SaldoActual DECIMAL(10,2) DEFAULT 0
);

-- Tabla: Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY IDENTITY(1,1),
    RazonSocial NVARCHAR(100) NOT NULL,
    CUIT NVARCHAR(20),
    DireccionID INT FOREIGN KEY REFERENCES Direcciones(DireccionID),
    FechaAlta DATE DEFAULT GETDATE(),
    EsActivo BIT DEFAULT 1,
    SaldoActual DECIMAL(10,2) DEFAULT 0
);

-- Tabla: CategoriaProducto
CREATE TABLE CategoriaProducto (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255)
);

-- Tabla: Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    PrecioVenta DECIMAL(10,2) NOT NULL,
    StockActual DECIMAL(10,2) DEFAULT 0,
    CategoriaID INT FOREIGN KEY REFERENCES CategoriaProducto(CategoriaID)
);

-- Tabla: MateriaPrima
CREATE TABLE MateriaPrima (
    MateriaPrimaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    UnidadMedida NVARCHAR(20),
    StockActual DECIMAL(10,2) DEFAULT 0,
    StockMinimo DECIMAL(10,2) DEFAULT 0,
    PrecioCompraUltimo DECIMAL(10,2),
    ProveedorID INT FOREIGN KEY REFERENCES Proveedores(ProveedorID)
);

-- Tabla: Factura
CREATE TABLE Factura (
    FacturaID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    Fecha DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10,2),
    FormaPago NVARCHAR(50),
    Estado NVARCHAR(50)
);

-- Tabla: DetalleFactura
CREATE TABLE DetalleFactura (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    FacturaID INT FOREIGN KEY REFERENCES Factura(FacturaID),
    ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
    Cantidad DECIMAL(10,2),
    PrecioUnitario DECIMAL(10,2),
    Subtotal AS (Cantidad * PrecioUnitario) PERSISTED
);

-- Tabla: CompraMateriaPrima
CREATE TABLE CompraMateriaPrima (
    CompraID INT PRIMARY KEY IDENTITY(1,1),
    ProveedorID INT FOREIGN KEY REFERENCES Proveedores(ProveedorID),
    Fecha DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10,2),
    FormaPago NVARCHAR(50),
    Estado NVARCHAR(50)
);

-- Tabla: DetalleCompraMateriaPrima
CREATE TABLE DetalleCompraMateriaPrima (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    CompraID INT FOREIGN KEY REFERENCES CompraMateriaPrima(CompraID),
    MateriaPrimaID INT FOREIGN KEY REFERENCES MateriaPrima(MateriaPrimaID),
    Cantidad DECIMAL(10,2),
    PrecioUnitario DECIMAL(10,2),
    Subtotal AS (Cantidad * PrecioUnitario) PERSISTED
);

-- Tabla: MovimientosCuenta
CREATE TABLE MovimientosCuenta (
    MovimientoID INT PRIMARY KEY IDENTITY(1,1),
    Tipo NVARCHAR(20) CHECK (Tipo IN ('Ingreso', 'Egreso')),
    Entidad NVARCHAR(20) CHECK (Entidad IN ('Cliente', 'Proveedor')),
    EntidadID INT,
    Fecha DATETIME DEFAULT GETDATE(),
    Concepto NVARCHAR(255),
    Importe DECIMAL(10,2),
    SaldoResultante DECIMAL(10,2)
);
