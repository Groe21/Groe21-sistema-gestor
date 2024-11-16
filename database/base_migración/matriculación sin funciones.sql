-- Insertar datos del estudiante
INSERT INTO escuela.estudiantes (
    id_persona, paralelo, codigo_unico, condicion, tipo_discapacidad, 
    porcentaje_discapacidad, carnet_discapacidad, imagen, id_periodo
) VALUES (
    24, 'segundo 4', '34523635645425', 0, NULL, NULL, NULL, 'unnamed.jpg', 1
);

-- Insertar datos de la madre
INSERT INTO escuela.madres (
    id_persona, ocupacion, telefono, correo
) VALUES (
    8, 'qwetqer', '12345556', 'qwetqwet@gmal.com'
);

-- Insertar datos del padre
INSERT INTO escuela.padres (
    id_persona, ocupacion, telefono, correo
) VALUES (
    19, 'w4tq34t3', '08373943', 'qwetqwetaerw@gmal.com'
);