-- ////////////////////////////////compra mas cara////////////////////////////////////////////////
SELECT cliente.nombre, factura.numero_factura, valor_factura.precio_total AS total_pagado
FROM cliente FULL JOIN factura ON cliente.id = factura.cliente_id FULL 
JOIN valor_factura ON factura.numero_factura = valor_factura.numero_factura 
WHERE valor_factura.precio_total = (SELECT max(valor_factura.precio_total) FROM valor_factura);


-- //////////////////////////COMPRAS MAYORES A 100//////////////////////////////////////////////////////
SELECT cliente.nombre, factura.numero_factura, valor_factura.precio_total 
FROM cliente FULL JOIN factura ON cliente.id = factura.cliente_id FULL 
JOIN valor_factura ON factura.numero_factura = valor_factura.numero_factura 
WHERE valor_factura.precio_total > 100;


-- ////////////////Cuantos clientes han comprado el producto 6///////////////////

--este muestra los datos de quienes han comprado el producto 6
SELECT cliente.nombre, factura.numero_factura, listado_productos.producto_id 
FROM cliente FULL JOIN factura ON cliente.id = factura.cliente_id
FULL JOIN listado_productos ON factura.numero_factura = listado_productos.numero_factura
WHERE listado_productos.producto_id = 6;


-- este muestra la cantidad de clientes que a comprado el producto 6
SELECT COUNT(cliente.nombre) AS cantidad_clientes_que_an_comprado_producto
FROM cliente FULL JOIN factura ON cliente.id = factura.cliente_id
FULL JOIN listado_productos ON factura.numero_factura = listado_productos.numero_factura
WHERE listado_productos.producto_id = 6;