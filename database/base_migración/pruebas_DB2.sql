CREATE SEQUENCE escuela.estudiantes_id_estudiante_seq;

ALTER TABLE escuela.estudiantes ALTER COLUMN id_estudiante SET DEFAULT nextval('escuela.estudiantes_id_estudiante_seq');

SELECT setval('escuela.estudiantes_id_estudiante_seq', COALESCE((SELECT MAX(id_estudiante) FROM escuela.estudiantes), 1));