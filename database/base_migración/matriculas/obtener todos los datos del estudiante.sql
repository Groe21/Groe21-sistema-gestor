SELECT 
    m.id_matricula AS numero_matricula,
    p.nombre_paralelo,
    -- Datos del Estudiante
    e.cedula AS cedula_estudiante,
    e.nombres AS nombres_estudiante,
    e.apellidos AS apellidos_estudiante,
    e.fecha_nacimiento AS fecha_nacimiento_estudiante,
    e.lugar_nacimiento AS lugar_nacimiento_estudiante,
    e.residencia AS residencia_estudiante,
    e.direccion AS direccion_estudiante,
    e.sector AS sector_estudiante,
    e.foto AS foto_estudiante,
    -- Datos del Padre de Familia
    pf.cedula AS cedula_padre,
    pf.nombres AS nombres_padre,
    pf.apellidos AS apellidos_padre,
    pf.direccion_domiciliaria AS direccion_padre,
    pf.ocupacion_profesion AS ocupacion_padre,
    pf.telefono_celular AS telefono_padre,
    pf.email AS email_padre,
    pf.foto AS foto_padre,
    -- Datos de la Madre de Familia
    mf.cedula AS cedula_madre,
    mf.nombres AS nombres_madre,
    mf.apellidos AS apellidos_madre,
    mf.direccion_domiciliaria AS direccion_madre,
    mf.ocupacion_profesion AS ocupacion_madre,
    mf.telefono_celular AS telefono_madre,
    mf.email AS email_madre,
    mf.foto AS foto_madre,
    -- Datos del Representante
    r.cedula AS cedula_representante,
    r.nombres AS nombres_representante,
    r.apellidos AS apellidos_representante,
    r.direccion_domiciliaria AS direccion_representante,
    r.ocupacion_profesion AS ocupacion_representante,
    r.telefono_celular AS telefono_representante,
    r.email AS email_representante,
    r.foto AS foto_representante,
    r.tipo AS tipo_representante
FROM 
    escuela.matriculas m
JOIN 
    escuela.estudiantes e ON m.id_estudiante = e.id_estudiante
JOIN 
    escuela.paralelos p ON m.id_paralelo = p.id_paralelo
LEFT JOIN 
    escuela.padre_familia pf ON e.id_padre = pf.id_padre
LEFT JOIN 
    escuela.madre_familia mf ON e.id_madre = mf.id_madre
LEFT JOIN 
    escuela.representante r ON e.id_representante = r.id_representante
WHERE 
    e.id_estudiante = 5;