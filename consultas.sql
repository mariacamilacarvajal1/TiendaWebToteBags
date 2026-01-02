-- 18 CONSULTAS
-- De la 1 a la 6 consultas con dos tablas usando funciones agregadas.
-- De la 7 a la 9 consultas con dos tablas.
-- De la 10 a la 11 consultas con 3 tablas.
-- De la 12 a la 13 consultas con 4 tablas.
-- De la 14 a la 18 consultas con subconsultas.


-- Consulta 1. Suma de los pedidos en estado 'procesando' con el precioTotal. (SUM)
SELECT SUM(precioTotal) 
FROM pedidos 
WHERE estado = 'procesando';

-- Consulta 2. Cantidad de pedidos que ha realizado un cliente. (COUNT)
SELECT clientes.nombre,
COUNT(pedidos.id)
FROM clientes
JOIN pedidos ON clientes.id = pedidos.id_cliente 
WHERE clientes.id = 8
GROUP BY clientes.id;

-- Consulta 3. Total de productos dentro de un pedido. (id >8) (SUM)
SELECT id_pedido,
SUM(precioUnidad * cantidad)
FROM pedido_producto 
WHERE id_pedido = 10;

-- Consulta 4. Saber cuanto dinero ha generado cada producto (totebag) sumando todas las ventas de este producto.(SUM)
SELECT productos.nombreProducto, 
SUM(pedido_producto.precioUnidad * pedido_producto.cantidad)
FROM productos
JOIN pedido_producto ON productos.id = pedido_producto.id_producto
GROUP BY productos.id;

-- Consulta 5. El saldo total de compras realizadas por cada cliente en la tienda. (SUM)
SELECT clientes.nombre, 
SUM(pedidos.precioTotal)
FROM clientes 
JOIN pedidos ON clientes.id = pedidos.id_cliente
GROUP BY clientes.id;

-- Consulta 6. Método de pago mas utilizado por los clientes, ordenados de mayor a menor.(COUNT)
SELECT metodospago.tipo, 
COUNT(pedidos.id)
FROM metodospago
JOIN pedidos ON metodospago.id = pedidos.id_metodopago
GROUP BY metodospago.tipo;

----------------------------------------------------------------------------------------------------------------------------

-- Consulta 7. Cuáles pedidos fueron pagados con bizum', 'efectivo', 'tarjeta', 'tarjeta débito', 'monedero virtual' 'klarna'.
SELECT pedidos.id, pedidos.precioTotal, metodospago.tipo
FROM pedidos
JOIN metodospago ON pedidos.id_metodopago = metodospago.id;

-- Para escoger un solo tipo de metodo de pago.
SELECT pedidos.id, pedidos.precioTotal, metodospago.tipo
FROM pedidos
JOIN metodospago ON pedidos.id_metodopago = metodospago.id
WHERE metodospago.tipo = 'bizum';

-- Consulta 8. Filtra las totebags (productos) asociadas a un diseño. En este caso al producto 5 esta asociado a 2 diseños.
SELECT productos.nombreProducto, productos.referencia, producto_diseno.id_diseno
FROM productos 
JOIN producto_diseno ON productos.id = producto_diseno.id_producto 
WHERE productos.id = 5;

-- Consulta 9. Clientes con datos de nombre, apellido, email y telefono  que tienen sus pedidos en estado 'enviado'.
SELECT clientes.nombre, clientes.apellido, clientes.email, clientes.telefono, pedidos.estado
FROM clientes 
JOIN pedidos ON clientes.id = pedidos.id_cliente
WHERE pedidos.estado = 'enviado'; 


-- Consultas empleando 3 tablas.

-- Consulta 10. Se conoce el nombre del cliente, el costo del pago y con cual método realizo el pago.
SELECT clientes.nombre, clientes.apellido,
pedidos.id,
pedidos.precioTotal,
metodospago.tipo
FROM clientes
JOIN pedidos ON clientes.id = pedidos.id_cliente
JOIN metodospago ON pedidos.id_metodopago = metodospago.id;

-- Consulta 11. Se identifica el diseño asociado a cada totebag con su referencia.
SELECT productos.nombreProducto,
productos.referencia,
disenos.nombreDiseno
FROM productos 
JOIN producto_diseno ON productos.id = producto_diseno.id_producto
JOIN disenos ON producto_diseno.id_diseno = disenos.id;

-- Consultas empleando 4 tablas.

-- Consulta 12. Enseña una lista de cada nombre de cliente y la cantidad y nombre de productos comprados, asociados a los numeros de segumiento de los pedidos.
SELECT 
clientes.nombre, 
pedidos.numeroSeguimiento,
productos.nombreProducto,
pedido_producto.cantidad
FROM clientes 
JOIN pedidos ON clientes.id = pedidos.id_cliente 
JOIN pedido_producto ON pedidos.id = pedido_producto.id_pedido 
JOIN productos ON pedido_producto.id_producto = productos.id;

-- Consulta 13. Se consulta en pedido, con el nombre y apellido del cliente, el método de pago utilizado y el diseño asociado al producto que se compro.
SELECT 
(SELECT nombre FROM clientes WHERE clientes.id = pedidos.id_cliente),
(SELECT apellido FROM clientes WHERE clientes.id = pedidos.id_cliente),
pedidos.numeroSeguimiento,
(SELECT tipo FROM metodospago WHERE metodospago.id = pedidos.id_metodopago),
productos.nombreProducto,
disenos.nombreDiseno
FROM pedidos
JOIN pedido_producto ON pedidos.id = pedido_producto.id_pedido 
JOIN productos ON pedido_producto.id_producto = productos.id 
JOIN producto_diseno ON productos.id = producto_diseno.id_producto
JOIN disenos ON producto_diseno.id_diseno = disenos.id;

-- Subconsultas 

-- Consulta 14. Enseña los productos mas costosos en comparación con el promedio que los clientes pagan.
SELECT nombreProducto, precio
FROM productos 
WHERE precio > (SELECT AVG(precioUnidad) FROM pedido_producto);

-- Consulta 15. Muestra los productos de la tabla productos que no aparecen en la tabla pedido_producto. (Rta id.9)
SELECT nombreProducto
FROM productos 
WHERE id NOT IN (
SELECT id_producto
FROM pedido_producto
);

-- Consulta 16. Encuentra clientes que nunca han realizado un pedido en la tienda.
SELECT nombre, apellido, email, telefono
FROM clientes
WHERE NOT EXISTS (
SELECT * FROM pedidos WHERE pedidos.id_cliente = clientes.id
);

-- Consulta 17. Muestra productos que se han vendido mas de 3 en un solo pedido.
SELECT nombreProducto, precio
FROM productos 
WHERE id IN ( 
SELECT id_producto
FROM pedido_producto 
WHERE cantidad > 3
);

-- Consulta 18. Productos que usan los diseños del diseñador carlos perez.
SELECT nombreProducto, precio, referencia  
FROM productos 
WHERE id IN (
SELECT id_producto 
FROM producto_diseno 
WHERE id_diseno IN (
SELECT id 
FROM disenos 
WHERE disenador = 'carlos perez')
);

---------------------------------------------------------------------------
-- Funciones de MARIADB

-- Consulta 19.Unir el apellido y el nombre de los clientes en un solo campo.

SELECT CONCAT(nombre, CONCAT(' ',apellido)) AS nombreCompleto
FROM clientes
