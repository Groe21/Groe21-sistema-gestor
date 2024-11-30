-- Obtener el nombre del profesor dependiendo del periodo y el curso (paralelo)
SELECT p.nombre
FROM escuela.profesores p
LEFT JOIN escuela.asignaciones a ON p.id_profesor = a.id_profesor
LEFT JOIN escuela.paralelos pa ON a.id_paralelo = pa.id_paralelo
WHERE p.id_periodo = 13 AND pa.id_paralelo = 22;

-- Obtener los datos de los estudiantes
SELECT id_estudiante, nombres, apellidos 
FROM escuela.estudiantes 
WHERE id_periodo = 13 AND id_paralelo = 22;

-- Obtener la asistencia de los estudiantes para la semana actual
SELECT estado 
FROM escuela.asistencia 
WHERE id_estudiante = 1 AND fecha = '2023-10-01';



-- Obtener los datos de los estudiantes
SELECT id_estudiante, nombres, apellidos 
FROM escuela.estudiantes 
WHERE id_periodo = 13 AND id_paralelo = 22;

-- Obtener la asistencia de los estudiantes para el mes actual
SELECT estado 
FROM escuela.asistencia 
WHERE id_estudiante = 1 
  AND EXTRACT(MONTH FROM fecha) = EXTRACT(MONTH FROM CURRENT_DATE)
  AND EXTRACT(YEAR FROM fecha) = EXTRACT(YEAR FROM CURRENT_DATE);
  
  
  
  
  
-- Obtener los datos de los estudiantes
SELECT id_estudiante, nombres, apellidos 
FROM escuela.estudiantes 
WHERE id_periodo = 13 AND id_paralelo = 22;

-- Obtener la asistencia de los estudiantes para el año actual
SELECT estado 
FROM escuela.asistencia 
WHERE id_estudiante = 1 
  AND EXTRACT(YEAR FROM fecha) = EXTRACT(YEAR FROM CURRENT_DATE);