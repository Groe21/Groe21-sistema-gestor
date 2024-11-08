CREATE OR REPLACE FUNCTION escuela.obtener_profesores()
RETURNS TABLE(id_persona INT, nombres VARCHAR, apellidos VARCHAR, nombre_paralelo VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT p.id_persona, p.nombres, p.apellidos, pa.nombre_paralelo
    FROM escuela.personas p
    LEFT JOIN escuela.profesores pr ON p.id_persona = pr.id_persona
    LEFT JOIN escuela.paralelos pa ON pr.id_paralelo = pa.id_paralelo
    WHERE p.rol = 'profesor';
END;
$$ LANGUAGE plpgsql;

SELECT * FROM obtener_profesores();