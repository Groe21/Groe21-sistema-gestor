-- Crear la tabla profesores
CREATE TABLE escuela.profesores (
    id_profesor SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_periodo INT NOT NULL,
    id_paralelo INT NOT NULL,
    FOREIGN KEY (id_periodo) REFERENCES escuela.periodos_lectivos(id_periodo),
    FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos(id_paralelo)
);

-- Modificar la tabla profesores para permitir valores nulos en la columna id_paralelo
ALTER TABLE escuela.profesores ALTER COLUMN id_paralelo DROP NOT NULL;

CREATE TABLE IF NOT EXISTS escuela.asistencia (
    id_asistencia SERIAL PRIMARY KEY,
    id_estudiante INTEGER NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT asistencia_id_estudiante_fkey FOREIGN KEY (id_estudiante)
        REFERENCES escuela.estudiantes (id_estudiante) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO escuela.asistencia (id_estudiante, fecha, estado)
VALUES (5, CURRENT_DATE, 'presente');

SELECT * FROM escuela.asistencia WHERE id_estudiante = 5;


SELECT e.id_estudiante, e.nombres, e.apellidos
FROM escuela.estudiantes e
WHERE e.id_paralelo = 23  -- Reemplaza con el ID del paralelo (curso)
AND e.id_periodo = 14     -- Reemplaza con el ID del periodo
ORDER BY e.apellidos, e.nombres;


SELECT 
    p.nombre AS nombre_profesor,
    pa.nombre_paralelo AS curso
FROM 
    escuela.profesores p
LEFT JOIN 
    escuela.asignaciones a ON p.id_profesor = a.id_profesor
LEFT JOIN 
    escuela.paralelos pa ON a.id_paralelo = pa.id_paralelo
WHERE 
    p.id_periodo = 13
ORDER BY 
    p.nombre;
	
	
	
SELECT 
    e.id_estudiante,
    e.cedula,
    CONCAT(e.nombres, ' ', e.apellidos) AS nombre_completo,
    p.nombre_paralelo AS paralelo
FROM 
    escuela.estudiantes e
JOIN 
    escuela.paralelos p ON e.id_paralelo = p.id_paralelo
WHERE 
    e.id_paralelo = 22
ORDER BY 
    e.apellidos, e.nombres;
	
	
	
SELECT 
    CONCAT(e.nombres, ' ', e.apellidos) AS nombre_completo
FROM 
    escuela.estudiantes e
JOIN 
    escuela.profesores p ON e.id_paralelo = p.id_paralelo
WHERE 
    e.id_periodo = 14
AND 
    p.id_periodo = 14
AND 
    p.id_profesor = 9
ORDER BY 
    e.apellidos, e.nombres;