CREATE DATABASE Aeroporto;
USE AEROPORTO;

SET FOREIGN_KEY_CHECK=0;

DROP TABLE IF EXISTS AEROPORTO;
CREATE TABLE AEROPORTO(
	Codigo_aeroporto INTEGER NOT NULL,
    Cidade VARCHAR(255) NOT NULL,
    Estado VARCHAR(255) NOT NULL,
    Nome VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS TIPO_AERONAVE;
CREATE TABLE TIPO_AERONAVE(
	Empresa VARCHAR(255) NOT NULL,
    Tipo_nome VARCHAR(255) NOT NULL,
    Qtd_max_assentos INTEGER NOT NULL
);

DROP TABLE IF EXISTS AERONAVE;
CREATE TABLE AERONAVE(
	Coid_aeronave INTEGER NOT NULL,
    Numero_total_assentos INTEGER NOT NULL
);

DROP TABLE IF EXISTS ASSENTO;
CREATE TABLE ASSENTO(
	Numero_assento INTEGER NOT NULL
);

DROP TABLE IF EXISTS TRECHO_VOO;
CREATE TABLE TRECHO_VOO(
	recho_num INTEGER NOT NULL
);

DROP TABLE IF EXISTS VOO;
CREATE TABLE VOO(
	Numero INTEGER NOT NULL,
    Companhia_aerea VARCHAR(255) NOT NULL,
    Dias_da_semana VARCHAR(255)
);

DROP TABLE IF EXISTS TARIA;
CREATE TABLE TARIFA(
	Restricoes VARCHAR(255),
    Quantidade INTEGER NOT NULL,
    Codigo INTEGER NOT NULL
);

DROP TABLE IF EXISTS INSTANCIA_TRECHO;
CREATE TABLE INSTANCIA_TRECHO(
	Numero_assentos_disponiveis INTEGER NOT NULL,
    ITData DATE NOT NULL
);

DROP TABLE IF EXISTS PODE_POUSAR;
CREATE TABLE PODE_POUSAR(
	PPCodigo_aeroporto INTEGER NOT NULL,
    PPTipo_nome VARCHAR(255) NOT NULL
);

ALTER TABLE AEROPORTO 
	ADD CONSTRAINT Codigo_aeroporto_PKEY 
		PRIMARY KEY (Codigo_aeroporto);

ALTER TABLE TIPO_AERONAVE 
	ADD CONSTRAINT Tipo_nome_PKEY 
		PRIMARY KEY (Tipo_nome);

ALTER TABLE AERONAVE 
	ADD CONSTRAINT Coid_aeronave_PKEY 
		PRIMARY KEY (Coid_aeronave);

ALTER TABLE ASSENTO 
	ADD CONSTRAINT Numero_assento_PKEY 
		PRIMARY KEY (Numero_assento);

ALTER TABLE TRECHO_VOO 
	ADD CONSTRAINT Trecho_num_PKEY 
		PRIMARY KEY (Trecho_num);

ALTER TABLE VOO 
	ADD CONSTRAINT Numero_PKEY 
		PRIMARY KEY (Numero);

ALTER TABLE TARIFA 
	ADD CONSTRAINT Codigo_PKEY 
		PRIMARY KEY (Codigo);

ALTER TABLE INSTANCIA_TRECHO 
	ADD CONSTRAINT ITData_PKEY 
		PRIMARY KEY (ITData);

ALTER TABLE PODE_POUSAR 
	ADD CONSTRAINT Codigo_aeroporto_FKEY 
		FOREIGN KEY (PPCodigo_aeroporto) 
			REFERENCES AEROPORTO(Codigo_aeroporto);

ALTER TABLE PODE_POUSAR 
	ADD CONSTRAINT Tipo_nome_FKEY
		FOREIGN KEY (PPTipo_nome)
			REFERENCES TIPO_AERONAVE(Tipo_nome);

SET FOREIGN_KEY_CHECK=1;







