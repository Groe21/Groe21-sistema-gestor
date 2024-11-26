-- Consultar nombre, apellido, cédula y paralelo de un estudiante matriculado en el período con id_periodo = 1
-- Incluir cédula, nombres y apellidos del representante
SELECT 
    pe.nombres AS nombres_estudiante,
    pe.apellidos AS apellidos_estudiante,
    pe.cedula AS cedula_estudiante,
    pa.nombre_paralelo AS nombre_paralelo,
    r.cedula AS cedula_representante,
    r.nombres AS nombres_representante,
    r.apellidos AS apellidos_representante
FROM 
    escuela.matricula m
JOIN 
    escuela.estudiante e ON m.id_estudiante = e.id_estudiante
JOIN 
    escuela.personas pe ON e.id_persona = pe.id_persona
JOIN 
    escuela.paralelos pa ON e.id_paralelo = pa.id_paralelo
JOIN 
    escuela.representante r ON e.id_estudiante = r.id_estudiante
WHERE 
    m.id_periodo = 1
ORDER BY 
    pe.apellidos, pe.nombres;