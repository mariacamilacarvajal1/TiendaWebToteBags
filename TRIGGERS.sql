--- TRIGGERS 

-- Con este trigger vamos a conocer el stock total que queda despues de que se actualice la tabla de pedido_productos,
-- Así tendremos en tiempo real la cantidad de productos disponibles despues de cada venta.

CREATE TRIGGER actualiza_stock_ventas
AFTER INSERT ON pedido_producto
FOR EACH ROW 
BEGIN 
	UPDATE productos
	SET stockTotal = stockTotal - NEW.cantidad
	WHERE id = NEW.id_producto;
END;

SELECT nombreProducto, stockTotal FROM productos WHERE id = 4;

-- Con este trigger se calculara la fecha estimada de entrega teniendo en cuenta la fecha en la que se realizó el pedido.
-- Antes de crear el trigger creamos una tabla donde iran los datos de fechaEntregasEstimada. Luego ejecutamos el trigger.

ALTER TABLE pedidos ADD column fechaEntregaEstimada DATE;

CREATE TRIGGER entrega_estimada
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
	SET NEW.fechaEntregaEstimada = DATE_ADD(NEW.fechaPedido, INTERVAL 5 DAY);

END;

SELECT fechaPedido, fechaEntregaEstimada
FROM pedidos 
WHERE numeroSeguimiento = 'ENVI-779';

SHOW TRIGGERS;
