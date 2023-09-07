--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      Usuario
-- Project :      Tarea8.DM1
-- Author :       Usuario
--
-- Date Created : Monday, September 12, 2022 04:07:58
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: DEPARTAMENTOS 
--

CREATE TABLE DEPARTAMENTOS(
    ID_DEPARTAMENTO        NUMBER(10, 0)    NOT NULL,
    ID_PAIS                NUMBER(10, 0)    NOT NULL,
    CODIGO_DEPARTAMENTO    VARCHAR2(10)     NOT NULL,
    NOMBRE_DEPARTAMENTO    VARCHAR2(50)     NOT NULL,
    ABREVIATURA            VARCHAR2(10),
    USUARIO_CREACION       VARCHAR2(50)     DEFAULT USER NOT NULL,
    FECHA_CREACION         DATE             DEFAULT  NULL,
    USUARIO_EDICION        VARCHAR2(50),
    FECHA_EDICION          DATE,
    CONSTRAINT PK3 PRIMARY KEY (ID_DEPARTAMENTO)
)
;



-- 
-- TABLE: MUNICIPIOS 
--

CREATE TABLE MUNICIPIOS(
    ID_MUNICIPIO        NUMBER(10, 0)    NOT NULL,
    ID_DEPARTAMENTO     NUMBER(10, 0)    NOT NULL,
    CODIGO_MUNICIPIO    VARCHAR2(10),
    NOMBRE_MUNICIPIO    VARCHAR2(50)     NOT NULL,
    ABREVIATURA         VARCHAR2(10),
    USUARIO_CREACION    VARCHAR2(50)     DEFAULT USER NOT NULL,
    FECHA_CREACION      DATE             DEFAULT  NULL,
    USUARIO_EDICION     VARCHAR2(50),
    FECHA_EDICION       DATE,
    CONSTRAINT PK1 PRIMARY KEY (ID_MUNICIPIO)
)
;



-- 
-- TABLE: PAISES 
--

CREATE TABLE PAISES(
    ID_PAIS             NUMBER    NOT NULL,
    CODIGO              NUMBER    NOT NULL,
    NOMBRE_PAIS         VARCHAR2(25)     NOT NULL,
    ABREVIATURA         VARCHAR2(10),
    USUARIO_CREACION    VARCHAR2(50)     DEFAULT USER NOT NULL,
    FECHA_CREACION      DATE             DEFAULT   NULL,
    USUARIO_EDICION     VARCHAR2(50),
    FECHA_EDICION       DATE,
    CONSTRAINT PK2 PRIMARY KEY (ID_PAIS)
)
;




-- 
-- TABLE: PERSONAS 
--

CREATE TABLE PERSONAS(
    DPI                 NUMBER(30, 0)    NOT NULL,
    ID_MUNICIPIO        NUMBER(10, 0)    NOT NULL,
    NOMBRES             VARCHAR2(100)    NOT NULL,
    APELLIDOS           VARCHAR2(100)    NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL,
    NIT                 VARCHAR2(50),
    DIRECCION           VARCHAR2(50),
    TELEFONO_MOVIL      VARCHAR2(20),
    TELEFONO_FIJO       VARCHAR2(20),
    GENERO              VARCHAR2(15)     NOT NULL,
    USUARIO_CREACION    VARCHAR2(50)     DEFAULT USER NOT NULL,
    FECHA_CREACION      DATE             DEFAULT  NULL,
    USUARIO_EDICION     VARCHAR2(50),
    FECHA_EDICION       DATE,
    CONSTRAINT PK4 PRIMARY KEY (DPI)
)
;



-- 
-- TABLE: DEPARTAMENTOS 
--

ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT RefPAISES3 
    FOREIGN KEY (ID_PAIS)
    REFERENCES PAISES(ID_PAIS)
;


-- 
-- TABLE: MUNICIPIOS 
--

ALTER TABLE MUNICIPIOS ADD CONSTRAINT RefDEPARTAMENTOS2 
    FOREIGN KEY (ID_DEPARTAMENTO)
    REFERENCES DEPARTAMENTOS(ID_DEPARTAMENTO)
;


-- 
-- TABLE: PERSONAS 
--

ALTER TABLE PERSONAS ADD CONSTRAINT RefMUNICIPIOS1 
    FOREIGN KEY (ID_MUNICIPIO)
    REFERENCES MUNICIPIOS(ID_MUNICIPIO)
