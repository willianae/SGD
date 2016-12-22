
CREATE TABLE TIPO_CLIENTE(
CODIGO BIGSERIAL NOT NULL PRIMARY KEY,
DESCRICAO VARCHAR(30)
);
INSERT INTO TIPO_CLIENTE(DESCRICAO) VALUES('VENDEDOR');
INSERT INTO TIPO_CLIENTE(DESCRICAO) VALUES('COMPRADOR');
INSERT INTO TIPO_CLIENTE(DESCRICAO) VALUES('AMBOS');

ALTER TABLE CLIENTE ADD COD_TIPO_CLIENTE INTEGER NOT NULL DEFAULT 1;

alter table cliente
add constraint fk_tipo_cliente foreign key  (cod_tipo_cliente) references tipo_cliente(codigo);

alter table veiculo
add cod_comprador integer;

alter table veiculo
add constraint fk_comprador_veiculo foreign key  (cod_comprador) references cliente(codigo);

alter table veiculo
add numero_convocacao integer;

alter table veiculo
add data_convocacao date;

alter table veiculo
add cod_seguradora integer;

alter table veiculo
add constraint fk_seguradora_veiculo foreign key  (cod_seguradora) references seguradora(codigo);


CREATE UNIQUE INDEX usuario_idx ON usuario(codigo);
CREATE UNIQUE INDEX categoria_idx ON categoria(codigo);
CREATE UNIQUE INDEX cliente_idx ON cliente(codigo);
CREATE UNIQUE INDEX cliente_cpfcnpj ON cliente(cpf_cnpj);
CREATE UNIQUE INDEX marcamodelo_idx ON marca_modelo(codigo);
CREATE UNIQUE INDEX cor_idx ON cor(codigo);
CREATE UNIQUE INDEX combustivel_idx ON combustivel(codigo);
CREATE UNIQUE INDEX seguradora_idx ON seguradora(codigo);
CREATE UNIQUE INDEX situacao_idx ON situacao(codigo);
CREATE UNIQUE INDEX tipo_idx ON tipo(codigo);
CREATE UNIQUE INDEX tipo_cliente_idx ON tipo_cliente(codigo);


