-- Agregar la columna id_periodo a la tabla personas
ALTER TABLE escuela.personas
ADD COLUMN id_periodo INTEGER;

-- Establecer la clave foránea id_periodo que referencia a periodos_lectivos(id_periodo)
ALTER TABLE escuela.personas
ADD CONSTRAINT fk_personas_periodos
FOREIGN KEY (id_periodo) REFERENCES escuela.periodos_lectivos(id_periodo);


CREATE TABLE IF NOT EXISTS escuela.estudiante (
    id_estudiante SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES escuela.personas(id_persona),
    fecha_nacimiento DATE NOT NULL,
    lugar_nacimiento VARCHAR(100) NOT NULL,
    residencia VARCHAR(100) NOT NULL,
    sector VARCHAR(100) NOT NULL,
    id_paralelo INT NOT NULL REFERENCES escuela.paralelos(id_paralelo)
);

CREATE TABLE IF NOT EXISTS escuela.padre (
    id_padre SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES escuela.personas(id_persona),
    ocupacion VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS escuela.madre (
    id_madre SERIAL PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES escuela.personas(id_persona),
    ocupacion VARCHAR(100) NOT NULL
);

CREATE OR REPLACE FUNCTION obtener_personas_por_rol_y_periodo(p_tipo_rol VARCHAR, p_id_periodo INTEGER)
RETURNS TABLE (
    id_persona INTEGER,
    cedula VARCHAR,
    nombres VARCHAR,
    apellidos VARCHAR,
    direccion VARCHAR,
    telefono VARCHAR,
    correo VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT id_persona, cedula, nombres, apellidos, direccion, telefono, correo
    FROM escuela.personas
    WHERE rol = p_tipo_rol AND id_periodo = p_id_periodo;
END;
$$ LANGUAGE plpgsql;

-- Verificar la función con diferentes parámetros
SELECT * FROM obtener_personas_por_rol_y_periodo('estudiante', 3);
SELECT * FROM obtener_personas_por_rol_y_periodo('madre', 2);
SELECT * FROM obtener_personas_por_rol_y_periodo('padre', 3);

SELECT id_persona, cedula, nombres, apellidos, direccion, telefono, correo
FROM escuela.personas
WHERE rol = 'estudiante' AND id_periodo = 3;

DESCRIBE escuela.personas;

ALTER TABLE escuela.personas ALTER COLUMN id_periodo DROP NOT NULL;

ALTER TABLE escuela.personas DROP CONSTRAINT personas_rol_check;
ALTER TABLE escuela.personas ADD CONSTRAINT personas_rol_check CHECK (rol IN ('estudiante', 'padre', 'madre', 'representante') OR rol IS NULL);