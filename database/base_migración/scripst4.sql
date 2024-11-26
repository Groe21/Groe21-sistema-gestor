DELETE FROM escuela.personas
WHERE rol IN ('estudiante', 'padre', 'madre');
-- Insertar 5 estudiantes
INSERT INTO escuela.personas (cedula, apellidos, nombres, direccion, telefono, correo, foto, rol, id_periodo)
VALUES 
('1234567890', 'Perez', 'Juan', 'Calle 1', '0987654321', 'juan.perez@example.com', NULL, 'estudiante', 1),
('1234567891', 'Gomez', 'Maria', 'Calle 2', '0987654322', 'maria.gomez@example.com', NULL, 'estudiante', 1),
('1234567892', 'Lopez', 'Carlos', 'Calle 3', '0987654323', 'carlos.lopez@example.com', NULL, 'estudiante', 1),
('1234567893', 'Martinez', 'Ana', 'Calle 4', '0987654324', 'ana.martinez@example.com', NULL, 'estudiante', 1),
('1234567894', 'Rodriguez', 'Luis', 'Calle 5', '0987654325', 'luis.rodriguez@example.com', NULL, 'estudiante', 1);

-- Insertar 5 madres
INSERT INTO escuela.personas (cedula, apellidos, nombres, direccion, telefono, correo, foto, rol, id_periodo)
VALUES 
('2234567890', 'Perez', 'Juana', 'Calle 1', '0987654326', 'juana.perez@example.com', NULL, 'madre', 1),
('2234567891', 'Gomez', 'Maria', 'Calle 2', '0987654327', 'maria.gomez@example.com', NULL, 'madre', 1),
('2234567892', 'Lopez', 'Carla', 'Calle 3', '0987654328', 'carla.lopez@example.com', NULL, 'madre', 1),
('2234567893', 'Martinez', 'Ana', 'Calle 4', '0987654329', 'ana.martinez@example.com', NULL, 'madre', 1),
('2234567894', 'Rodriguez', 'Luisa', 'Calle 5', '0987654330', 'luisa.rodriguez@example.com', NULL, 'madre', 1);

-- Insertar 5 padres
INSERT INTO escuela.personas (cedula, apellidos, nombres, direccion, telefono, correo, foto, rol, id_periodo)
VALUES 
('3234567890', 'Perez', 'Juan', 'Calle 1', '0987654331', 'juan.perez@example.com', NULL, 'padre', 1),
('3234567891', 'Gomez', 'Mario', 'Calle 2', '0987654332', 'mario.gomez@example.com', NULL, 'padre', 1),
('3234567892', 'Lopez', 'Carlos', 'Calle 3', '0987654333', 'carlos.lopez@example.com', NULL, 'padre', 1),
('3234567893', 'Martinez', 'Andres', 'Calle 4', '0987654334', 'andres.martinez@example.com', NULL, 'padre', 1),
('3234567894', 'Rodriguez', 'Luis', 'Calle 5', '0987654335', 'luis.rodriguez@example.com', NULL, 'padre', 1);


-- Crear tabla representante
CREATE TABLE escuela.representante (
    id_representante SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    cedula VARCHAR(10) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    tipo_representante VARCHAR(20) NOT NULL,
    ocupacion VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES escuela.estudiante(id_estudiante)
);

	
	
CREATE TABLE escuela.matricula (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_padre INT,
    id_madre INT,
    id_representante INT,
    id_periodo INT NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES escuela.estudiante(id_estudiante),
    FOREIGN KEY (id_padre) REFERENCES escuela.padre(id_padre),
    FOREIGN KEY (id_madre) REFERENCES escuela.madre(id_madre),
    FOREIGN KEY (id_representante) REFERENCES escuela.representante(id_representante)
);


SELECT 
    e.id_estudiante,
    pe.cedula AS cedula_estudiante,
    pe.apellidos AS apellidos_estudiante,
    pe.nombres AS nombres_estudiante,
    pe.direccion AS direccion_estudiante,
    pe.telefono AS telefono_estudiante,
    pe.correo AS correo_estudiante,
    e.fecha_nacimiento,
    e.lugar_nacimiento,
    e.residencia,
    e.sector,
    e.id_paralelo,
    pp.cedula AS cedula_padre,
    pp.apellidos AS apellidos_padre,
    pp.nombres AS nombres_padre,
    pp.direccion AS direccion_padre,
    pp.telefono AS telefono_padre,
    pp.correo AS correo_padre,
    pa.ocupacion AS ocupacion_padre
FROM 
    escuela.estudiante e
JOIN 
    escuela.personas pe ON e.id_persona = pe.id_persona
LEFT JOIN 
    escuela.matricula m ON e.id_estudiante = m.id_estudiante
LEFT JOIN 
    escuela.padre pa ON m.id_padre = pa.id_padre
LEFT JOIN 
    escuela.personas pp ON pa.id_persona = pp.id_persona
ORDER BY 
    pe.apellidos, pe.nombres;
	


-- Consultar los estudiantes matriculados en el período con id 1
SELECT p.cedula, p.apellidos, p.nombres, p.direccion, p.telefono, p.correo, e.fecha_nacimiento, e.lugar_nacimiento, e.residencia, e.sector, e.id_paralelo
FROM escuela.matricula m
JOIN escuela.estudiante e ON m.id_estudiante = e.id_estudiante
JOIN escuela.personas p ON e.id_persona = p.id_persona
WHERE m.id_periodo = 1;

-- Consultar los nombres del estudiante, nombres y apellidos del representante, y el nombre del curso
SELECT 
    p.nombres AS nombres_estudiante,
    r.nombres AS nombres_representante,
    r.apellidos AS apellidos_representante,
    pa.nombre_paralelo AS nombre_curso
FROM 
    escuela.matricula m
JOIN 
    escuela.estudiante e ON m.id_estudiante = e.id_estudiante
JOIN 
    escuela.personas p ON e.id_persona = p.id_persona
JOIN 
    escuela.personas r ON m.id_representante = r.id_persona
JOIN 
    escuela.paralelos pa ON e.id_paralelo = pa.id_paralelo
WHERE 
    m.id_periodo = 1;