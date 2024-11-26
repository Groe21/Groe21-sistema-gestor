-- Insertar un estudiante en la tabla estudiante
INSERT INTO escuela.estudiante (id_persona, fecha_nacimiento, lugar_nacimiento, residencia, sector, id_paralelo)
VALUES (
    (SELECT id_persona FROM escuela.personas WHERE cedula = '1234567890' LIMIT 1), -- Cedula del estudiante
    '2005-01-01', -- Fecha de nacimiento
    'Ciudad X', -- Lugar de nacimiento
    'Residencia Y', -- Residencia
    'Sector Z', -- Sector
    1 -- ID del paralelo
);

-- Insertar un padre en la tabla padre
INSERT INTO escuela.padre (id_persona, ocupacion)
VALUES (
    (SELECT id_persona FROM escuela.personas WHERE cedula = '3234567890' LIMIT 1), -- Cedula del padre
    'Ingeniero' -- Ocupación del padre
);

-- Insertar un representante en la tabla representante (duplicado del padre)
INSERT INTO escuela.representante (id_estudiante, cedula, apellidos, nombres, direccion, telefono, correo, tipo_representante, ocupacion)
VALUES (
    (SELECT id_estudiante FROM escuela.estudiante WHERE id_persona = (SELECT id_persona FROM escuela.personas WHERE cedula = '1234567890' LIMIT 1) LIMIT 1), -- ID del estudiante
    '3234567890', -- Cedula del representante (padre)
    'Perez', -- Apellidos del representante (padre)
    'Juan', -- Nombres del representante (padre)
    'Calle 1', -- Dirección del representante (padre)
    '0987654331', -- Teléfono del representante (padre)
    'juan.perez@example.com', -- Correo del representante (padre)
    'padre', -- Tipo de representante
    'Ingeniero' -- Ocupación del representante (padre)
);

-- Insertar en la tabla matricula
INSERT INTO escuela.matricula (id_estudiante, id_padre, id_madre, id_representante, id_periodo)
VALUES (
    (SELECT id_estudiante FROM escuela.estudiante WHERE id_persona = (SELECT id_persona FROM escuela.personas WHERE cedula = '1234567890' LIMIT 1) LIMIT 1), -- ID del estudiante
    (SELECT id_padre FROM escuela.padre WHERE id_persona = (SELECT id_persona FROM escuela.personas WHERE cedula = '3234567890' LIMIT 1) LIMIT 1), -- ID del padre
    NULL, -- ID de la madre (puedes cambiarlo si es necesario)
    (SELECT id_representante FROM escuela.representante WHERE id_estudiante = (SELECT id_estudiante FROM escuela.estudiante WHERE id_persona = (SELECT id_persona FROM escuela.personas WHERE cedula = '1234567890' LIMIT 1) LIMIT 1) LIMIT 1), -- ID del representante (duplicado del padre)
    1 -- ID del periodo
);