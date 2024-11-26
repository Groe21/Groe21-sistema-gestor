-- Insertar datos en la tabla padre_familia
INSERT INTO escuela.padre_familia (apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto)
VALUES ('Perez', 'Juan', '0701234567', 'Calle Falsa 123', 'Ingeniero', '0987654321', 'juan.perez@example.com', NULL);

-- Insertar datos en la tabla madre_familia
INSERT INTO escuela.madre_familia (apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto)
VALUES ('Lopez', 'Maria', '0707654321', 'Avenida Siempre Viva 456', 'Doctora', '0987654322', 'maria.lopez@example.com', NULL);

-- Insertar datos en la tabla representante
INSERT INTO escuela.representante (apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto, tipo)
VALUES ('Garcia', 'Carlos', '0708765432', 'Calle 8', 'Abogado', '0987654323', 'carlos.garcia@example.com', NULL, 'tio/a');

-- Insertar datos en la tabla estudiantes
INSERT INTO escuela.estudiantes (cedula, apellidos, nombres, fecha_nacimiento, lugar_nacimiento, residencia, direccion, sector, foto, id_paralelo, id_periodo, id_padre, id_madre, id_representante)
VALUES ('0705708758', 'Guerrero', 'Oscar Emilio', '2005-05-10', 'Quito', 'Quito', 'Calle 10', 'Centro', NULL, 22, 13, 
    (SELECT id_padre FROM escuela.padre_familia WHERE cedula = '0701234567'), 
    (SELECT id_madre FROM escuela.madre_familia WHERE cedula = '0707654321'), 
    (SELECT id_representante FROM escuela.representante WHERE cedula = '0708765432'));

-- Insertar datos en la tabla matriculas
INSERT INTO escuela.matriculas (id_estudiante, id_periodo, id_paralelo)
VALUES ((SELECT id_estudiante FROM escuela.estudiantes WHERE cedula = '0705708758'), 13, 22);