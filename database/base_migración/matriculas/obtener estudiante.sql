SELECT 
    e.cedula AS cedula_estudiante,
    e.nombres AS nombres_estudiante,
    e.apellidos AS apellidos_estudiante,
    p.nombre_paralelo,
    r.nombres AS nombres_representante,
    r.apellidos AS apellidos_representante,
    r.telefono_celular AS telefono_representante
FROM 
    escuela.estudiantes e
JOIN 
    escuela.paralelos p ON e.id_paralelo = p.id_paralelo
JOIN 
    escuela.representante r ON e.id_representante = r.id_representante
WHERE 
    e.id_periodo = 14;