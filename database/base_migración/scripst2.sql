SELECT table_schema, table_name, column_name, data_type, is_nullable, column_default
FROM information_schema.columns
ORDER BY table_schema, table_name, ordinal_position;

-- Contar el número total de tablas en la base de datos
SELECT COUNT(*)
FROM information_schema.tables
WHERE table_type = 'BASE TABLE' AND table_schema NOT IN ('information_schema', 'pg_catalog');

-- Eliminar la tabla madres
DROP TABLE IF EXISTS escuela.madres CASCADE;

-- Eliminar la tabla padres
DROP TABLE IF EXISTS escuela.padres CASCADE;

-- Eliminar la tabla relaciones_familiares
DROP TABLE IF EXISTS escuela.relaciones_familiares CASCADE;