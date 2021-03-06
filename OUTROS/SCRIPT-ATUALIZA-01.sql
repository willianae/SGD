﻿ALTER TABLE VEICULO
DROP COLUMN FINAL_PLACA;

ALTER TABLE VEICULO
ADD DATA_EMISSAO_CRV DATE;

ALTER TABLE VEICULO
ADD DATA_RECEBIMENTO DATE;

ALTER TABLE VEICULO
ADD FLG_POSSUI_SINISTRO CHAR(1);

ALTER TABLE VEICULO
ADD FLG_RECEBEU_CSV CHAR(1);

ALTER TABLE VEICULO
ADD NOME_COMPRADOR VARCHAR(80);

ALTER TABLE EMPRESA
ADD LOGO VARCHAR(255);

ALTER TABLE EMPRESA
ADD CODIGO INTEGER;

UPDATE EMPRESA SET CODIGO = 1;

ALTER TABLE VEICULO
ADD FLG_IMPRIMIU_CSV CHAR(1) DEFAULT 'N';

ALTER TABLE EMPRESA
ADD RAZAO_SOCIAL VARCHAR(80);

ALTER TABLE EMPRESA
ADD TELEFONE_FIXO VARCHAR(15);

ALTER TABLE EMPRESA
ADD TELEFONE_CELULAR VARCHAR(15);

ALTER TABLE EMPRESA
ADD UF VARCHAR(2);
