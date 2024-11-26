-- Crear la tabla estudiantes
CREATE TABLE IF NOT EXISTS escuela.estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    cedula VARCHAR(10) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    lugar_nacimiento VARCHAR(100) NOT NULL,
    residencia VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    sector VARCHAR(50) NOT NULL,
    foto VARCHAR(255),
    id_paralelo INTEGER,
    id_periodo INTEGER,
    id_padre INTEGER,
    id_madre INTEGER,
    id_representante INTEGER,
    FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos (id_paralelo),
    FOREIGN KEY (id_periodo) REFERENCES escuela.periodos_lectivos (id_periodo),
    FOREIGN KEY (id_padre) REFERENCES escuela.padre_familia (id_padre),
    FOREIGN KEY (id_madre) REFERENCES escuela.madre_familia (id_madre),
    FOREIGN KEY (id_representante) REFERENCES escuela.representante (id_representante)
);

-- Crear la tabla padre_familia
CREATE TABLE IF NOT EXISTS escuela.padre_familia (
    id_padre SERIAL PRIMARY KEY,
    apellidos VARCHAR(50) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    cedula VARCHAR(10) NOT NULL,
    direccion_domiciliaria VARCHAR(100) NOT NULL,
    ocupacion_profesion VARCHAR(50) NOT NULL,
    telefono_celular VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    foto VARCHAR(255)
);

-- Crear la tabla madre_familia
CREATE TABLE IF NOT EXISTS escuela.madre_familia (
    id_madre SERIAL PRIMARY KEY,
    apellidos VARCHAR(50) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    cedula VARCHAR(10) NOT NULL,
    direccion_domiciliaria VARCHAR(100) NOT NULL,
    ocupacion_profesion VARCHAR(50) NOT NULL,
    telefono_celular VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    foto VARCHAR(255)
);

-- Crear la tabla representante
CREATE TABLE IF NOT EXISTS escuela.representante (
    id_representante SERIAL PRIMARY KEY,
    apellidos VARCHAR(50) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    cedula VARCHAR(10) NOT NULL,
    direccion_domiciliaria VARCHAR(100) NOT NULL,
    ocupacion_profesion VARCHAR(50) NOT NULL,
    telefono_celular VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    foto VARCHAR(255),
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('mama', 'papa', 'hermano/a', 'tio/a', 'abuelo/a', 'otro'))
);

-- Crear la tabla matriculas
CREATE TABLE IF NOT EXISTS escuela.matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INTEGER NOT NULL,
    id_periodo INTEGER NOT NULL,
    id_paralelo INTEGER NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES escuela.estudiantes (id_estudiante),
    FOREIGN KEY (id_periodo) REFERENCES escuela.periodos_lectivos (id_periodo),
    FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos (id_paralelo)
);