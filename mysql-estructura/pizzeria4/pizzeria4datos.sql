-- Insertar provincias
INSERT INTO provincia (nombre) VALUES
    ('Provincia 1'),
    ('Provincia 2'),
    ('Provincia 3'),
    ('Provincia 4'),
    ('Provincia 5');

-- Insertar localidades
INSERT INTO localidad (nombre, id_provincia) VALUES
    ('Localidad 1A', 1),
    ('Localidad 1B', 1),
    ('Localidad 2A', 2),
    ('Localidad 2B', 2),
    ('Localidad 3A', 3),
    ('Localidad 3B', 3),
    ('Localidad 4A', 4),
    ('Localidad 4B', 4),
    ('Localidad 5A', 5),
    ('Localidad 5B', 5);
    
    INSERT INTO pizzeria (nombre, telefono, direccion, codigo_postal, id_localidad, id_provincia) VALUES
    ('Pizzería La Plaza', '912345678', 'Calle Mayor 10', '28001', 1, 1),
    ('Trattoria La Fontana', '912345679', 'Calle Alcalá 15', '28002', 2, 1),
    ('Pizzería Bella Napoli', '912345680', 'Avenida Gran Vía 20', '28003', 3, 2),
    ('La Trattoria del Sol', '912345681', 'Calle Velázquez 25', '28004', 4, 2),
    ('Pizzería La Fuente', '912345682', 'Paseo del Prado 30', '28005', 5, 3),
    ('Trattoria El Rincón', '912345683', 'Calle Serrano 35', '28006', 6, 3),
    ('Pizzería La Esquina', '912345684', 'Calle San Miguel 40', '28007', 7, 4),
    ('Trattoria La Terraza', '912345685', 'Avenida Castellana 45', '28008', 8, 4),
    ('Pizzería El Patio', '912345686', 'Calle San Sebastián 50', '28009', 9, 5),
    ('La Trattoria del Mar', '912345687', 'Paseo Marítimo 55', '28010', 10, 5);
    
    -- Insertar empleados
INSERT INTO empleado (id_pizzeria, nombre, apellidos, nif, telefono, puesto) VALUES
    (1, 'Giovanni', 'Rossi Martí', '12345678A', '611112233', 'repartidor'),
    (1, 'Anna', 'Garcia Sánchez', '87654321B', '655556677', 'cocinero'),
    (2, 'Marco', 'López García', '98765432C', '688889900', 'repartidor'),
    (2, 'Elena', 'Martínez Torres', '34567890D', '633334445', 'cocinero'),
    (3, 'Giorgio', 'Serra López', '23456789E', '611112233', 'repartidor'),
    (3, 'Clara', 'Fernández Martí', '45678901F', '655556677', 'cocinero'),
    (4, 'Luca', 'Martínez Gómez', '56789012G', '688889900', 'repartidor'),
    (4, 'Sofia', 'Gómez Rodríguez', '67890123H', '633334445', 'cocinero'),
    (5, 'Giulia', 'Tarrés Martí', '78901234I', '611112233', 'repartidor'),
    (5, 'Albert', 'Puig Martínez', '89012345J', '655556677', 'cocinero');
   
   INSERT INTO cliente (nombre, apellidos, direccion, codigo_postal, telefono, id_localidad, id_provincia) VALUES
    ('Felipe', 'Juan Froilán de Todos los Santos de Marichalar y Borbón', 'Calle Real de Madrid 123, Palacio de la Zarzuela', '28001', '987654321', 1, 1),
    ('Iker', 'Casillas Fernández', 'Avenida del Futbol 456', '28002', '987654322', 2, 2),
    ('Andrés', 'Iniesta Luján', 'Plaza del Camp Nou 789', '28003', '987654323', 3, 3),
    ('Sergio', 'Ramos García', 'Calle Santiago Bernabéu 100', '28004', '987654324', 4, 4),
    ('Xavi', 'Hernández Creus', 'Calle La Masía 200', '28005', '987654325', 5, 5);
    
    -- Insertart categorías
INSERT INTO categoria (nombre) VALUES
    ('Vegetariana'),
    ('Picante'),
    ('Fresca'),
    ('Classica'),
    ('Hamburguesa'),
    ('Bebida');
    
 -- Insertar productos
