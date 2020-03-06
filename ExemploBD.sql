use empresa;
SET FOREIGN_KEY_CHECKS=0;
drop table if exists departamento;
CREATE TABLE departamento (
    dnome varchar(255) NOT NULL,
    dnumero integer NOT NULL,
    gerssn integer,
    gerdatainicio date,
    CONSTRAINT departamento_dnumero_check CHECK ((dnumero > 0))
);

drop table if exists dependente;
CREATE TABLE dependente (
    essn integer NOT NULL,
    nome_dependente varchar(255) NOT NULL,
    sexo character(1),
    datanasc date,
    parentesco varchar(255),
    CONSTRAINT dependente_sexo_check CHECK (sexo = 'F' or sexo = 'M')
);

drop table if exists depto_localizacoes;
CREATE TABLE depto_localizacoes (
    dnumero integer NOT NULL,
    dlocalizacao varchar(255) NOT NULL
);

drop table if exists empregado;
CREATE TABLE empregado (
    pnome varchar(255) NOT NULL,
    minicial character(1),
    unome varchar(255) NOT NULL,
    ssn integer NOT NULL,
    datanasc date,
    endereco varchar(255),
    sexo character(2),
    salario numeric NOT NULL,
    superssn integer,
    dno integer,
    CONSTRAINT empregado_dno_check CHECK ((dno > 0)),
    CONSTRAINT empregado_salario_check CHECK ((salario > 0)),
    CONSTRAINT empregado_sexo_check CHECK (sexo = 'F' or sexo = 'M')
);
drop table if exists projeto;
CREATE TABLE projeto (
    pjnome varchar(255),
    pnumero integer NOT NULL,
    plocalizacao varchar(255),
    dnum integer
);
drop table if exists trabalha_em;
CREATE TABLE trabalha_em (
    essn integer NOT NULL,
    pno integer NOT NULL,
    horas real
);


ALTER TABLE  departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (dnumero);

ALTER TABLE dependente
    ADD CONSTRAINT dependente_pkey PRIMARY KEY (essn, nome_dependente);

ALTER TABLE  depto_localizacoes
    ADD CONSTRAINT depto_localizacoes_pkey PRIMARY KEY (dnumero, dlocalizacao);

ALTER TABLE  empregado
    ADD CONSTRAINT empregado_pkey PRIMARY KEY (ssn);

ALTER TABLE  projeto
    ADD CONSTRAINT projeto_pkey PRIMARY KEY (pnumero);

ALTER TABLE  trabalha_em
    ADD CONSTRAINT trabalha_em_pkey PRIMARY KEY (essn, pno);

ALTER TABLE  departamento
    ADD CONSTRAINT gerente FOREIGN KEY (gerssn) REFERENCES empregado(ssn);

ALTER TABLE  depto_localizacoes
    ADD CONSTRAINT numerodepartamento FOREIGN KEY (dnumero) REFERENCES departamento(dnumero);

ALTER TABLE  projeto
    ADD CONSTRAINT numerodepartamento_proj FOREIGN KEY (dnum) REFERENCES departamento(dnumero);

ALTER TABLE  empregado
    ADD CONSTRAINT numerodepto FOREIGN KEY (dno) REFERENCES departamento(dnumero);

ALTER TABLE  trabalha_em
    ADD CONSTRAINT numeroprojeto FOREIGN KEY (pno) REFERENCES projeto(pnumero);

ALTER TABLE  dependente
    ADD CONSTRAINT ssnempregado FOREIGN KEY (essn) REFERENCES empregado(ssn);

ALTER TABLE  empregado
    ADD CONSTRAINT supervisor FOREIGN KEY (superssn) REFERENCES empregado(ssn);
SET FOREIGN_KEY_CHECKS=1;
