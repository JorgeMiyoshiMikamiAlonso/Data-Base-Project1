CREATE
DATABASE "idiomas_2021"
WITH ENCODING 'UTF-8';
\c idiomas_2021 ;

CREATE SEQUENCE idioma_id_seq 
START 1
INCREMENT 1;

CREATE TABLE idioma (
		idioma_id INTEGER DEFAULT nextvalue(idioma_id_seq) PRIMARY KEY NOT NULL,
		nombre INTEGER NOT NULL,
		nivel INTEGER NOT NULL,
 );

CREATE SEQUENCE puesto_id_seq
START 1
INCREMENT 1;

CREATE TABLE puesto (
		puesto_id INTEGER DEFAULT nextvalue(puesto_id_seq) PRIMARY KEY NOT NULL,
		clave INTEGER NOT NULL,
		sueldo_mensual INTEGER NOT NULL,
		nombre INTEGER NOT NULL,
 );

CREATE SEQUENCE estado_id_seq 
START 1
INCREMENT 1;

CREATE TABLE estado (
		estado_id INTEGER DEFAULT nextvalue(estado_id_seq) PRIMARY KEY NOT NULL,
		estado INTEGER NOT NULL,
 );

CREATE SEQUENCE municipio_id_seq
START 1
INCREMENT 1;

CREATE TABLE municipio (
		municipio_id INTEGER DEFAULT nextvalue(municipio_id_seq) PRIMARY KEY NOT NULL,
		municipio INTEGER NOT NULL,
		estado_id INTEGER REFERENCES estado(estado_id) NOT NULL,
 );

CREATE SEQUENCE colonia_id_seq
START 1
INCREMENT 1;

CREATE TABLE colonia (
		colonia_id INTEGER DEFAULT nextvalue(colonia_id_seq) PRIMARY KEY NOT NULL,
		municipio_id INTEGER REFERENCES municipio(municipio_id) NOT NULL,
		colonia INTEGER NOT NULL,
 ); 

CREATE SEQUENCE puesto_id_seq
START 1
INCREMENT 1;

CREATE TABLE puesto (
		puesto INTEGER DEFAULT nextvalue(puesto_id_seq) PRIMARY KEY NOT NULL,
		clave INTEGER NOT NULL CHECK (clave>0),
		sueldo_mensual INTEGER NOT NULL CHECK (sueldo>-1),
		nombre INTEGER NOT NULL,
 );

CREATE SEQUENCE empleado_id_seq 
START 1
INCREMENT 1;

CREATE TABLE empleado (
		empleado_id INTEGER DEFAULT nextvalue(empleado_id_seq) PRIMARY KEY NOT NULL,
		rfc VARCHAR (15) NOT NULL UNIQUE,
		nombre INTEGER NOT NULL,
		apellidos INTEGER NOT NULL,
		numero_celula VARCHAR (30) NULL UNIQUE,
 );

CREATE TABLE historico_puesto_empleado (
		empleado_id INTEGER REFERENCES empleado(empleado_id) NOT NULL,
		puesto_id INTEGER REFERENCES puesto(puesto_id) NOT NULL,
		fecha_asignación DATE NOT NULL UNIQUE,
 );


CREATE SEQUENCE escuela_id_seq 
START 1
INCREMENT 1;

CREATE SEQUENCE curso_id_seq 
START 1
INCREMENT 1;

CREATE TABLE escuela (
		escuela_id INTEGER DEFAULT nextval(escuela_id_seq) PRIMARY KEY NOT NULL,
		clave INTEGER REFERENCES puesto(clave) NOT NULL UNIQUE,
		colonia_id INTEGER REFERENCES colonia(colonia_id) NOT NULL,
		calle INTEGER NOT NULL,
		numero char (1000) NOT NULL,
		codigo_postal varchar (1000) NOT NULL,
 );

CREATE TABLE  curso (
		curso_id INTEGER DEFAULT nextval(curso_id_seq) PRIMARY KEY NOT NULL,
		escuela_id INTEGER REFERENCES escuela(escuela_id) NOT NULL,
		empleado_id INTEGER REFERENCES empleado(empleado_id) NOT NULL,
		idioma_id INTEGER REFERENCES idioma(idioma_id) NULL,
		fecha_inicio DATE NOT NULL,
		fecha_fin DATE NOT NULL,
		cupo_maximo INTEGER NOT NULL,
		hora_inicio TIMESTAMP NOT NULL,
		hora_fin TIMESTAMP NOT NULL,
 );

CREATE SEQUENCE alumno_id_seq 
START 1
INCREMENT 1;

CREATE TABLE alumno(
		alumno_id INTEGER DEFAULT nextval(alumno_id_seq) NOT NULL PRIMARY KEY,
		nombres INTEGER NOT NULL,
		apellidos INTEGER NOT NULL,
		fecha_nacimiento INTEGER NOT NULL,
		escolaridad INTEGER NOT NULL,
 );

CREATE SEQUENCE inscripcion_id_seq 
START 1
INCREMENT 1;

CREATE TABLE inscripciones (
		inscripciones_id INTEGER DEFAULT nextval(inscripciones_id_seq) NOT NULL PRIMARY KEY,
		alumno_id INTEGER REFERENCES alumno(alumno_id) NOT NULL,
		curso_id INTEGER REFERENCES curso(curso_id) NOT NULL,
		calificación VARCHAR (100) NULL,
 );
