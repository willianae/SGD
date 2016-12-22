/*CREATE DATABASE rwsoft_despa
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Portuguese_Brazil.1252'
       LC_CTYPE = 'Portuguese_Brazil.1252'
       CONNECTION LIMIT = -1;
*/	  

-- COMO USAR O CHECK
--check(situacao = 'A' OR situacao = 'E' OR situacao = 'C' OR situacao = 'F'),

CREATE TABLE usuario
(
  codigo bigserial NOT NULL,
  nome varchar(60) NOT NULL,
  "login" varchar(20) NOT NULL,
  senha varchar(20) NOT NULL,
  nivel integer DEFAULT 0,
  PRIMARY KEY (codigo)
);

CREATE TABLE categoria(
codigo bigserial not null,
descricao varchar(50) not null,
primary key(codigo));

CREATE TABLE combustivel(
codigo bigserial not null,
descricao varchar(50) not null,
primary key(codigo));

CREATE TABLE cor(
codigo bigserial not null,
descricao varchar(50) not null,
primary key(codigo));

CREATE TABLE marca_modelo(
codigo bigserial not null,
descricao varchar(50) not null,
primary key(codigo));

CREATE TABLE tipo(
codigo bigserial not null,
descricao varchar(50) not null,
primary key(codigo));

-- 'A - AGUARDANDO, E-EM PROCESSO, C-CANCELADO, F-FINALIZADO' CADASTRADO PELO USUÁRIO
CREATE TABLE situacao( 
codigo bigserial not null,
descricao varchar(50) not null,
color varchar(25) default 'clWhite',
primary key(codigo));

CREATE TABLE tipo_servico(
codigo bigserial not null,
descricao varchar(50) not null,
taxa_detran numeric(18,2) default 0,
primary key(codigo));

CREATE TABLE processo(
codigo bigserial not null,
descricao varchar(50) not null,
primary key(codigo));

create table cliente(
CODIGO BIGSERIAL NOT NULL,
NOME VARCHAR(80) not null ,
CPF_CNPJ VARCHAR ( 16)not null ,
CNH VARCHAR(20) ,
RG VARCHAR(20) ,
LOGRADOURO VARCHAR(80) ,
NUMERO VARCHAR(10) ,
CIDADE VARCHAR(80) ,
BAIRRO VARCHAR(80) ,
UF VARCHAR(2) ,
CEP VARCHAR(10) ,
TELEFONE_FIXO VARCHAR(11),
TELEFONE_CELULAR VARCHAR(11), 
EMAIL VARCHAR(80),
primary key (CODIGO));


create table veiculo(
codigo bigserial not null,
uf varchar(2),
numero varchar(30),
renavam varchar(20),
placa varchar(15),
chassi varchar(17),
ano_fabricacao integer,
ano_modelo integer,
motor varchar(30),
observacoes varchar(250),
numero_sinistro varchar(40),
DATA_EMISSAO_CRV DATE,
DATA_RECEBIMENTO DATE,
FLG_POSSUI_SINISTRO CHAR(1),
FLG_RECEBEU_CSV CHAR(1),
NOME_COMPRADOR VARCHAR(80),
FLG_IMPRIMIU_CSV CHAR(1) DEFAULT 'N',
cod_cliente integer,
cod_tipo integer,
cod_marca_modelo integer,
cod_combustivel integer,
cod_categoria integer,
cod_cor integer,
cod_processo integer,
cod_usuario integer,
primary key(codigo),
foreign key (cod_cliente) references cliente(codigo), 
foreign key (cod_tipo) references tipo(codigo), 
foreign key (cod_marca_modelo) references marca_modelo(codigo), 
foreign key (cod_combustivel) references combustivel(codigo), 
foreign key (cod_categoria) references categoria(codigo), 
foreign key (cod_cor) references cor(codigo),
foreign key (cod_processo) references processo(codigo),
foreign key (cod_usuario) references usuario(codigo)
);

create table servicos(
codigo bigserial not null,
cod_veiculo integer not null,
cod_tipo_servico integer not null,
cod_usuario integer,
cod_situacao integer not null,
cod_cliente integer not null,
valor numeric(18,2) default 0,
senha varchar(20),
primary key(codigo),
foreign key(cod_veiculo) references veiculo(codigo),
foreign key(cod_tipo_servico) references tipo_servico(codigo),
foreign key(cod_usuario) references usuario(codigo),
foreign key(cod_situacao) references situacao(codigo),
foreign key(cod_cliente) references cliente(codigo)
);

