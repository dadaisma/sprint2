-- Insertar datos de direcciones
INSERT INTO direccion (carrer, numero, piso, puerta, codigo_postal, localitad, provincia, pais) VALUES
    ('Carrer de Provença', '123', '1', '2', '08036', 'Barcelona', 'Barcelona', 'España'),
    ('Avinguda de la Diagonal', '456', '2', 'A', '08028', 'Barcelona', 'Barcelona', 'España'),
    ('Calle Gran Vía', '789', '3', 'B', '28013', 'Madrid', 'Madrid', 'España'),
    ('Carrer de la Mar', '10', NULL, NULL, '07001', 'Palma', 'Islas Baleares', 'España'),
    ('Plaça de Catalunya', '1', NULL, NULL, '08002', 'Barcelona', 'Barcelona', 'España'),
    ('Calle Mayor', '15', NULL, NULL, '41001', 'Sevilla', 'Sevilla', 'España'),
    ('Carrer Major', '20', '4', 'C', '08001', 'Barcelona', 'Barcelona', 'España'),
    ('Paseo del Prado', '50', NULL, NULL, '28014', 'Madrid', 'Madrid', 'España'),
    ('Rambla de Catalunya', '100', NULL, NULL, '08008', 'Barcelona', 'Barcelona', 'España'),
     ('Rambla de Pakistan', '300', NULL, NULL, '09908', 'Valladolid', 'Barcelona', 'España');

-- Insertar datos  de proveedores
INSERT INTO provedor (nombre, telefono, nif, fax, id_direccion) VALUES
    ('Opticalia', '123456789', 'ES12345678', '987654321', 1),
	('PakyOptica', '098856789', 'PK12345678', '009554321', 10);
-- Insertar datos  de marcas
INSERT INTO marca (nombre, id_provedor) VALUES
    ('Ray-Ban', 1),
    ('Oakley', 1),
    ('Prada', 1),
    ('Tom Ford', 1),
     ('TarokPaky', 2),
    ('Versace', 1);
    
    
    -- Insertar datos  de gafas
INSERT INTO gafas (graduacion, montura, color_montura, color_cristal, precio, id_marca) VALUES
    ('-2.50 / -1.75', 'pasta', 'Negro', 'Transparente', 150.00, 1),
     ('-2.50 / -1.75', 'pasta', 'Verde', 'Transparente', 199.00, 6),
    ('+1.00 / -0.75', 'metàl·lica', 'Dorado', 'Marrón', 200.00, 2),
    ('Sin graduar', 'flotant', 'Plateado', 'Negro', 100.00, 3),
    ('-3.00 / -2.25', 'pasta', 'Azul', 'Transparente', 180.00, 4),
    ('+2.50 / +1.75', 'metàl·lica', 'Plateado', 'Azul', 220.00, 5);
   
   -- Insertar datos  de clientes
   INSERT INTO cliente (nombre, telefono, email, fecha_registro, id_direccion, id_cliente_recomendado) VALUES
    ('Juan Pérez', '666111222', 'juan@example.com', '2023-04-15 10:23:45', 2, NULL),
    ('María García', '699222333', 'maria@example.com', '2023-05-20 14:30:00', 3, 1),
    ('Luis Martínez', '688333444', 'luis@example.com', '2023-07-10 08:45:30', 4, 2),
    ('Ana López', '677444555', 'ana@example.com', '2023-08-25 17:55:15', 5, NULL);

    
    
    -- Insertar datos de empleados
INSERT INTO empleado (nombre, telefono, nif, id_direccion) VALUES
    ('Carlos Sánchez', '612345678', 'ES98765432', 6),
    ('Laura Fernández', '633456789', 'ES87654321', 7),
    ('Pedro Gómez', '644567890', 'ES76543210', 8),
    ('Sara Martín', '655678901', 'ES65432109', 9);
    
-- Insertar datos ficticios de ventas con fechas y horas aleatorias
INSERT INTO venta (importe, fecha_registro, id_cliente, id_empleado, id_gafas) VALUES
    (150.00, '2023-04-15 11:30:00', 1, 1, 1),
    (330.00, '2023-04-05 09:00:00', 1, 4, 1),
    (200.00, '2023-05-20 16:45:00', 2, 2, 2),
    (199.00, '2023-07-10 09:15:00', 3, 3, 3),
    (100.00, '2023-07-10 19:55:00', 2, 3, 6),
    (180.00, '2023-08-25 18:00:00', 4, 4, 4),
    (330.00, '2023-09-05 10:00:00', 2, 4, 4);