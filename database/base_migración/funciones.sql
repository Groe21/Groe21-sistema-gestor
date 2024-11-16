CREATE OR REPLACE FUNCTION escuela.matricular_estudiante(
    p_id_persona INT,
    p_paralelo VARCHAR,
    p_codigo_unico VARCHAR,
    p_condicion SMALLINT,
    p_tipo_discapacidad VARCHAR,
    p_porcentaje_discapacidad NUMERIC,
    p_carnet_discapacidad VARCHAR,
    p_imagen VARCHAR,
    p_id_periodo INT,
    p_id_persona_mama INT,
    p_ocupacion_mama VARCHAR,
    p_telefono_mama VARCHAR,
    p_correo_mama VARCHAR,
    p_id_persona_papa INT,
    p_ocupacion_papa VARCHAR,
    p_telefono_papa VARCHAR,
    p_correo_papa VARCHAR
)
RETURNS VOID AS $$
BEGIN
    -- Insertar datos del estudiante
    INSERT INTO escuela.estudiantes (
        id_persona, paralelo, codigo_unico, condicion, tipo_discapacidad, 
        porcentaje_discapacidad, carnet_discapacidad, imagen, id_periodo
    ) VALUES (
        p_id_persona, p_paralelo, p_codigo_unico, p_condicion, p_tipo_discapacidad, 
        p_porcentaje_discapacidad, p_carnet_discapacidad, p_imagen, p_id_periodo
    );

    -- Insertar datos de la madre
    INSERT INTO escuela.madres (
        id_persona, ocupacion, telefono, correo
    ) VALUES (
        p_id_persona_mama, p_ocupacion_mama, p_telefono_mama, p_correo_mama
    );

    -- Insertar datos del padre
    INSERT INTO escuela.padres (
        id_persona, ocupacion, telefono, correo
    ) VALUES (
        p_id_persona_papa, p_ocupacion_papa, p_telefono_papa, p_correo_papa
    );
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error al insertar la matrícula: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;