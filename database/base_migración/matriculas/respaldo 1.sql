PGDMP  $                
    |            aguilas_del_saber    16.2    16.2 f    b           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            c           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            d           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            e           1262    16580    aguilas_del_saber    DATABASE     �   CREATE DATABASE aguilas_del_saber WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
 !   DROP DATABASE aguilas_del_saber;
                emilio    false                        2615    16581    escuela    SCHEMA        CREATE SCHEMA escuela;
    DROP SCHEMA escuela;
                emilio    false            �            1255    16582   matricular_estudiante(integer, character varying, character varying, smallint, character varying, numeric, character varying, character varying, integer, integer, character varying, character varying, character varying, integer, character varying, character varying, character varying)    FUNCTION     +  CREATE FUNCTION escuela.matricular_estudiante(p_id_persona integer, p_paralelo character varying, p_codigo_unico character varying, p_condicion smallint, p_tipo_discapacidad character varying, p_porcentaje_discapacidad numeric, p_carnet_discapacidad character varying, p_imagen character varying, p_id_periodo integer, p_id_persona_mama integer, p_ocupacion_mama character varying, p_telefono_mama character varying, p_correo_mama character varying, p_id_persona_papa integer, p_ocupacion_papa character varying, p_telefono_papa character varying, p_correo_papa character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;
 D  DROP FUNCTION escuela.matricular_estudiante(p_id_persona integer, p_paralelo character varying, p_codigo_unico character varying, p_condicion smallint, p_tipo_discapacidad character varying, p_porcentaje_discapacidad numeric, p_carnet_discapacidad character varying, p_imagen character varying, p_id_periodo integer, p_id_persona_mama integer, p_ocupacion_mama character varying, p_telefono_mama character varying, p_correo_mama character varying, p_id_persona_papa integer, p_ocupacion_papa character varying, p_telefono_papa character varying, p_correo_papa character varying);
       escuela          emilio    false    6            �            1255    16583    obtener_profesores()    FUNCTION     �  CREATE FUNCTION escuela.obtener_profesores() RETURNS TABLE(id_persona integer, nombres character varying, apellidos character varying, nombre_paralelo character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT p.id_persona, p.nombres, p.apellidos, pa.nombre_paralelo
    FROM escuela.personas p
    LEFT JOIN escuela.profesores pr ON p.id_persona = pr.id_persona
    LEFT JOIN escuela.paralelos pa ON pr.id_paralelo = pa.id_paralelo
    WHERE p.rol = 'profesor';
END;
$$;
 ,   DROP FUNCTION escuela.obtener_profesores();
       escuela          emilio    false    6            �            1255    17364 �  matricular_estudiante(character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.matricular_estudiante(p_cedula_estudiante character varying, p_apellidos_estudiante character varying, p_nombres_estudiante character varying, p_fecha_nacimiento date, p_lugar_nacimiento character varying, p_residencia character varying, p_direccion character varying, p_sector character varying, p_foto_estudiante character varying, p_id_paralelo integer, p_id_periodo integer, p_cedula_padre character varying, p_apellidos_padre character varying, p_nombres_padre character varying, p_direccion_padre character varying, p_ocupacion_padre character varying, p_telefono_padre character varying, p_email_padre character varying, p_foto_padre character varying, p_cedula_madre character varying, p_apellidos_madre character varying, p_nombres_madre character varying, p_direccion_madre character varying, p_ocupacion_madre character varying, p_telefono_madre character varying, p_email_madre character varying, p_foto_madre character varying, p_cedula_representante character varying, p_apellidos_representante character varying, p_nombres_representante character varying, p_direccion_representante character varying, p_ocupacion_representante character varying, p_telefono_representante character varying, p_email_representante character varying, p_foto_representante character varying, p_tipo_representante character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;
 D  DROP FUNCTION public.matricular_estudiante(p_cedula_estudiante character varying, p_apellidos_estudiante character varying, p_nombres_estudiante character varying, p_fecha_nacimiento date, p_lugar_nacimiento character varying, p_residencia character varying, p_direccion character varying, p_sector character varying, p_foto_estudiante character varying, p_id_paralelo integer, p_id_periodo integer, p_cedula_padre character varying, p_apellidos_padre character varying, p_nombres_padre character varying, p_direccion_padre character varying, p_ocupacion_padre character varying, p_telefono_padre character varying, p_email_padre character varying, p_foto_padre character varying, p_cedula_madre character varying, p_apellidos_madre character varying, p_nombres_madre character varying, p_direccion_madre character varying, p_ocupacion_madre character varying, p_telefono_madre character varying, p_email_madre character varying, p_foto_madre character varying, p_cedula_representante character varying, p_apellidos_representante character varying, p_nombres_representante character varying, p_direccion_representante character varying, p_ocupacion_representante character varying, p_telefono_representante character varying, p_email_representante character varying, p_foto_representante character varying, p_tipo_representante character varying);
       public          emilio    false            �            1259    17126    asignaciones    TABLE     �   CREATE TABLE escuela.asignaciones (
    id_asignacion integer NOT NULL,
    id_profesor integer NOT NULL,
    id_paralelo integer NOT NULL
);
 !   DROP TABLE escuela.asignaciones;
       escuela         heap    emilio    false    6            �            1259    17125    asignaciones_id_asignacion_seq    SEQUENCE     �   CREATE SEQUENCE escuela.asignaciones_id_asignacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE escuela.asignaciones_id_asignacion_seq;
       escuela          emilio    false    225    6            f           0    0    asignaciones_id_asignacion_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE escuela.asignaciones_id_asignacion_seq OWNED BY escuela.asignaciones.id_asignacion;
          escuela          emilio    false    224            �            1259    17456 
   asistencia    TABLE     �   CREATE TABLE escuela.asistencia (
    id_asistencia integer NOT NULL,
    id_estudiante integer NOT NULL,
    fecha date NOT NULL,
    estado character varying(20) NOT NULL
);
    DROP TABLE escuela.asistencia;
       escuela         heap    emilio    false    6            �            1259    17455    asistencia_id_asistencia_seq    SEQUENCE     �   CREATE SEQUENCE escuela.asistencia_id_asistencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE escuela.asistencia_id_asistencia_seq;
       escuela          emilio    false    6    239            g           0    0    asistencia_id_asistencia_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE escuela.asistencia_id_asistencia_seq OWNED BY escuela.asistencia.id_asistencia;
          escuela          emilio    false    238            �            1259    17277    estudiantes    TABLE     N  CREATE TABLE escuela.estudiantes (
    id_estudiante integer NOT NULL,
    cedula character varying(10) NOT NULL,
    apellidos character varying(50) NOT NULL,
    nombres character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    lugar_nacimiento character varying(100) NOT NULL,
    residencia character varying(100) NOT NULL,
    direccion character varying(100) NOT NULL,
    sector character varying(50) NOT NULL,
    foto character varying(255),
    id_paralelo integer,
    id_periodo integer,
    id_padre integer,
    id_madre integer,
    id_representante integer
);
     DROP TABLE escuela.estudiantes;
       escuela         heap    emilio    false    6            �            1259    16716    estudiantes_id_estudiante_seq    SEQUENCE     �   CREATE SEQUENCE escuela.estudiantes_id_estudiante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE escuela.estudiantes_id_estudiante_seq;
       escuela          emilio    false    6            �            1259    17276    estudiantes_id_estudiante_seq1    SEQUENCE     �   CREATE SEQUENCE escuela.estudiantes_id_estudiante_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE escuela.estudiantes_id_estudiante_seq1;
       escuela          emilio    false    6    231            h           0    0    estudiantes_id_estudiante_seq1    SEQUENCE OWNED BY     b   ALTER SEQUENCE escuela.estudiantes_id_estudiante_seq1 OWNED BY escuela.estudiantes.id_estudiante;
          escuela          emilio    false    230            �            1259    17259    madre_familia    TABLE     �  CREATE TABLE escuela.madre_familia (
    id_madre integer NOT NULL,
    apellidos character varying(50) NOT NULL,
    nombres character varying(50) NOT NULL,
    cedula character varying(10) NOT NULL,
    direccion_domiciliaria character varying(100) NOT NULL,
    ocupacion_profesion character varying(50) NOT NULL,
    telefono_celular character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    foto character varying(255)
);
 "   DROP TABLE escuela.madre_familia;
       escuela         heap    emilio    false    6            �            1259    17258    madre_familia_id_madre_seq    SEQUENCE     �   CREATE SEQUENCE escuela.madre_familia_id_madre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE escuela.madre_familia_id_madre_seq;
       escuela          emilio    false    229    6            i           0    0    madre_familia_id_madre_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE escuela.madre_familia_id_madre_seq OWNED BY escuela.madre_familia.id_madre;
          escuela          emilio    false    228            �            1259    17333 
   matriculas    TABLE     �   CREATE TABLE escuela.matriculas (
    id_matricula integer NOT NULL,
    id_estudiante integer NOT NULL,
    id_periodo integer NOT NULL,
    id_paralelo integer NOT NULL
);
    DROP TABLE escuela.matriculas;
       escuela         heap    emilio    false    6            �            1259    17332    matriculas_id_matricula_seq    SEQUENCE     �   CREATE SEQUENCE escuela.matriculas_id_matricula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE escuela.matriculas_id_matricula_seq;
       escuela          emilio    false    233    6            j           0    0    matriculas_id_matricula_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE escuela.matriculas_id_matricula_seq OWNED BY escuela.matriculas.id_matricula;
          escuela          emilio    false    232            �            1259    17250    padre_familia    TABLE     �  CREATE TABLE escuela.padre_familia (
    id_padre integer NOT NULL,
    apellidos character varying(50) NOT NULL,
    nombres character varying(50) NOT NULL,
    cedula character varying(10) NOT NULL,
    direccion_domiciliaria character varying(100) NOT NULL,
    ocupacion_profesion character varying(50) NOT NULL,
    telefono_celular character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    foto character varying(255)
);
 "   DROP TABLE escuela.padre_familia;
       escuela         heap    emilio    false    6            �            1259    17249    padre_familia_id_padre_seq    SEQUENCE     �   CREATE SEQUENCE escuela.padre_familia_id_padre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE escuela.padre_familia_id_padre_seq;
       escuela          emilio    false    6    227            k           0    0    padre_familia_id_padre_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE escuela.padre_familia_id_padre_seq OWNED BY escuela.padre_familia.id_padre;
          escuela          emilio    false    226            �            1259    16601 	   paralelos    TABLE     y   CREATE TABLE escuela.paralelos (
    id_paralelo integer NOT NULL,
    nombre_paralelo character varying(10) NOT NULL
);
    DROP TABLE escuela.paralelos;
       escuela         heap    emilio    false    6            �            1259    16604    paralelos_id_paralelo_seq    SEQUENCE     �   CREATE SEQUENCE escuela.paralelos_id_paralelo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE escuela.paralelos_id_paralelo_seq;
       escuela          emilio    false    216    6            l           0    0    paralelos_id_paralelo_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE escuela.paralelos_id_paralelo_seq OWNED BY escuela.paralelos.id_paralelo;
          escuela          emilio    false    217            �            1259    16605    periodos_lectivos    TABLE     �   CREATE TABLE escuela.periodos_lectivos (
    id_periodo integer NOT NULL,
    nombre_periodo character varying(50) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);
 &   DROP TABLE escuela.periodos_lectivos;
       escuela         heap    emilio    false    6            �            1259    16608     periodos_lectivos_id_periodo_seq    SEQUENCE     �   CREATE SEQUENCE escuela.periodos_lectivos_id_periodo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE escuela.periodos_lectivos_id_periodo_seq;
       escuela          emilio    false    218    6            m           0    0     periodos_lectivos_id_periodo_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE escuela.periodos_lectivos_id_periodo_seq OWNED BY escuela.periodos_lectivos.id_periodo;
          escuela          emilio    false    219            �            1259    16609    personas_id_persona_seq    SEQUENCE     �   CREATE SEQUENCE escuela.personas_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE escuela.personas_id_persona_seq;
       escuela          emilio    false    6            �            1259    17439 
   profesores    TABLE     �   CREATE TABLE escuela.profesores (
    id_profesor integer NOT NULL,
    nombre character varying(255) NOT NULL,
    id_periodo integer NOT NULL,
    id_paralelo integer
);
    DROP TABLE escuela.profesores;
       escuela         heap    emilio    false    6            �            1259    17438    profesores_id_profesor_seq    SEQUENCE     �   CREATE SEQUENCE escuela.profesores_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE escuela.profesores_id_profesor_seq;
       escuela          emilio    false    237    6            n           0    0    profesores_id_profesor_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE escuela.profesores_id_profesor_seq OWNED BY escuela.profesores.id_profesor;
          escuela          emilio    false    236            �            1259    17429    representante    TABLE     �  CREATE TABLE escuela.representante (
    id_representante integer NOT NULL,
    apellidos character varying(50) NOT NULL,
    nombres character varying(50) NOT NULL,
    cedula character varying(10) NOT NULL,
    direccion_domiciliaria character varying(100) NOT NULL,
    ocupacion_profesion character varying(50) NOT NULL,
    telefono_celular character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    foto character varying(255),
    tipo character varying(20) NOT NULL,
    CONSTRAINT representante_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['mama'::character varying, 'papa'::character varying, 'hermano/a'::character varying, 'tio/a'::character varying, 'abuelo/a'::character varying, 'otro'::character varying])::text[])))
);
 "   DROP TABLE escuela.representante;
       escuela         heap    emilio    false    6            �            1259    17428 "   representante_id_representante_seq    SEQUENCE     �   CREATE SEQUENCE escuela.representante_id_representante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE escuela.representante_id_representante_seq;
       escuela          emilio    false    6    235            o           0    0 "   representante_id_representante_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE escuela.representante_id_representante_seq OWNED BY escuela.representante.id_representante;
          escuela          emilio    false    234            �            1259    16625    usuarios    TABLE     �   CREATE TABLE escuela.usuarios (
    id_usuario integer NOT NULL,
    id_persona integer,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE escuela.usuarios;
       escuela         heap    emilio    false    6            �            1259    16628    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE escuela.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE escuela.usuarios_id_usuario_seq;
       escuela          emilio    false    221    6            p           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE escuela.usuarios_id_usuario_seq OWNED BY escuela.usuarios.id_usuario;
          escuela          emilio    false    222            �           2604    17129    asignaciones id_asignacion    DEFAULT     �   ALTER TABLE ONLY escuela.asignaciones ALTER COLUMN id_asignacion SET DEFAULT nextval('escuela.asignaciones_id_asignacion_seq'::regclass);
 J   ALTER TABLE escuela.asignaciones ALTER COLUMN id_asignacion DROP DEFAULT;
       escuela          emilio    false    225    224    225            �           2604    17459    asistencia id_asistencia    DEFAULT     �   ALTER TABLE ONLY escuela.asistencia ALTER COLUMN id_asistencia SET DEFAULT nextval('escuela.asistencia_id_asistencia_seq'::regclass);
 H   ALTER TABLE escuela.asistencia ALTER COLUMN id_asistencia DROP DEFAULT;
       escuela          emilio    false    239    238    239            �           2604    17280    estudiantes id_estudiante    DEFAULT     �   ALTER TABLE ONLY escuela.estudiantes ALTER COLUMN id_estudiante SET DEFAULT nextval('escuela.estudiantes_id_estudiante_seq1'::regclass);
 I   ALTER TABLE escuela.estudiantes ALTER COLUMN id_estudiante DROP DEFAULT;
       escuela          emilio    false    231    230    231            �           2604    17262    madre_familia id_madre    DEFAULT     �   ALTER TABLE ONLY escuela.madre_familia ALTER COLUMN id_madre SET DEFAULT nextval('escuela.madre_familia_id_madre_seq'::regclass);
 F   ALTER TABLE escuela.madre_familia ALTER COLUMN id_madre DROP DEFAULT;
       escuela          emilio    false    229    228    229            �           2604    17336    matriculas id_matricula    DEFAULT     �   ALTER TABLE ONLY escuela.matriculas ALTER COLUMN id_matricula SET DEFAULT nextval('escuela.matriculas_id_matricula_seq'::regclass);
 G   ALTER TABLE escuela.matriculas ALTER COLUMN id_matricula DROP DEFAULT;
       escuela          emilio    false    232    233    233            �           2604    17253    padre_familia id_padre    DEFAULT     �   ALTER TABLE ONLY escuela.padre_familia ALTER COLUMN id_padre SET DEFAULT nextval('escuela.padre_familia_id_padre_seq'::regclass);
 F   ALTER TABLE escuela.padre_familia ALTER COLUMN id_padre DROP DEFAULT;
       escuela          emilio    false    227    226    227            �           2604    16632    paralelos id_paralelo    DEFAULT     �   ALTER TABLE ONLY escuela.paralelos ALTER COLUMN id_paralelo SET DEFAULT nextval('escuela.paralelos_id_paralelo_seq'::regclass);
 E   ALTER TABLE escuela.paralelos ALTER COLUMN id_paralelo DROP DEFAULT;
       escuela          emilio    false    217    216            �           2604    16633    periodos_lectivos id_periodo    DEFAULT     �   ALTER TABLE ONLY escuela.periodos_lectivos ALTER COLUMN id_periodo SET DEFAULT nextval('escuela.periodos_lectivos_id_periodo_seq'::regclass);
 L   ALTER TABLE escuela.periodos_lectivos ALTER COLUMN id_periodo DROP DEFAULT;
       escuela          emilio    false    219    218            �           2604    17442    profesores id_profesor    DEFAULT     �   ALTER TABLE ONLY escuela.profesores ALTER COLUMN id_profesor SET DEFAULT nextval('escuela.profesores_id_profesor_seq'::regclass);
 F   ALTER TABLE escuela.profesores ALTER COLUMN id_profesor DROP DEFAULT;
       escuela          emilio    false    237    236    237            �           2604    17432    representante id_representante    DEFAULT     �   ALTER TABLE ONLY escuela.representante ALTER COLUMN id_representante SET DEFAULT nextval('escuela.representante_id_representante_seq'::regclass);
 N   ALTER TABLE escuela.representante ALTER COLUMN id_representante DROP DEFAULT;
       escuela          emilio    false    235    234    235            �           2604    16635    usuarios id_usuario    DEFAULT     |   ALTER TABLE ONLY escuela.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('escuela.usuarios_id_usuario_seq'::regclass);
 C   ALTER TABLE escuela.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       escuela          emilio    false    222    221            Q          0    17126    asignaciones 
   TABLE DATA           P   COPY escuela.asignaciones (id_asignacion, id_profesor, id_paralelo) FROM stdin;
    escuela          emilio    false    225   У       _          0    17456 
   asistencia 
   TABLE DATA           R   COPY escuela.asistencia (id_asistencia, id_estudiante, fecha, estado) FROM stdin;
    escuela          emilio    false    239   �       W          0    17277    estudiantes 
   TABLE DATA           �   COPY escuela.estudiantes (id_estudiante, cedula, apellidos, nombres, fecha_nacimiento, lugar_nacimiento, residencia, direccion, sector, foto, id_paralelo, id_periodo, id_padre, id_madre, id_representante) FROM stdin;
    escuela          emilio    false    231   @�       U          0    17259    madre_familia 
   TABLE DATA           �   COPY escuela.madre_familia (id_madre, apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto) FROM stdin;
    escuela          emilio    false    229   ��       Y          0    17333 
   matriculas 
   TABLE DATA           [   COPY escuela.matriculas (id_matricula, id_estudiante, id_periodo, id_paralelo) FROM stdin;
    escuela          emilio    false    233   ̨       S          0    17250    padre_familia 
   TABLE DATA           �   COPY escuela.padre_familia (id_padre, apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto) FROM stdin;
    escuela          emilio    false    227   "�       H          0    16601 	   paralelos 
   TABLE DATA           B   COPY escuela.paralelos (id_paralelo, nombre_paralelo) FROM stdin;
    escuela          emilio    false    216   #�       J          0    16605    periodos_lectivos 
   TABLE DATA           a   COPY escuela.periodos_lectivos (id_periodo, nombre_periodo, fecha_inicio, fecha_fin) FROM stdin;
    escuela          emilio    false    218   R�       ]          0    17439 
   profesores 
   TABLE DATA           S   COPY escuela.profesores (id_profesor, nombre, id_periodo, id_paralelo) FROM stdin;
    escuela          emilio    false    237   ��       [          0    17429    representante 
   TABLE DATA           �   COPY escuela.representante (id_representante, apellidos, nombres, cedula, direccion_domiciliaria, ocupacion_profesion, telefono_celular, email, foto, tipo) FROM stdin;
    escuela          emilio    false    235   ��       M          0    16625    usuarios 
   TABLE DATA           O   COPY escuela.usuarios (id_usuario, id_persona, username, password) FROM stdin;
    escuela          emilio    false    221   �       q           0    0    asignaciones_id_asignacion_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('escuela.asignaciones_id_asignacion_seq', 14, true);
          escuela          emilio    false    224            r           0    0    asistencia_id_asistencia_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('escuela.asistencia_id_asistencia_seq', 1, true);
          escuela          emilio    false    238            s           0    0    estudiantes_id_estudiante_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('escuela.estudiantes_id_estudiante_seq', 5, true);
          escuela          emilio    false    223            t           0    0    estudiantes_id_estudiante_seq1    SEQUENCE SET     N   SELECT pg_catalog.setval('escuela.estudiantes_id_estudiante_seq1', 16, true);
          escuela          emilio    false    230            u           0    0    madre_familia_id_madre_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('escuela.madre_familia_id_madre_seq', 29, true);
          escuela          emilio    false    228            v           0    0    matriculas_id_matricula_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('escuela.matriculas_id_matricula_seq', 14, true);
          escuela          emilio    false    232            w           0    0    padre_familia_id_padre_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('escuela.padre_familia_id_padre_seq', 30, true);
          escuela          emilio    false    226            x           0    0    paralelos_id_paralelo_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('escuela.paralelos_id_paralelo_seq', 24, true);
          escuela          emilio    false    217            y           0    0     periodos_lectivos_id_periodo_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('escuela.periodos_lectivos_id_periodo_seq', 14, true);
          escuela          emilio    false    219            z           0    0    personas_id_persona_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('escuela.personas_id_persona_seq', 228, true);
          escuela          emilio    false    220            {           0    0    profesores_id_profesor_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('escuela.profesores_id_profesor_seq', 9, true);
          escuela          emilio    false    236            |           0    0 "   representante_id_representante_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('escuela.representante_id_representante_seq', 12, true);
          escuela          emilio    false    234            }           0    0    usuarios_id_usuario_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('escuela.usuarios_id_usuario_seq', 18, true);
          escuela          emilio    false    222            �           2606    17133 5   asignaciones asignaciones_id_profesor_id_paralelo_key 
   CONSTRAINT     �   ALTER TABLE ONLY escuela.asignaciones
    ADD CONSTRAINT asignaciones_id_profesor_id_paralelo_key UNIQUE (id_profesor, id_paralelo);
 `   ALTER TABLE ONLY escuela.asignaciones DROP CONSTRAINT asignaciones_id_profesor_id_paralelo_key;
       escuela            emilio    false    225    225            �           2606    17131    asignaciones asignaciones_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY escuela.asignaciones
    ADD CONSTRAINT asignaciones_pkey PRIMARY KEY (id_asignacion);
 I   ALTER TABLE ONLY escuela.asignaciones DROP CONSTRAINT asignaciones_pkey;
       escuela            emilio    false    225            �           2606    17461    asistencia asistencia_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY escuela.asistencia
    ADD CONSTRAINT asistencia_pkey PRIMARY KEY (id_asistencia);
 E   ALTER TABLE ONLY escuela.asistencia DROP CONSTRAINT asistencia_pkey;
       escuela            emilio    false    239            �           2606    17284    estudiantes estudiantes_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY escuela.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id_estudiante);
 G   ALTER TABLE ONLY escuela.estudiantes DROP CONSTRAINT estudiantes_pkey;
       escuela            emilio    false    231            �           2606    17266     madre_familia madre_familia_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY escuela.madre_familia
    ADD CONSTRAINT madre_familia_pkey PRIMARY KEY (id_madre);
 K   ALTER TABLE ONLY escuela.madre_familia DROP CONSTRAINT madre_familia_pkey;
       escuela            emilio    false    229            �           2606    17338    matriculas matriculas_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY escuela.matriculas
    ADD CONSTRAINT matriculas_pkey PRIMARY KEY (id_matricula);
 E   ALTER TABLE ONLY escuela.matriculas DROP CONSTRAINT matriculas_pkey;
       escuela            emilio    false    233            �           2606    17257     padre_familia padre_familia_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY escuela.padre_familia
    ADD CONSTRAINT padre_familia_pkey PRIMARY KEY (id_padre);
 K   ALTER TABLE ONLY escuela.padre_familia DROP CONSTRAINT padre_familia_pkey;
       escuela            emilio    false    227            �           2606    16647    paralelos paralelos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY escuela.paralelos
    ADD CONSTRAINT paralelos_pkey PRIMARY KEY (id_paralelo);
 C   ALTER TABLE ONLY escuela.paralelos DROP CONSTRAINT paralelos_pkey;
       escuela            emilio    false    216            �           2606    16649 (   periodos_lectivos periodos_lectivos_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY escuela.periodos_lectivos
    ADD CONSTRAINT periodos_lectivos_pkey PRIMARY KEY (id_periodo);
 S   ALTER TABLE ONLY escuela.periodos_lectivos DROP CONSTRAINT periodos_lectivos_pkey;
       escuela            emilio    false    218            �           2606    17444    profesores profesores_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY escuela.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id_profesor);
 E   ALTER TABLE ONLY escuela.profesores DROP CONSTRAINT profesores_pkey;
       escuela            emilio    false    237            �           2606    17437     representante representante_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY escuela.representante
    ADD CONSTRAINT representante_pkey PRIMARY KEY (id_representante);
 K   ALTER TABLE ONLY escuela.representante DROP CONSTRAINT representante_pkey;
       escuela            emilio    false    235            �           2606    16657    usuarios usuarios_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY escuela.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 A   ALTER TABLE ONLY escuela.usuarios DROP CONSTRAINT usuarios_pkey;
       escuela            emilio    false    221            �           2606    16659    usuarios usuarios_username_key 
   CONSTRAINT     ^   ALTER TABLE ONLY escuela.usuarios
    ADD CONSTRAINT usuarios_username_key UNIQUE (username);
 I   ALTER TABLE ONLY escuela.usuarios DROP CONSTRAINT usuarios_username_key;
       escuela            emilio    false    221            �           2606    17139 *   asignaciones asignaciones_id_paralelo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.asignaciones
    ADD CONSTRAINT asignaciones_id_paralelo_fkey FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos(id_paralelo);
 U   ALTER TABLE ONLY escuela.asignaciones DROP CONSTRAINT asignaciones_id_paralelo_fkey;
       escuela          emilio    false    216    225    4757            �           2606    17462 (   asistencia asistencia_id_estudiante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.asistencia
    ADD CONSTRAINT asistencia_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES escuela.estudiantes(id_estudiante);
 S   ALTER TABLE ONLY escuela.asistencia DROP CONSTRAINT asistencia_id_estudiante_fkey;
       escuela          emilio    false    239    231    4773            �           2606    17300 %   estudiantes estudiantes_id_madre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.estudiantes
    ADD CONSTRAINT estudiantes_id_madre_fkey FOREIGN KEY (id_madre) REFERENCES escuela.madre_familia(id_madre);
 P   ALTER TABLE ONLY escuela.estudiantes DROP CONSTRAINT estudiantes_id_madre_fkey;
       escuela          emilio    false    231    4771    229            �           2606    17295 %   estudiantes estudiantes_id_padre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.estudiantes
    ADD CONSTRAINT estudiantes_id_padre_fkey FOREIGN KEY (id_padre) REFERENCES escuela.padre_familia(id_padre);
 P   ALTER TABLE ONLY escuela.estudiantes DROP CONSTRAINT estudiantes_id_padre_fkey;
       escuela          emilio    false    227    231    4769            �           2606    17285 (   estudiantes estudiantes_id_paralelo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.estudiantes
    ADD CONSTRAINT estudiantes_id_paralelo_fkey FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos(id_paralelo);
 S   ALTER TABLE ONLY escuela.estudiantes DROP CONSTRAINT estudiantes_id_paralelo_fkey;
       escuela          emilio    false    231    4757    216            �           2606    17290 '   estudiantes estudiantes_id_periodo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.estudiantes
    ADD CONSTRAINT estudiantes_id_periodo_fkey FOREIGN KEY (id_periodo) REFERENCES escuela.periodos_lectivos(id_periodo);
 R   ALTER TABLE ONLY escuela.estudiantes DROP CONSTRAINT estudiantes_id_periodo_fkey;
       escuela          emilio    false    231    218    4759            �           2606    17339 (   matriculas matriculas_id_estudiante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.matriculas
    ADD CONSTRAINT matriculas_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES escuela.estudiantes(id_estudiante);
 S   ALTER TABLE ONLY escuela.matriculas DROP CONSTRAINT matriculas_id_estudiante_fkey;
       escuela          emilio    false    4773    231    233            �           2606    17349 &   matriculas matriculas_id_paralelo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.matriculas
    ADD CONSTRAINT matriculas_id_paralelo_fkey FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos(id_paralelo);
 Q   ALTER TABLE ONLY escuela.matriculas DROP CONSTRAINT matriculas_id_paralelo_fkey;
       escuela          emilio    false    233    216    4757            �           2606    17344 %   matriculas matriculas_id_periodo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.matriculas
    ADD CONSTRAINT matriculas_id_periodo_fkey FOREIGN KEY (id_periodo) REFERENCES escuela.periodos_lectivos(id_periodo);
 P   ALTER TABLE ONLY escuela.matriculas DROP CONSTRAINT matriculas_id_periodo_fkey;
       escuela          emilio    false    218    233    4759            �           2606    17450 &   profesores profesores_id_paralelo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.profesores
    ADD CONSTRAINT profesores_id_paralelo_fkey FOREIGN KEY (id_paralelo) REFERENCES escuela.paralelos(id_paralelo);
 Q   ALTER TABLE ONLY escuela.profesores DROP CONSTRAINT profesores_id_paralelo_fkey;
       escuela          emilio    false    216    237    4757            �           2606    17445 %   profesores profesores_id_periodo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY escuela.profesores
    ADD CONSTRAINT profesores_id_periodo_fkey FOREIGN KEY (id_periodo) REFERENCES escuela.periodos_lectivos(id_periodo);
 P   ALTER TABLE ONLY escuela.profesores DROP CONSTRAINT profesores_id_periodo_fkey;
       escuela          emilio    false    4759    218    237            Q   +   x�3�4�42�24�4�F��FF\�Ɯ`ڄ�$���� ���      _   %   x�3�4�4202�54�52�,(J-N�+I����� [��      W   �  x�m�Mn�0���S� �AR��RҴ���	�U6�qhФCI��t�s�bZ�l'��E~��<� ���iV	�~�V��4|��xPB�&RN���^�"l�����M��[����8��v:<��Fow��t�٭A)�	��8XR%�4ˋR��w����>���?A�B*��CK��D�(�ggZ��_�:�}���TX��Tʝ5{Z�x��r)x�y��]v�C�?��g �8�A�"�E��%YZ㨾��Qy�CN�Rm�X�L��7|�=��)1`o�����b�d����t�b���Q_9)���9J�j����/�q+�C�i�R#'�b�F�+OIno��U���l�H'4���N���Q
�]��Ѕ31Iܤ�����5Q�6��֓�:x^�ֻc�����~���3�s=a!��DH�6�>`L]��1z�q8�VN��V�K56��w���Sz���̙T'���5�����Ic��hP?�z�K��x�h;^��=��%]�������0ԃ[�5R �T������QJB/��W2ڎ���> ����1����IE��O�/�rA7Q."C
F�GB����o:�f�iK�_k;dLƌU�'�I�}�q9R2�o�0f�Sk��$S�T����,�%�8R��)c�*�n,      U   �  x���Kn�0���)x�"��UM�)\t��D�*(Ѡd��m�̢���J=�Ȧk���|3�?AJVz�rF�\�Q��YH*(�@)�A�eiG�౽�������A�U��"[4?�����H��ޖ^�����]���Ӏ:��Qa=�z*����tC�*����4��4`t�4/u�jrw|�Ȣ{���Ђ��"�V8f���v�~��66��$�c-7@��>6H�=Ю��h�\U���	��ǃ���N����1������v��u	�Ӫ{�Wc���8I>� �����K�;�m]ڳ� 3������dSZ��m��� �eMvsM��Ԃ�Vx&��Gh�<��bGg�&�%a�L6~b$��"]�&�k�br���Z���Pof�t�|���BR�:��`�+w�;F�Mv9�ΘC
�I��̉�[��h�d)���ш�<{q!��]����<�lӄA      Y   F   x�5���0��QLd�`���_G�:�V���:�d"��+�h�}�eᥕf���ѯ[�0�&�{D��      S   �  x���M��0���S��@�n(�毜̔���F���&�M�9�\,�&Ί2������c�K�����i4	X����"{�FBi]u�Mb��1T�Vkc���+������{Ն����u1������Q{���ǩ=<neE���9�~��(���d��H��OI�HZ�Mm�*T����6�8��a$��
����z�hAM�
��vgW�#�Zl���*\��qOA��qki��!�R�s�k��}��^�ȝ�_�͂ �6w��"�Y�n ����U��rL_'��=!�p�s�����h1]�-G�罖�Q_,.�z��Ì�։� nO�G�
�	��!�0��5�j�f�{��N�i�=��8.��S�0�8�MDC�F����P��Yp���������]_�|G�-�)���b"7N��a�4:#��r�]w^$�j[��ᰙO㬻��ֈ����h\Lsd�DW{a�?zg�D4��'W{y�f��_���8      H      x�32����L�L�Q��22Fp<�b���� ��%      J   K   x�34�H-��O�W0202�&�`�����!�i�k`�kl�eh������В�20�5)5jj4����� �0�      ]   8   x�����I��S�/NN,Rp/M-*J-��44����&�)�d��(@Ec���� �L�      [   �  x����n�0�ׇ��P0�]�T�%i�V]es<�'#Ì�y�.��b5�+�f���;�~`pk*��G�
!�I�1w�xE��Eg�hS�(�@�U�)���*���F؅�D,E�hCB�H���^��f�W�y޾[G�_aMfh�i]r��<
3�Z�ӒoZ�����>a����Ҵ���Z�Z	k�L�����nkXҁ�qn�ot{�����Z�z!ܢ-���Z��n#�빰E:�6n�B>7KsX:�b��t~yD0�\	}���
m�$������N(	Tä�9���g=��/�[���<:@4r~lߛNUH8��l�B���1!�����C�9�U�
��|��w3x��A�#��_��v7�.bZWr����#i񩴐����{����Hs�%֥=җ��i<�/���l��Vj�cKGؓY�IF��Q ������v��_�(��_����1v������rS=E����X�"v�TJ�˦8�����/��y� �ݚL      M   W   x�34���t��L72�T1�T14P���
r,�Ȫ�6s7����(*�/.,5*�wN�	�*)���
��u�*��,(�1+������ �[L     