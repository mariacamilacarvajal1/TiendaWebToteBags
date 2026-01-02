CREATE TABLE IF NOT EXISTS clientes (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (50),
apellido VARCHAR(50),
direccion VARCHAR(100),
telefono VARCHAR(100),
email VARCHAR(100) UNIQUE,
password VARCHAR(100),
fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS disenos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombreDiseno VARCHAR(20),
dimension VARCHAR (100),
descripcion VARCHAR (500),
paletaColores VARCHAR (150),
tendencia BOOLEAN default 0,
disenador VARCHAR (100),
fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
id_diseno_padre INT UNSIGNED NULL,
FOREIGN KEY (id_diseno_padre) REFERENCES disenos (id)
);

CREATE TABLE IF NOT EXISTS productos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombreProducto VARCHAR (100),
descripcionProducto VARCHAR (100),
precio FLOAT DEFAULT 0,
stockTotal INT, 
referencia VARCHAR (50),
fechaIngreso DATETIME DEFAULT CURRENT_TIMESTAMP,
aplicaImpuesto BOOLEAN default 0

);

CREATE TABLE IF NOT EXISTS pedidos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
estado ENUM ('comprando', 'procesando', 'en preparacion', 'enviado', 'en reparto', 'entregado', 'cancelado'),
fechaPedido DATETIME DEFAULT CURRENT_TIMESTAMP,
intruccionesCliente VARCHAR(50),
subtotal FLOAT default 0,
precioTotal FLOAT default 0,
costoEnvio FLOAT default 0,
numeroSeguimiento VARCHAR (50),
id_cliente INT UNSIGNED,
id_metodopago INT UNSIGNED,
FOREIGN KEY (id_cliente) REFERENCES clientes (id),
FOREIGN KEY (id_metodopago) REFERENCES metodospago (id)
);

CREATE TABLE IF NOT EXISTS metodospago (
 id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
numeroPago VARCHAR (50),
tipo VARCHAR(50),
costoAdicional FLOAT default 0,
metodoDisponible BOOLEAN default 1,
restriccionPais VARCHAR(20),
intrucciones VARCHAR(100),
montoMinimo FLOAT default 0,
id_cliente INT UNSIGNED,
FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);

CREATE TABLE IF NOT EXISTS visitas (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fechaVisita DATETIME DEFAULT CURRENT_TIMESTAMP,
id_cliente INT UNSIGNED,
id_diseno INT UNSIGNED,
FOREIGN KEY (id_cliente) REFERENCES clientes (id),
FOREIGN KEY (id_diseno) REFERENCES disenos (id)
);

CREATE TABLE IF NOT EXISTS pedido_producto (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
precioUnidad FLOAT default 0,
cantidad INT default 1,
id_pedido INT UNSIGNED,
id_producto INT UNSIGNED,
FOREIGN KEY (id_pedido) REFERENCES pedidos (id),
FOREIGN KEY (id_producto) REFERENCES productos (id)

);

CREATE TABLE IF NOT EXISTS producto_diseno (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
id_producto INT UNSIGNED,
id_diseno INT UNSIGNED,
FOREIGN KEY (id_diseno) REFERENCES disenos (id),
FOREIGN KEY (id_producto) REFERENCES productos (id)

);

