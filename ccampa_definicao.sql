
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS mentorama_ma;

-- Comando que sinaliza ao SGBD qual banco de dados os comandos serão utilizados
USE mentorama_ma;

-- criação das oito tabelas do nosso sistema
CREATE TABLE IF NOT EXISTS mentorama_ma.aluno(
    id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    rg BIGINT NULL,
    cpf BIGINT NULL,
    data_nasc DATE NOT NULL,
    telefone VARCHAR(20) NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS mentorama_ma.funcionario(
    id_funcionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    rg BIGINT NOT NULL,
    cpf BIGINT NOT NULL,
    data_nasc DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    funcao VARCHAR(20) NOT NULL,
    salario DECIMAL (6,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS mentorama_ma.professor(
    id_professor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    modalidade VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE IF NOT EXISTS mentorama_ma.pacote(
    id_pacote INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    valor INT NOT NULL UNIQUE,
    qtde_parcela INT NOT NULL,
    total INT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS mentorama_ma.pagamento(
    id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pacote INT NOT NULL,
    parcela INT NOT NULL,
    valor INT NOT NULL,
    id_aluno INT NOT NULL,
    data_venc DATE NOT NULL,
    data_pag DATE NULL,
    FOREIGN KEY (id_pacote) REFERENCES pacote(id_pacote),
    FOREIGN KEY (valor) REFERENCES pacote(valor),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE IF NOT EXISTS mentorama_ma.jiu_jitsu(
    id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    faixa VARCHAR(20) NOT NULL,
    data_inicio DATE NOT NULL,
    plano CHAR NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE IF NOT EXISTS mentorama_ma.muay_thai(
    id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    faixa VARCHAR(20) NOT NULL,
    data_inicio DATE NOT NULL,
    plano CHAR NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE IF NOT EXISTS mentorama_ma.mma(
    id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    data_inicio DATE NOT NULL,
    plano CHAR NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- inserindo alunos com a utilização do site 'https://www.mockaroo.com/'
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Virgina Landy', null, null, '2005-10-08', '2314116625', '89197 Mallard Junction', 'Qiaochong');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Ally Grevatt', null, null, '2006-07-16', '3668651031', '8523 Roxbury Street', 'Viļāni');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Leelah Whorall', null, null, '2012-03-19', '4343744070', '323 Kensington Circle', 'Tumaco');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Richmound Gouldbourn', null, null, '2007-03-30', '3226913304', '783 Armistice Place', 'Sulmierzyce');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Marice Quiddington', 161126157, 076296380, '1992-11-30', '3277740169', '32507 Pine View Drive', 'Nagu');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Kassia Leworthy', null, null, '2015-05-19', '1994496694', '39 Oak Street', 'Sokolovo');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Kirbie McMillan', 466699617, 219222335, '1993-06-09', '4523399817', '20 Ridgeway Avenue', 'Lyon');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Jasmine Eriksson', 237118764, 835997788, '1978-05-07', '4679530268', '21 Hansons Way', 'Shuangyang');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Savina Emsden', null, null, '2005-06-09', '5184077396', '9 Saint Paul Place', 'Suphan Buri');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Drud Maitland', null, null, '2013-05-05', '6112152003', '60410 Dixon Hill', 'Kŭrdzhali');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Bordie Kos', 886271476, 680003653, '2000-05-01', '5683314942', '3 Loomis Alley', 'Arcos');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Mady Jago', null, null, '2010-06-14', '3008301004', '63 Londonderry Trail', 'Sankeng');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Marrissa Casetta', null, null, '2013-05-17', '1586448606', '9 Bowman Court', 'Soca');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Aggy Loyndon', 506081841, 730463777, '1964-07-29', '8834949382', '5406 Eagan Court', 'Chandmanĭ');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Shannah Griffey', null, null, '2006-09-26', '7532060925', '78452 Lawn Lane', 'Pantano do Sul');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Abramo Oldred', 500421941, 060705329, '1967-04-18', '7761944919', '10710 Manitowish Court', 'Babice');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Clair Roblin', null, null, '2011-02-26', '7153744875', '02272 Nevada Street', 'Kubang');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Martyn Minor', null, null, '2009-07-05', null, '50416 Burrows Terrace', 'Cikajang');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Pernell Abbets', 071515363, 975937878, '1983-08-07', '4677582187', '08180 Vera Circle', 'Outeiro');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Northrup Vequaud', null, null, '2014-05-11', null, '236 Logan Trail', 'Razumnoye');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Eliot Lednor', null, null, '2006-04-17', '2956475298', '059 Heath Hill', 'Baunu-Timbangan');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Patience Serrels', 107244554, 821504532, '1972-10-03', '6846639228', '1844 Tennessee Parkway', 'Trzemeszno');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Jaquenette Catcheside', 385913934, 072888291, '1967-06-29', '9035602056', '3 Ramsey Way', 'Perelhal');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Sayre Trodden', 067973586, 332677469, '1983-04-04', '4472500260', '4 Carioca Park', 'Vitoria-Gasteiz');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Winna Langdridge', null, null, '2004-01-26', '3002057963', '82629 Porter Center', 'Zengtian');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Veronika Heis', 262386221, 155680540, '1988-09-05', '2184396147', '84 Loomis Alley', 'Arcos');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Joelly Magee', 989436550, 749362222, '1992-02-26', '3559831561', '20 Beilfuss Hill', 'Ar Rahad');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Edwin Jeyness', 511516856, 143991924, '1966-06-05', '5164702566', '3757 Vernon Lane', 'Xinkaikou');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Devina Bercevelo', null, null, '2014-08-18', '7707131620', '06270 Dakota Hill', 'Kendayakan');
insert into aluno (nome, rg, cpf, data_nasc, telefone, endereco, cidade) values ('Kariotta Jaegar', 321538334, 414215246, '1970-01-23', '5139179895', '12574 Warbler Lane', 'Santa Rosa');

