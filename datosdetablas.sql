show tables;

DESC clientes;
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, password)
VALUES ('daniela', 'ascuntar', 'paseo del prado 8. 2', '623589636', 'daniascu@gmail.com', ''),
 ('camila', 'bedoya', 'calle constitucion 5. 17', '612141536', 'camicamib@gmail.com', ''),
 ('matha', 'carvajal', 'calle castilla 22. 5', '645858596', 'marthis1@gmail.com', ''),
 ('alicia', 'jorquera', 'calle san sebastian 1 bis 6', '603355963', 'alicia201@gmail.com', ''),
 ('julia', 'mendez', 'calle pedro 1.6', '632565456', 'julili@gmail.com', ''),
 ('mariano', 'ruiz', 'paseo de candelaria 8' , '636528596', 'marianitosd@gmail.com', ''),
 
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, password)
VALUES ('isacc', 'martinez', 'calle 2-12 ' , '63561219', 'isacci@gmail.com', '')
;

SELECT * FROM disenos;
DESC disenos;
INSERT INTO disenos (nombreDiseno, dimension, descripcion, paletaColores, tendencia, disenador,id_diseno_padre)
VALUES ('flor', '15x25', 'flor roja en un bosque', 'roja', '1', 'carlos domingo', NULL);
('ballena azul', '15x35', 'ballena grande azul', 'azul y blanco', '1', 'carlos Perez', NULL),
('campo de girasoles', '25x25', 'girasoles en un campo verde', 'amarillo y verde', '1', 'daniel huerta', NULL),
('ramo de flores', '20x25', 'flores de diferentes colores', 'amarillo, verde, azul, rojo, violeta', '1', 'daniel huerta', 1),
('libro de flores', '25x35', 'libro con lineas de flores', 'blanco y negro', '0', 'alba carvajal', NULL),
('corazones', '25x25', 'corazones de diferentes tamaños', 'rojo', '1', 'ramon valdez', NULL),
('el mar', '25x25', 'el mar y varias especies', 'azul y blanco', '1', 'carlos perez', 2);

DESC metodospago;
INSERT INTO metodospago (numeroPago, tipo, costoAdicional, metodoDisponible, restriccionPais, intrucciones, montoMinimo)
VALUES ('TOT-1563', 'bizum', 0, 1, 'solo España', 'enviar dinero al número +34 600600600', 4.00);

('TOT-1545', 'efectivo', 0, 1, 'global', 'Dirigirse al punto de venta mas cercano para realizar el pago de tu pedido', 0),
('TOT-1214', 'tarjeta de crédito', 1.50, 1, 'global', 'aceptamos VISA,MASTERCARD y AMEX', 10.00),
('TOT-1010', 'klarna', 0, 1, 'Europa', 'sujero a aprobación por parte de la entidad klarna', 30.00),
('TOT-2221', 'tarjeta débito', 1.50, 1, 'global', 'sujeto a disposición de saldo en cuenta bancaria', 15.00),
('TOT-3212', 'bizum', 0, 1, 'solo España', 'enviar dinero al número +34 600600600', 0),
('TOT-1111', 'monedero virtual', 0, 0, 'global', 'usa el saldo acumulado en tu cuenta', 0.01);

SELECT * FROM pedidos;
DESC pedidos;

INSERT INTO pedidos (estado, instruccionesCliente, subtotal, precioTotal, costoEnvio, numeroSeguimiento, id_cliente, id_metodopago)
VALUES ('enviado', 'prefiero que no se incluya la factura', 60.00, 66.00, 6.00, 'ENVI-339', 2, 2);
('procesando', 'entregar en porteria apto 501', 45.50, 51.50, 6.00, 'ENV-215', 1, 3),
('comprando', 'llamar antes de llegar', 20.00, 26.00, 6.00, 'ENVI-515', 2, 2),
('en preparacion', 'Entregar solo de lunes a viernes', 100.00, 105.00, 5.00, 'ENVI-999', 3, 1),
('enviado', 'antes de entregar llamar al número 62235636', 80.00, 85.00, 5.00, 'ENV-569', 4, 4),
('enviado', 'dejar en recepción', 150.00, 160.00, 10.00, 'ENV-888', 5, 6),
('en reparto', 'antes de entregar llamar al número 603526369', 130.00, 140.00, 10.00, 'ENV-569', 6, 5),
('procesando', 'es un regalo, no incluir factura', 70.00, 75.00, 5.00, 'ENV-779', 7, 7);


DESC productos;
SELECT * FROM productos;
INSERT INTO productos (nombreProducto, descripcionProducto, precio, stockTotal, referencia, aplicaImpuesto)
VALUES ('Totebag Eco', 'algodón orgánico 180g, color crudo natural', 22.50, 80, 'tote-eco-01', 1),
('Totebag premium zipper blanca', 'tela reforzada con cierre de cremallera y bolsillo interno', 20.00, 45, 'tote-zip-02', 1),
('Totebag premium zipper negra', 'tela reforzada con cierre de cremallera y bolsillo interno', 20.00, 98, 'tote-zip-03', 1),
('Totebag premium zipper blanca small', 'tela reforzada con cierre de cremallera y bolsillo interno', 15.00, 105, 'tote-zip-04', 1),
('Mini totebag infantil', 'tamaño reducido ideal para niños', 15.99, 120, 'tote-mini-03', 0),
('Totebag Eco y mar', 'algodón orgánico 180g, color crudo natural con mangas rusticas', 25.50, 110, 'tote-ecomar-01', 1),
('Totebag negra en drill', 'algodón orgánico 180g, color negro', 21.50, 80, 'tote-neg-01', 1),
('Totebag playa big', 'algodón orgánico 180g, color crudo natural, de tamaño big', 30.50, 100, 'tote-playa-01', 1),
('Tote playa mini', 'algodón orgánico 180g, color crudo natural, de tamaño small', 22.50, 215, 'tote-playmin-01', 1);


DESC producto_diseno;
select  * FROM producto_diseno;
INSERT INTO producto_diseno (id_producto, id_diseno)
VALUES (1,7),
(2,6),
(3,5),
(4,4),
(5,3),
(6,2),
(7,1);

DESC pedido_producto;
SELECT * FROM pedidos ;

INSERT INTO pedido_producto (precioUnidad, cantidad, id_pedido, id_producto)
VALUES (20.00, 3, 36, 3);
(15.00, 3, 35, 4)
(22.50, 2, 1, 1)
(20.00, 5 , 3, 3)
(15.00, 10 , 5, 4)
(15.99, 8, 8, 5) 
(21.50, , ,7)
(30.50, , ,8) 
