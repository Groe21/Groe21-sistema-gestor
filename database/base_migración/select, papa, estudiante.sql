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