-- inserindo funcionário utilizando o site 'https://www.mockaroo.com/'
insert into funcionario (nome, rg, cpf, data_nasc, telefone, endereco, cidade, funcao, salario) values ('Edgard Beavington', 013623563, 209350659, '1993-10-22', '3746773029', '479 Scoville Pass', 'Týrnavos', 'Educador Físico', 2494.45);
insert into funcionario (nome, rg, cpf, data_nasc, telefone, endereco, cidade, funcao, salario) values ('Tore McMychem', 120502125, 359354258, '1982-04-01', '3247493356', '89 Menomonie Road', 'Palmar de Varela', 'Educador Físico', 4294.07);
insert into funcionario (nome, rg, cpf, data_nasc, telefone, endereco, cidade, funcao, salario) values ('Cherri Rizzardini', 850275510, 117528004, '1997-04-06', '5487513028', '2598 Bultman Terrace', 'Trzin', 'Manutenção', 2371.17);
insert into funcionario (nome, rg, cpf, data_nasc, telefone, endereco, cidade, funcao, salario) values ('Roxanna Krolman', 622791714, 405643185, '1985-04-30', '8277472537', '71 Mcguire Avenue', 'Petushki', 'Educadora Física', 4134.71);
insert into funcionario (nome, rg, cpf, data_nasc, telefone, endereco, cidade, funcao, salario) values ('Christabel Stutter', 243639501, 646009618, '1998-05-15', '6632407492', '56344 Kipling Terrace', 'Dawei', 'Gerente', 4510.1);
insert into funcionario (nome, rg, cpf, data_nasc, telefone, endereco, cidade, funcao, salario) values ('Marcel Vedekhin', 751022407, 588510486, '1993-07-23', '5796387018', '24 Calypso Avenue', 'Musina', 'Educador Físico', 3891.33);