;

SELECT * FROM PAISES;

SELECT * FROM DEPARTAMENTOS;

SELECT * FROM MUNICIPIOS;

SELECT * FROM PERSONAS;

SELECT * FROM PERSONAS WHERE ID_MUNICIPIO=1;

SELECT PERSONAS.*, MUNICIPIOS.NOMBRE_MUNICIPIO, MUNICIPIOS.CODIGO_MUNICIPIO FROM MUNICIPIOS INNER JOIN PERSONAS ON PERSONAS.ID_MUNICIPIO = MUNICIPIOS.ID_MUNICIPIO;

SELECT PERSONAS.*, DEPARTAMENTOS.CODIGO_DEPARTAMENTO, DEPARTAMENTOS.NOMBRE_DEPARTAMENTO FROM DEPARTAMENTOS INNER JOIN PERSONAS ON PERSONAS.ID_MUNICIPIO = DEPARTAMENTOS.ID_DEPARTAMENTO;

--
--PAISES
--
INSERT  INTO PAISES(ID_PAIS,  NOMBRE_PAIS,  ABREVIATURA) VALUES(502,'GUATEMALA','GUA');

UPDATE PAISES SET ABREVIATURA= 'GUA', USUARIO_CREACION= USER, FECHA_CREACION= SYSDATE WHERE NOMBRE_PAIS = 'GUATEMALA';

DELETE FROM PAISES WHERE   ABREVIATURA   = 'HON';


--
--DEPARTAMENTOS
--

INSERT  INTO DEPARTAMENTOS(ID_DEPARTAMENTO, ID_PAIS,  CODIGO_DEPARTAMENTO, NOMBRE_DEPARTAMENTO, ABREVIATURA, USUARIO_CREACION, FECHA_CREACION, USUARIO_EDICION, FECHA_EDICION) VALUES(5, 1, '06', 'JUTIAPA','JUT', 'CARLOS', '15/09/2022', 'CARLOS', '15/09/2022');

UPDATE DEPARTAMENTOS SET NOMBRE_DEPARTAMENTO='PETAN', USUARIO_EDICION= USER, FECHA_EDICION= SYSDATE WHERE ABREVIATURA= 'PTN';

DELETE FROM DEPARTAMENTOS WHERE   NOMBRE_DEPARTAMENTO='PETAN';

--
--MUNICIPIO
--
INSERT  INTO MUNICIPIOS(ID_MUNICIPIO, ID_DEPARTAMENTO, CODIGO_MUNICIPIO, NOMBRE_MUNICIPIO, ABREVIATURA, USUARIO_CREACION, FECHA_CREACION, USUARIO_EDICION, FECHA_EDICION) VALUES(1, 1, '17', 'SAN MIGUEL PETAPA','SMP', 'CARLOS', '15/09/2022', 'CARLOS', '15/09/2022');

UPDATE MUNICIPIOS SET ABREVIATURA= 'VAL', USUARIO_EDICION= USER, FECHA_EDICION= SYSDATE WHERE NOMBRE_MUNICIPIO = 'VILLA CANALES';

DELETE FROM MUNICIPIOS WHERE ABREVIATURA= 'VAL';

--
--PERSONAS
--
INSERT  INTO PERSONAS(DPI, ID_MUNICIPIO, NOMBRES, APELLIDOS, FECHA_NACIMIENTO, NIT, DIRECCION, TELEFONO_MOVIL, TELEFONO_FIJO, GENERO, USUARIO_CREACION, FECHA_CREACION, USUARIO_EDICION, FECHA_EDICION) VALUES(5464897872201, 1, 'ISABEL', 'GARCIA','02/10/2006', '114578576-7', 'Guatemala, San Miguel Petapa', '4578956', '74785697', 'FEMENINO', 'CARLOS', '14/08/2022', 'CARLOS', '14/08/2022');

UPDATE PERSONAS SET NOMBRES='KENIA', NIT= '10820330-1', DIRECCION= 'Guatemala, San Miguel Petapa', TELEFONO_MOVIL= '47209059', TELEFONO_FIJO='78434666', USUARIO_EDICION= USER, FECHA_EDICION= SYSDATE WHERE DPI=5464897872201;

DELETE FROM PERSONAS WHERE DPI= 6457948572206;