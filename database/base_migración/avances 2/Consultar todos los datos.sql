-- Consultar todos los datos del estudiante, madre, padre y representante para el estudiante con id_estudiante = 59
-- Incluir el período lectivo y las fotos
SELECT 
    -- Datos del estudiante
    pe.cedula AS cedula_estudiante,
    pe.apellidos AS apellidos_estudiante,
    pe.nombres AS nombres_estudiante,
    pe.direccion AS direccion_estudiante,
    pe.telefono AS telefono_estudiante,
    pe.correo AS correo_estudiante,
    pe.foto AS foto_estudiante,
    e.fecha_nacimiento,
    e.lugar_nacimiento,
    e.residencia,
    e.sector,
    par.nombre_paralelo AS nombre_paralelo,
    
    -- Datos del padre
    pp.cedula AS cedula_padre,
    pp.apellidos AS apellidos_padre,
    pp.nombres AS nombres_padre,
    pp.direccion AS direccion_padre,
    pp.telefono AS telefono_padre,
    pp.correo AS correo_padre,
    pp.foto AS foto_padre,
    padre.ocupacion AS ocupacion_padre,
    
    -- Datos de la madre
    pm.cedula AS cedula_madre,
    pm.apellidos AS apellidos_madre,
    pm.nombres AS nombres_madre,
    pm.direccion AS direccion_madre,
    pm.telefono AS telefono_madre,
    pm.correo AS correo_madre,
    pm.foto AS foto_madre,
    madre.ocupacion AS ocupacion_madre,
    
    -- Datos del representante
    r.cedula AS cedula_representante,
    r.apellidos AS apellidos_representante,
    r.nombres AS nombres_representante,
    r.direccion AS direccion_representante,
    r.telefono AS telefono_representante,
    r.correo AS correo_representante,
    r.tipo_representante,
    r.ocupacion AS ocupacion_representante,
    
    -- Datos del período lectivo
    pl.nombre_periodo AS nombre_periodo
FROM 
    escuela.matricula mat
JOIN 
    escuela.estudiante e ON mat.id_estudiante = e.id_estudiante
JOIN 
    escuela.personas pe ON e.id_persona = pe.id_persona
JOIN 
    escuela.paralelos par ON e.id_paralelo = par.id_paralelo
LEFT JOIN 
    escuela.padre padre ON mat.id_padre = padre.id_padre
LEFT JOIN 
    escuela.personas pp ON padre.id_persona = pp.id_persona
LEFT JOIN 
    escuela.madre madre ON mat.id_madre = madre.id_madre
LEFT JOIN 
    escuela.personas pm ON madre.id_persona = pm.id_persona
LEFT JOIN 
    escuela.representante r ON e.id_estudiante = r.id_estudiante
JOIN 
    escuela.periodos_lectivos pl ON mat.id_periodo = pl.id_periodo
WHERE 
    e.id_estudiante = 51
ORDER BY 
    pe.apellidos, pe.nombres;