-- inserindo professores com base na tabela de funcionários
INSERT INTO professor (id_funcionario, modalidade) values (1, 'Jiu Jitsu');
INSERT INTO professor (id_funcionario, modalidade) values (2, 'Jiu Jitsu');
INSERT INTO professor (id_funcionario, modalidade) values (1, 'Muay Thai');
INSERT INTO professor (id_funcionario, modalidade) values (2, 'Muay Thai');
INSERT INTO professor (id_funcionario, modalidade) values (4, 'MMA');
INSERT INTO professor (id_funcionario, modalidade) values (1, 'MMA');
INSERT INTO professor (id_funcionario, modalidade) values (6, 'Muay Thai');
INSERT INTO professor (id_funcionario, modalidade) values (6, 'MMA');

-- inserindo os pacotes de assinatura da academia, as formas de pagamento
INSERT INTO pacote (nome, valor, total) values ('Mensal', 80, 1, 960);
INSERT INTO pacote (nome, valor, total) values ('Semestral', 256, 3, 768);
INSERT INTO pacote (nome, valor, total) values ('Anual', 156, 4, 624);

-- inserindo alunos nas turma de MMA
INSERT INTO mma (id_aluno, categoria, data_inicio, plano, id_professor) VALUES (3, 'Amador', '2021-07-01', 'M', 5);
INSERT INTO mma (id_aluno, categoria, data_inicio, plano, id_professor) VALUES (4, 'Amador', '2020-03-17', 'M', 5);
INSERT INTO mma (id_aluno, categoria, data_inicio, plano, id_professor) VALUES (12, 'Profissional', '2014-02-26', 'A', 8);
INSERT INTO mma (id_aluno, categoria, data_inicio, plano, id_professor) VALUES (14, 'Amador', '2022-05-13', 'S', 6);
INSERT INTO mma (id_aluno, categoria, data_inicio, plano, id_professor) VALUES (18, 'Amador', '2019-10-30', 'A', 6);
INSERT INTO mma (id_aluno, categoria, data_inicio, plano, id_professor) VALUES (20, 'Amador', '2018-03-17', 'M', 5);

