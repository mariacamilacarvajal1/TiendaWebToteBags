-- 5 Consultas con mas de 4 tablas.
-- Consulta 1. Muestra los clientes que visitaron diseños y que luego los compraron.

SELECT all clientes.nombre,
clientes.apellido,
clientes.email,
disenos.nombreDiseno,
visitas.fechaVisita,
productos.nombreProducto,
productos. precio
FROM clientes 
JOIN visitas ON clientes.id = visitas.id_cliente 
JOIN disenos ON visitas.id_diseno = disenos.id 
JOIN producto_diseno ON disenos.id = producto_diseno.id_diseno
JOIN productos ON producto_diseno.id_producto = productos.id;

-- Consulta 2.Muestra a cada diseñador con sus respectivas ventas de diseño, teniendo al de ventas mas bajas a Joaquin Navarro y el de ventas mas altas Daniel Huerta.

SELECT disenos.disenador, SUM(pedido_producto.cantidad)
FROM disenos
JOIN producto_diseno ON disenos.id = producto_diseno.id_diseno 
JOIN productos ON producto_diseno.id_producto = productos.id 
JOIN pedido_producto ON productos.id = pedido_producto.id_producto 
GROUP BY disenos.disenador;

-- Consulta 3. Paleta de colores preferida entre los clientes de menor a mayor.

SELECT clientes.nombre, clientes.apellido, 
pedidos.fechaPedido,
disenos.nombreDiseno, disenos.paletaColores
FROM clientes
JOIN pedidos ON clientes.id = pedidos.id_cliente
JOIN pedido_producto ON pedidos.id = pedido_producto.id_pedido 
JOIN disenos ON pedido_producto.id_producto = disenos.id
GROUP BY disenos.paletaColores
ORDER BY SUM(pedido_producto.cantidad);

-- Consulta 4. Muestra cuál es el método de pago preferido entre los clientes que compran ciertos cantidad de productos/diseños.

SELECT metodospago.tipo,
disenos.nombreDiseno,
disenos.paletaColores,
SUM(pedido_producto.cantidad)
FROM metodospago 
JOIN pedidos ON metodospago.id = pedidos.id_metodopago 
JOIN pedido_producto ON pedidos.id = pedido_producto.id_pedido 
JOIN disenos ON pedido_producto.id_producto = disenos.id 
GROUP BY metodospago.tipo, disenos.nombreDiseno;

-- Consulta 5. Muestra que clientes compraron productos con diseños en 'no tendencia' = 0 y con que metodo de pago realizaron el pago.

SELECT clientes.nombre,
metodospago.tipo,
disenos.nombreDiseno,
pedidos.fechaPedido
FROM clientes
JOIN pedidos ON clientes.id = pedidos.id_cliente 
JOIN metodospago ON pedidos.id_metodopago = metodospago.id
JOIN pedido_producto ON pedidos.id = pedido_producto.id_pedido 
JOIN disenos ON pedido_producto.id_producto = disenos.id 
WHERE disenos.tendencia = 0;