CREATE TABLE servicos_veiculo_web
(
  codigo bigserial NOT NULL,
  placa varchar(15),
  uf varchar(2),
  servico varchar(50),
  situacao varchar(50),
  cod_servico integer,
  senha varchar(20),
  data_expiracao date,
  PRIMARY KEY (codigo)
);


CREATE TABLE empresa
(
CODIGO INTEGER,
razao_social varchar(80),
nome varchar(80),
naturalidade varchar(80),
pai varchar (80),
mae varchar(80),
dataNascimento date,
logradouro varchar(80),
numero varchar(10),
bairro varchar(80),
cidade varchar(80),
rg varchar(20),
cidade_emp varchar(80),
uf_emp varchar(2),
profissao varchar(50),
LOGO VARCHAR(255),
UF VARCHAR(2),
TELEFONE_CELULAR VARCHAR(15),
TELEFONE_FIXO VARCHAR(15)
);


CREATE  TABLE HISTORICO_PROCESSO(
codigo bigserial not null,
COD_VEICULO INTEGER NOT NULL,
COD_CLIENTE INTEGER NOT NULL,
COD_PROCESSO_ANTIGO INTEGER NOT NULL,
COD_PROCESSO_ATUAL INTEGER NOT NULL,
COD_USUARIO INTEGER NOT NULL,
DATA_MUDANCA DATE NOT NULL DEFAULT CURRENT_DATE,
primary key(codigo),
foreign key(COD_PROCESSO_ANTIGO) references processo(codigo),
foreign key(COD_PROCESSO_ATUAL) references processo(codigo),
foreign key(COD_VEICULO) references VEICULO(codigo ),
foreign key(COD_CLIENTE) references CLIENTE(codigo ),
foreign key(COD_USUARIO) references USUARIO(codigo )
);


-- TRIGGER E FUNÇÃO QUE JA INSERE NA HISTORICO_PROCESSO

create OR REPLACE function fnc_auditoria_processo() RETURNS trigger AS $fnc_auditoria_processo$
BEGIN
  IF OLD.COD_PROCESSO <> NEW.COD_PROCESSO THEN
    INSERT INTO HISTORICO_PROCESSO(COD_VEICULO, COD_CLIENTE, COD_PROCESSO_ANTIGO, COD_PROCESSO_ATUAL, COD_USUARIO, DATA_MUDANCA)
    VALUES(OLD.CODIGO, OLD.COD_CLIENTE, OLD.COD_PROCESSO, NEW.COD_PROCESSO, OLD.COD_USUARIO, CURRENT_DATE);
  END IF;

  RETURN NEW; 
END;
$fnc_auditoria_processo$ LANGUAGE plpgsql;

CREATE TRIGGER fnc_auditoria_processo BEFORE UPDATE ON veiculo
  FOR EACH ROW EXECUTE PROCEDURE fnc_auditoria_processo();

CREATE TABLE 
SEGURADORA
(CODIGO bigserial NOT NULL,
CODIGO_SUSEP VARCHAR(20),
DESCRICAO VARCHAR(60)NOT NULL,
PRIMARY KEY(CODIGO)
);

create table convocacao(
codigo bigserial  not null,
numero  INTEGER NOT NULL,
ano  INTEGER NOT NULL,
cod_seguradora INTEGER NOT NULL,
cod_veiculo INTEGER NOT NULL,
sn_ipva varchar(1) not null default 'N',
sn_restricao VARCHAR(1) NOT NULL DEFAULT 'N',
valor float NOT NULL,
data_geracao date not null default current_date,
COD_USUARIO INTEGER NOT NULL,	
primary key(codigo),
foreign key (cod_veiculo) references veiculo(codigo),
foreign key (cod_seguradora) references seguradora(codigo)
);

create table parametros(
codigo integer not null,
descricao varchar(30) not null,
valor float not null default 0);

insert into parametros values ( 1,'COM RESTRICAO',1150);
insert into parametros values ( 2,'SEM RESTRICAO',950);

  
---------------------------------------------------------------

INSERT INTO EMPRESA
(CODIGO,razao_social,NOME,NATURALIDADE, PAI,MAE,DATANASCIMENTO,LOGRADOURO,NUMERO,BAIRRO,CIDADE,RG,CIDADE_EMP,UF_EMP)
VALUES
(1,'CARLOS DUTRA','CARLOS HENRIQUE DUTRA BARBOSA','SURUBIM-PE','SEVERINO HENRIQUE BARBOSA','NAUZA DUTRA BARBOSA','08/03/1957','AV. PROFESSOR JOAQUIM CAVALCANTI','580','IPUTINGA','RECIFE','1.321.934-PE','RECIFE','PE');
