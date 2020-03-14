create database
if not exists Companhia_aerea;
USE Companhia_aerea;

CREATE TABLE aeroporto(
	Codigo_aeroporto int primary key,
    Cidade varchar(256) not null,
    Estado varchar(2) not null,
    Nome varchar(256) not null
);

create table voo(
	numero int primary key,
    companhia_aerea varchar(256) not null,
    dias_da_semana varchar(256) not null
);

create table trecho_voo(
	trecho_num int primary key,
    aeroporto_partida int not null,
    aeroporto_chegada int not null,
    horario_partida_previsto time,
    horario_chegada_previsto time,
    voo int not null,
    
    constraint trecho_voo_aeroporto_partida_fk
	foreign key (aeropoto_partida)
	references aeroporto (codigo_aeroporto),
    
    constraint trecho_voo_aeroporto_chegada_fk
	foreign key (aeroporto_chegada)
	references aeroporto(codigo_aeroporto),
    
    constraint trecho_voo_fk
	foreign key (voo)
	references voo(numero)
);

create table tarifa(
	codigo int primary key,
    quantidade int not null,
    restricoes varchar(255),
    voo int not null,
    
    constraint tarifa_voo_fk
    foreign key (voo)
    references voo(numero)
);

create table tipo_aeronave(
	tipo_nome varchar(256) primary key,
    empresa varchar(512) not null,
    qtd_max_assentos int
);

create table pode_pousar(
	aeroporto int not null,
    tipo_aeronave varchar(255) not null,
    
    constraint pode_pousar_aeroporto_fk
	foreign key (aeroporto)
	references aeroporto(codigo_aeroporto),
    
    constraint pode_pousar_tipo_aeronave_fk
	foreign key (tipo_aeroave)
	references tipo_aeronave(tipo_nome)
);

create table aeronave(
	cod_aeronave int primary key,
    numero_total_assentos int not null,
    tipo_aeronave varchar (256) not null,
    
    constraint aeronave_tipo_aeronave_fk
	foreign key (tipo_aeronave)
	references tipo_aeronave(tipo_nome)
);

create table instancia_trecho(
	data DATE primary key,
    numero_assentos_disponiveis int not null,
    trecho_num int not null,
    partida int not null,
    chegada int not null,
    hora_chegada time,
    hora_partida time,
    cod_aeronave int,
    
    constraint instancia_trecho_partida_fk
	foreign key (partida)
	references aeroporto(codigo_aeroporto),
    
    constraint instancia_trecho_chegada_fk
	foreign key (chegada)
	references aeroporto(codigo_aeroporto),
    
    constraint instancia_trecho_cod_aeronave_fk
	foreign key (cod_aeronave)
	references aeronave(cod_aeronave)
    
);

create table assento_reserva(
	numero_assento int primary key,
    nome_cliente varchar(256) not null,
    cliente_tel varchar (16),
    instancia_trecho_data date not null,
    
    constraint assento_reserva_instancia_trecho_data_fk
    foreign key (instancia_trecho_data)
    references instacia_trecho(data)
);
