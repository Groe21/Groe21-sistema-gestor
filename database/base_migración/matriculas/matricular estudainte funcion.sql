CREATE OR REPLACE FUNCTION matricular_estudiante(
    p_cedula_estudiante VARCHAR,
    p_apellidos_estudiante VARCHAR,
    p_nombres_estudiante VARCHAR,
    p_fecha_nacimiento DATE,
    p_lugar_nacimiento VARCHAR,
    p_residencia VARCHAR,
    p_direccion VARCHAR,
    p_sector VARCHAR,
    p_foto_estudiante VARCHAR,
    p_id_paralelo INTEGER,
    p_id_periodo INTEGER,
    p_cedula_padre VARCHAR,
    p_apellidos_padre VARCHAR,
    p_nombres_padre VARCHAR,
    p_direccion_padre VARCHAR,
    p_ocupacion_padre VARCHAR,
    p_telefono_padre VARCHAR,
    p_email_padre VARCHAR,
    p_foto_padre VARCHAR,
    p_cedula_madre VARCHAR,
    p_apellidos_madre VARCHAR,
    p_nombres_madre VARCHAR,
    p_direccion_madre VARCHAR,
    p_ocupacion_madre VARCHAR,
    p_telefono_madre VARCHAR,
    p_email_madre VARCHAR,
    p_foto_madre VARCHAR,
    p_cedula_representante VARCHAR,
    p_apellidos_representante VARCHAR,
    p_nombres_representante VARCHAR,
    p_direccion_representante VARCHAR,
    p_ocupacion_representante VARCHAR,
    p_telefono_representante VARCHAR,
    p_email_representante VARCHAR,
    p_foto_representante VARCHAR,
    p_tipo_representante VARCHAR
)
RETURNS VOID AS $$
DECLARE
    v_id_padre INTEGER;
    v_id_madre INTEGER;
    v_id_representante INTEGER;
    v_id_estudiante INTEGER;
BEGIN
    -- Insertar datos en la tabla padre_familia
    INSERT INTO escuela.padre_familia (apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto)
    VALUES (p_apellidos_padre, p_nombres_padre, p_cedula_padre, p_direccion_padre, p_ocupacion_padre, p_telefono_padre, p_email_padre, p_foto_padre)
    RETURNING id_padre INTO v_id_padre;

    -- Insertar datos en la tabla madre_familia
    INSERT INTO escuela.madre_familia (apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto)
    VALUES (p_apellidos_madre, p_nombres_madre, p_cedula_madre, p_direccion_madre, p_ocupacion_madre, p_telefono_madre, p_email_madre, p_foto_madre)
    RETURNING id_madre INTO v_id_madre;

    -- Insertar datos en la tabla representante
    INSERT INTO escuela.representante (apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto, tipo)
    VALUES (p_apellidos_representante, p_nombres_representante, p_cedula_representante, p_direccion_representante, p_ocupacion_representante, p_telefono_representante, p_email_representante, p_foto_representante, p_tipo_representante)
    RETURNING id_representante INTO v_id_representante;

    -- Insertar datos en la tabla estudiantes
    INSERT INTO escuela.estudiantes (cedula, apellidos, nombres, fecha_nacimiento, lugar_nacimiento, residencia, direccion, sector, foto, id_paralelo, id_periodo, id_padre, id_madre, id_representante)
    VALUES (p_cedula_estudiante, p_apellidos_estudiante, p_nombres_estudiante, p_fecha_nacimiento, p_lugar_nacimiento, p_residencia, p_direccion, p_sector, p_foto_estudiante, p_id_paralelo, p_id_periodo, v_id_padre, v_id_madre, v_id_representante)
    RETURNING id_estudiante INTO v_id_estudiante;

    -- Insertar datos en la tabla matriculas
    INSERT INTO escuela.matriculas (id_estudiante, id_periodo, id_paralelo)
    VALUES (v_id_estudiante, p_id_periodo, p_id_paralelo);
END;
$$ LANGUAGE plpgsql;