INSERT INTO producto (tipo, nombre, descripcion, imagen, precio, id_categoria) VALUES    
    ('hamburguesa', 'Hamburguesa con Queso', 'Una hamburguesa clásica pero irresistible, con una jugosa carne de res, queso cheddar fundido, lechuga fresca, rodajas de tomate y nuestra exclusiva salsa secreta, todo entre dos suaves panes de sésamo.', 'hamburguesa_queso.jpg', 10.49, 5),
    ('hamburguesa', 'Hamburguesa Doble', 'Una hamburguesa digna de los más hambrientos: dos jugosas y tiernas hamburguesas de carne de res, doble porción de queso cheddar, crujiente lechuga, rodajas de tomate y nuestra salsa especial, todo entre dos panes de brioche tostados.', 'hamburguesa_doble.jpg', 11.99, 5),
    ('hamburguesa', 'Hamburguesa Vegetariana', 'Una delicia vegana: hamburguesa de garbanzos y verduras sazonadas, acompañada de lechuga fresca, rodajas de tomate, pepinillos y nuestra exclusiva mayonesa vegana, todo servido en un pan de centeno recién horneado.', 'hamburguesa_vegetariana.jpg', 9.99, 5),
    ('hamburguesa', 'Hamburguesa BBQ', 'Una explosión de sabor: jugosa hamburguesa de carne de res con nuestra deliciosa salsa barbacoa casera, aros de cebolla crujientes, tocino ahumado, queso derretido y lechuga fresca, todo en un panecillo de brioche tostado.', 'hamburguesa_bbq.jpg', 12.49, 5),
    ('pizza', 'Pizza Vegetariana', 'Una combinación de sabores frescos y saludables: salsa de tomate, mozzarella fundida, champiñones, pimientos y cebolla, todo sobre nuestra crujiente masa.', 'vegetariana.jpg', 11.49, 1),
    ('pizza', 'Pizza Diavola', 'Una pizza con carácter: salsa de tomate, mozzarella y salamino picante, perfecta para los amantes del picante.', 'diavola.jpg', 12.99, 2),
    ('pizza', 'Pizza Rucola', 'Una explosión de sabor: salsa de barbacoa, mozzarella derretida, tierno pollo a la barbacoa y cebolla caramelizada, coronada con hojas de rúcula fresca.', 'barbacoa.jpg', 13.49, 3),
    ('pizza', 'Pizza Margherita', 'La clásica italiana: salsa de tomate, mozzarella fundida y hojas de albahaca fresca, todo ello sobre nuestra masa crujiente.', 'margarita.jpg', 10.49, 4),
    ('bebida', 'Refresco de Naranja', 'Refresco de naranja natural, perfecto para refrescarte en cualquier momento del día.', 'naranja.jpg', 1.49, 6),
    ('bebida', 'Refresco de Limón', 'Refresco de limón con un toque cítrico y refrescante, ideal para acompañar tu comida favorita.', 'limon.jpg', 1.49, 6),
    ('bebida', 'Agua Mineral', 'Agua mineral natural de manantial, pura y refrescante, sin gas añadido.', 'agua.jpg', 0.99, 6),
    ('bebida', 'Té Helado', 'Té helado refrescante y delicioso, disponible en una variedad de sabores, perfecto para calmar la sed en cualquier ocasión.', 'te.jpg', 2.29, 6);
   
 -- Insertar pedidos
INSERT INTO pedido (id_empleado, id_cliente, fecha_hora, entrega, total, fecha_entrega) VALUES
    -- Pedidos para tienda 1
    (1, 1, '2024-01-15 12:30:00', 'domicilio', 25.00, '2024-01-15 15:30:00'),
    (1, 3, '2024-03-25 13:00:00', 'tienda', 18.00, '2024-03-25 14:30:00'),
    (2, 2, '2024-02-20 18:45:00', 'tienda', 30.00, NULL),
    -- Pedidos para tienda 2
    (3, 3, '2024-01-25 14:30:00', 'domicilio', 20.00, NULL),
    (4, 4, '2024-02-05 19:55:00', 'tienda', 35.00, '2024-02-05 20:45:00'),
    -- Pedidos para tienda 3
    (5, 5, '2024-03-10 11:45:00', 'domicilio', 27.00, '2024-03-10 13:15:00'),
    (6, 1, '2024-03-15 14:00:00', 'tienda', 40.00, NULL),
    -- Pedidos para tienda 4
    (7, 2, '2024-01-20 20:15:00', 'domicilio', 23.00, NULL),
    (8, 3, '2024-03-05 16:30:00', 'tienda', 28.00, '2024-03-05 17:15:00'),
    -- Pedidos para tienda 5
    (9, 4, '2024-02-15 17:45:00', 'domicilio', 22.00, '2024-02-15 19:00:00'),
    (10, 5, '2024-03-20 21:15:00', 'tienda', 32.00, NULL);
    
    -- Insertar detalles de pedido
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad) VALUES
   (1, 1, 3),
    (1, 3, 2),
    (1, 10, 2),
    (1, 12, 3),
    (1, 9, 2),
    (2, 2, 2),
    (2, 3, 3),
    (3, 4, 4),
    (3, 5, 2),
    (4, 6, 3),
    (4, 2, 2),
    (5, 3, 2),
    (5, 6, 4),
    (6, 11, 3),
    (6, 12, 2),
    (7, 2, 2),
    (7, 6, 3),
    (8, 4, 3),
    (8, 1, 2),
    (9, 12, 4),
    (9, 6, 2),
    (10, 3, 2),
    (10, 12, 3);
   
