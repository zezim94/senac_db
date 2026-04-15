/* 0 */
create table funcionario(
    idFuncionario int primary key AUTO_INCREMENT, 
    nomeFuncionario varchar(50) not null, 
    cpf char(11) unique not null, 
    celular char(11) not null
);

create table cliente(
    idCliente int primary key AUTO_INCREMENT,
    nomeCliente varchar(50),
    cpf char(11) unique not null
);

create table equipamento(
    idEquipamento int primary key AUTO_INCREMENT,
    nomeEquipamento varchar(50) not null,
    qtd int not null,
    valorHora decimal(5,2) not null
);

create table aluguel(
    idAluguel int primary key AUTO_INCREMENT,
    idCliente int not null,
    idFuncionario int not null,
    dataHoraRetirada datetime DEFAULT now(),
    dataHortaDevolucao datetime,
    valorAPagar decimal(10,2),
    valorPago decimal(10,2),
    pago bit,
    formaPagamento varchar(50),
    qtVezes int,
    
    CONSTRAINT fk_cliente FOREIGN key (idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT fk_funcionario FOREIGN key (idFuncionario) REFERENCES funcionario(idFuncionario)
);


create table aluguelEquipamento(
    idAluguelEquipamento int PRIMARY key AUTO_INCREMENT,
    idEquipamento int not null,
    idAluguel int not null,
    valorItem decimal(10,2) not null,
    valorUnitario decimal(10,2) not null,
    qtd int,
    
    CONSTRAINT fk_equipamento FOREIGN key (idEquipamento) REFERENCES equipamento(idEquipamento),
    CONSTRAINT fk_aluguel FOREIGN key (idAluguel) REFERENCES aluguel(idAluguel)   
);

/* 1 */
alter table cliente add COLUMN email varchar(150) unique not null;
alter table cliente add COLUMN cidade varchar(50) not null;
alter table cliente add COLUMN estado char(2) not null;

/* 2 */
INSERT INTO cliente (nomeCliente, cpf, email, cidade, estado) VALUES
('Donald', '83947261502', 'donald@uol.com', 'Santos', 'SP'),
('Margarida', '17490538261', 'margarida@uol.com', 'São Vicente', 'SP'),
('Patinhas', '56019283745', 'patinhas@uol.com', 'Florianópolis', 'SC'),
('Huguinho', '92837465011', 'huguinho@gmail.com', 'Santos', 'SP'),

('Luizinho', '30587192644', 'luizinho@gmail.com', 'Praia Grande', 'SP'),
('Zezinho', '76109428355', 'zezinho@gmail.com', 'São Vicente', 'SP'),
('Pardal', '49283016577', 'pardal@uol.com', 'Santos', 'SP'),
('Zé Carioca', '61827394025', 'zecarioca@gmail.com', 'Rio de Janeiro', 'RJ'),

('Mickey', '84736201983', 'mickey@hotmail.com', 'Recife', 'PE'),
('Minie', '20938475610', 'minie@gmail.com', 'Recife', 'PE'),
('Pateta', '73592018466', 'pateta@gmail.com', 'São Paulo', 'SP'),
('Branca de Neve', '48173629504', 'brancadeneve@hotmail.com', 'São Joaquim', 'SC'),

('Aladin', '96204718350', 'aladin@gmail.com', 'Belém', 'PA'),
('Cinderela', '15382947621', 'cinderela@hotmail.com', 'Goiânia', 'GO'),
('Mulan', '68492037158', 'mulan@gmail.com', 'Rio das Ostras', 'RJ'),
('Moana', '37019582644', 'moana@gmail.com', 'Parati', 'RJ'),

('Asnêsio', '52938471062', 'asnesio@uol.com', 'Belo Horizonte', 'MG'),
('Maga Patológica', '80627194355', 'magapatologica@gmail.com', 'Cubatão', 'SP'),
('Capitão Boeing', '94173820516', 'capitaoboeing@uol.com', 'Manaus', 'AM'),
('Pão Duro Mac Money', '26840591733', 'paoduro@ig.com', 'Osasco', 'SP');

/* 3 */
insert into funcionario(nomeFuncionario, cpf, celular)
VALUES('Cebolinha', '12345678910', '32165498798'),
('Cascão', '32145678910', '32165498987'),
('Chico Bento', '12345967910', '12345698798');

/* 4 */
insert into equipamento(nomeEquipamento, qtd, valorHora) 
values('Cadeiras 2 posições' 50, 2.00),
('Cadeiras 4 posições' 100, 3.50),
('Guarda sol P' 40, 2.00),
('Guarda sol G' 60, 3.00),
('Mesinha' 30, 1.50);

/* 5 e 6 */
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(11, 1, '2024-12-08'); /*1*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(9, 3, '2024-12-10'); /*2*/

insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(1, 1, 2.00, 2.00, 1);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(2, 2, 7.00, 3.50, 2);

update equipamento set qtd = (qtd - 1) where idEquipamento = 1;
update equipamento set qtd = (qtd - 2) where idEquipamento = 2;

/* 7 */
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(1, 1, '2024-12-27'); /*3*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(3, 1, '2024-12-27'); /*4*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(16, 1, '2024-12-27'); /*5*/

insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(3, 3, 2.00, 2.00, 1);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(3, 4, 2.00, 2.00, 1);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(3, 5, 2.00, 2.00, 1);

update equipamento set qtd = (qtd - 1) where idEquipamento = 3;
update equipamento set qtd = (qtd - 1) where idEquipamento = 3;
update equipamento set qtd = (qtd - 1) where idEquipamento = 3;


/* 8 */
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(2, 3, '2024-12-28'); /*6*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(7, 3, '2024-12-28'); /*7*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(20, 3, '2024-12-28'); /*8*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(18, 3, '2024-12-28'); /*9*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(11, 3, '2024-12-28'); /*10*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) values(13, 3, '2024-12-28'); /*11*/

insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(2, 6, 7.00, 3.50, 2);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(4, 6, 6.00, 3.00, 2);
update equipamento set qtd = (qtd - 2) where idEquipamento = 2;
update equipamento set qtd = (qtd - 2) where idEquipamento = 4;

insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(2, 7, 7.00, 3.50, 2);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(4, 7, 6.00, 3.00, 2);
update equipamento set qtd = (qtd - 2) where idEquipamento = 2;
update equipamento set qtd = (qtd - 2) where idEquipamento = 4;

insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(2, 8, 7.00, 3.50, 2);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(4, 8, 6.00, 3.00, 2);
update equipamento set qtd = (qtd - 2) where idEquipamento = 2;
update equipamento set qtd = (qtd - 2) where idEquipamento = 4;

insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(2, 9, 7.00, 3.50, 2);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(4, 9, 6.00, 3.00, 2);
update equipamento set qtd = (qtd - 2) where idEquipamento = 2;
update equipamento set qtd = (qtd - 2) where idEquipamento = 4;

insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(2, 10, 7.00, 3.50, 2);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(4, 10, 6.00, 3.00, 2);
update equipamento set qtd = (qtd - 2) where idEquipamento = 2;
update equipamento set qtd = (qtd - 2) where idEquipamento = 4;

insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(2, 11, 7.00, 3.50, 2);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) values(4, 11, 6.00, 3.00, 2);
update equipamento set qtd = (qtd - 2) where idEquipamento = 2;
update equipamento set qtd = (qtd - 2) where idEquipamento = 4;

/* 9 */
select nome, cpf from cliente order by nome;

/* 10 */
select nome, celular from funcionario order by nome;