-- inserindo alunos nas turmas de jiu jitsu
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (1, 'Branca', '2021-09-18', 'M', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (2, 'Branca', '2020-11-27', 'S', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (5, 'Roxa', '2014-08-11', 'A', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (6, 'Branca', '2022-04-08', 'M', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (7, 'Marrom', '2012-02-15', 'A', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (8, 'Branca', '2021-01-27', 'M', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (9, 'Azul', '2018-05-14', 'S', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (11, 'Preta', '2011-02-01', 'A', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (13, 'Branca', '2020-12-08', 'M', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (15, 'Branca', '2022-07-01', 'M', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (16, 'Roxa', '2015-06-25', 'S', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (19, 'Roxa', '2014-10-29', 'S', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (21, 'Branca', '2022-05-10', 'M', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (22, 'Roxa', '2013-04-18', 'A', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (23, 'Azul', '2018-02-25', 'S', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (25, 'Branca', '2022-06-22', 'M', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (26, 'Preta', '2010-03-24', 'A', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (27, 'Branca', '2019-08-11', 'S', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (28, 'Roxa', '2013-01-15', 'S', 2);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (29, 'Roxa', '2013-01-20', 'S', 1);
INSERT INTO jiu_jitsu (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (30, 'Marrom', '2011-07-29', 'S', 1);

-- inserindo alunos nas turmas de muay thai
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (4, 'Branco', '2022-02-26', 'M', 3);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (12, 'Azul-claro', '2016-11-08', 'S', 3);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (13, 'Branco-Vermelho', '2021-10-13', 'M', 3);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (15, 'Azul-claro/escuro', '2016-05-17', 'S', 7);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (18, 'Preto', '2011-11-09', 'A', 4);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (19, 'Vermelho', '2021-03-19', 'S', 4);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (22, 'Azul-escuro/Preto', '2013-07-02', 'A', 3);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (24, 'Branco', '2022-05-10', 'M', 3);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (25, 'Preto', '2012-12-12', 'S', 3);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (26, 'Branco', '2021-12-26', 'M', 3);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (27, 'Branco', '2022-04-17', 'M', 3);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (28, 'Vermelho/Azul-claro', '2020-09-10', 'M', 7);
INSERT INTO muay_thai (id_aluno, faixa, data_inicio, plano, id_professor) VALUES (29, 'Branco', '2021-11-19', 'M', 3);

-- inserindo pagamento das turma de mma
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 3, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 4, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 2, 156, 12, '2022-06-15', '2022-06-15');
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 14, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 4, 156, 18, '2022-06-10', '2022-06-10');
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 20, '2022-07-10', NULL);

-- inserindo pagamento das turmas de jiu jitsu
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 1, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 1, 256, 2, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 3, 156, 5, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 6, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 4, 156, 7, '2022-05-15', '2022-05-15');
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 8, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 9, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 1, 156, 11, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 13, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 15, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 16, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 19, '2022-05-15', '2022-06-15');
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 21, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 1, 156, 22, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 23, '2022-03-15', '2022-03-15');
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 25, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 3, 156, 26, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 27, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 2, 256, 28, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 29, '2022-04-15', '2022-05-15');
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 30, '2022-04-15', '2022-04-15');

-- inserindo pagamento das turma de muay thai
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 4, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 1, 256, 12, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 13, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 15, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 3, 156, 18, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 1, 256, 19, '2022-07-12', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (3, 4, 80, 22, '2022-06-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 24, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (2, 3, 256, 25, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 26, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 27, '2022-07-15', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 28, '2022-07-10', NULL);
INSERT INTO pagamento (id_pacote, parcela, valor, id_aluno, data_venc, data_pag) VALUES (1, 1, 80, 29, '2022-07-12', NULL);


/*
Segue abaixo os usuários e papéis criados pros usuários desse sistema. 
O funcionário cuja função é 'Gerente', será o usuário 'root' do sistema. Terá acesso a todos os bancos de dados criados, bem como permissões de todo tipo de acesso.

Cada aluno terá seu usuário criado como 'user_X', sendo que no lugar do 'X' teremos o 'id_aluno', o código identificador de cada aluno. Desta forma, foi criada uma 'view' que, juntamente com o papel específico criado, cada aluno terá acesso somente as informações pessoais de cada um com o comando 'SELECT' apenas, sendo utilizada a cláusula 'WHERE' bem como a função 'SUBSTRING_INDEX' para gerenciar as condições de acesso.

Cada professor terá acesso somente as tabelas de professores e das turmas de artes marciais, sendo permissões também somente com o comando 'SELECT', ou seja, apenas de consulta. As demais tabelas e permissões, atualizar, incluir ou deletar somente o usuário 'root' para melhor controle e segurança do sistema.

*/

CREATE VIEW acesso(
    id_pagamento,
    id_pacote,
    parcela,
    valor, 
    id_aluno,
    data_venc,
    data_pag
)
AS
    SELECT
        id_pagamento,
        id_pacote,
        parcela,
        valor, 
        id_aluno,
        data_venc,
        data_pag
            FROM pagamento
        WHERE id_aluno = SUBSTRING_INDEX(SUBSTRING_INDEX(USER(), '@', 1), '_', -1);



CREATE USER 'user_1'@'localhost' IDENTIFIED BY 'usuario123';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'prof123';


CREATE ROLE 'usuario'@'localhost';
CREATE ROLE 'professor'@'localhost';

GRANT SELECT ON mentorama_ma.professor TO 'professor'@'localhost';
GRANT SELECT ON mentorama_ma.jiu_jitsu TO 'professor'@'localhost';
GRANT SELECT ON mentorama_ma.muay_thai TO 'professor'@'localhost';
GRANT SELECT ON mentorama_ma.mma TO 'professor'@'localhost';

GRANT SELECT ON TABLE acesso TO 'usuario'@'localhost';


GRANT 'usuario'@'localhost' TO 'user_1'@'localhost';
GRANT 'professor'@'localhost' TO 'funcionario'@'localhost';

SET GLOBAL activate_all_roles_on_login = TRUE;



