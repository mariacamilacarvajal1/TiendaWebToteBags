-- Parche actualización de base de datos tienda web totebags.
-- 1. Hay que añadir 2 nuevos campos obligatorios a una tabla
-- 2. Hay que eliminar un campo de otra tabla
-- 3. Un campo que es cadena de texto tiene que pasar a ser un número
-- 4. Hay que hacer obligatorio un campo que no lo era


-- 1. Campos obligatorios nuevos para la tabla 'clientes' añadiremos como atributo 'ciudad' 

ALTER TABLE clientes 
ADD COLUMN ciudad VARCHAR(50) NOT NULL DEFAULT 'Sin registro';

DESCRIBE clientes;

-- Campos obligatorios nuevos para la tabla 'clientes' añadiremos como atributo 'codigoPostal' 

ALTER TABLE clientes
ADD COLUMN codigoPostal VARCHAR(10) NOT NULL DEFAULT '000000';

-- 2. Eliminar un campo de otra tabla, se eliminara el campo descripción de la tabla 'disenos'

ALTER TABLE disenos
DROP COLUMN descripcion;

DESC disenos;

-- 3. De un campo que es cadena pasamos a ser un número.
--PENDIENTE


-- 4. Hacer un campo obligatorio. En la tabla disenos vamos a hacer obligatorio en campo nombreDiseno.

ALTER TABLE disenos 
MODIFY COLUMN nombreDiseno VARCHAR(20) NOT NULL;