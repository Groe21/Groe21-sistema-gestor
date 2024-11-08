
-- Tabla personas en el esquema escuela
CREATE TABLE escuela.personas (
    id_persona INT PRIMARY KEY,
    cedula VARCHAR(10) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    correo VARCHAR(50),
    foto VARCHAR(255),
    rol VARCHAR(20) CHECK (rol IN ('estudiante', 'madre', 'padre'))
);

-- Tabla estudiantes en el esquema escuela
CREATE TABLE escuela.estudiantes (
    id_estudiante INT PRIMARY KEY,
    id_persona INT REFERENCES escuela.personas(id_persona),
    grado VARCHAR(20) NOT NULL,
    paralelo VARCHAR(10),
    codigo_unico VARCHAR(20) NOT NULL,
    condicion SMALLINT,
    tipo_discapacidad VARCHAR(50),
    porcentaje_discapacidad DECIMAL(5,2),
    carnet_discapacidad VARCHAR(20)
);

-- Tabla relaciones_familiares en el esquema escuela
CREATE TABLE escuela.relaciones_familiares (
    id_relacion INT PRIMARY KEY,
    id_estudiante INT REFERENCES escuela.estudiantes(id_estudiante),
    id_familiar INT REFERENCES escuela.personas(id_persona),
    relacion VARCHAR(20) CHECK (relacion IN ('madre', 'padre', 'representante', 'etc.'))
);

-- Modificar la tabla personas para incluir el rol administrador
ALTER TABLE escuela.personas
    DROP CONSTRAINT IF EXISTS personas_rol_check;

ALTER TABLE escuela.personas
    ADD CONSTRAINT personas_rol_check CHECK (rol IN ('estudiante', 'madre', 'padre', 'administrador', 'etc.'));
	
-- Crear la tabla usuarios en el esquema escuela
CREATE TABLE escuela.usuarios (
    id_usuario SERIAL PRIMARY KEY,
    id_persona INT REFERENCES escuela.personas(id_persona),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(20) CHECK (rol IN ('administrador', 'usuario', 'etc.'))
);

-- Crear una secuencia para id_persona
CREATE SEQUENCE escuela.personas_id_persona_seq;

-- Asignar la secuencia a la columna id_persona
ALTER TABLE escuela.personas ALTER COLUMN id_persona SET DEFAULT nextval('escuela.personas_id_persona_seq');

-- Asegurarse de que la secuencia esté sincronizada con los valores existentes
SELECT setval('escuela.personas_id_persona_seq', COALESCE((SELECT MAX(id_persona) FROM escuela.personas), 1), false);


-- Crear la tabla usuarios en el esquema escuela
CREATE TABLE escuela.usuarios (
    id_usuario SERIAL PRIMARY KEY,
    id_persona INT REFERENCES escuela.personas(id_persona),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Crear la tabla paralelos en el esquema escuela
CREATE TABLE escuela.paralelos (
    id_paralelo SERIAL PRIMARY KEY,
    nombre_paralelo VARCHAR(10) NOT NULL
);

-- Crear la tabla profesores en el esquema escuela
CREATE TABLE escuela.profesores (
    id_profesor SERIAL PRIMARY KEY,
    id_persona INT NOT NULL,
    id_paralelo INT,
    FOREIGN KEY (id_persona) REFERENCES escuela.personas(id_persona),
    FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos(id_paralelo)
);

-- Actualizar la tabla personas en el esquema escuela
ALTER TABLE escuela.personas
    DROP CONSTRAINT IF EXISTS personas_rol_check,
    ADD CONSTRAINT personas_rol_check CHECK (rol IN ('estudiante', 'madre', 'padre', 'profesor', 'administrador'));
	
	
CREATE TABLE escuela.asignaciones (
    id_asignacion SERIAL PRIMARY KEY,
    id_profesor INT NOT NULL,
    id_paralelo INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES escuela.personas(id_persona),
    FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos(id_paralelo),
    UNIQUE (id_profesor, id_paralelo)
);

-- Crear tabla madres
CREATE TABLE escuela.madres (
    id_madre SERIAL PRIMARY KEY,
    id_persona INT REFERENCES escuela.personas(id_persona),
    ocupacion VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(50)
);

-- Crear tabla padres
CREATE TABLE escuela.padres (
    id_padre SERIAL PRIMARY KEY,
    id_persona INT REFERENCES escuela.personas(id_persona),
    ocupacion VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(50)
);

SELECT schema_name
FROM information_schema.schemata
WHERE schema_name = 'escuela';

ALTER TABLE escuela.estudiantes
DROP COLUMN grado;