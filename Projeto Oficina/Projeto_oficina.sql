CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

drop database Oficina;

-- tabela veiculo
create table Veiculo(
	idVeiculo int auto_increment primary key,
    idRevisão int,
    Placa char(7) not null,
    constraint placa_idVeiculo unique (idVeiculo, Placa)
);

alter table Veiculo add constraint foreign key (idVeiculo) references EqpMecanico(idEqpMecanico),
add constraint fk_conserto foreign key (idVeiculo) references Conserto(idConserto),
add constraint fk_revisao foreign key (idRevisão) references Revisao(idRevisão);

desc Veiculo;

-- tabela clientes
create table Clientes(
	idClientes int auto_increment primary key,
    idVeiculo int,
    Fname varchar(10),
    Minit char(3),
    Lname varchar (20),
    CPF char (11) not null,
    Address varchar (30),
   constraint fk_veiculo foreign key (idVeiculo) references Veiculo(idVeiculo)
);

desc Clientes;
select Fname, Address from Clientes;
-- tabela pessoa fisica
create table PessoaFisica(
	idPessoaFisica int auto_increment primary key,
    Nome varchar(45)not null,
    CPF char(11) not null,
    Endereço varchar(45),
    Contato char(11)
);

alter table PessoaFisica add constraint unique_cpf_PessoaFisica unique (CPF);

alter table PessoaFisica add constraint fk_idClientes_pf foreign key (idPessoaFisica) references Clientes(idClientes),
add constraint fk_clinte_pf foreign key (idClientePf) references Clientes(idClientes),
add constraint fk_veiculo_pf foreign key (idPessoaFisica) references Veiculo(idVeiculo);

desc PessoaFisica;

-- Tabela pessoa juridica
create table PessoaJuridica(
	idPessoaJuridica int auto_increment primary key,
    RazaoSocial varchar(45) not null,
    CNPJ char(15) not null,
    Endereço varchar(45),
    Contato char(11),
    constraint unique_cnpj_PessoaJuridica unique (CNPJ)
);

alter table PessoaJuridica add constraint fk_clientes_pj foreign key (idPessoaJuridica) references Clientes(idClientes),
add constraint fk_veiculo_pj foreign key (idPessoaJuridica) references Veiculo(idVeiculo);

desc PessoaJuridica;

-- tabela conserto
create table Conserto(
	idConserto int auto_increment primary key,
    Descrição varchar(45) not null
);

desc Conserto;

-- tabela revisão
create table Revisão(
	idRevisão int auto_increment primary key,
    Descrição varchar(45) not null
);

desc Revisão;

-- tabela Mecânico
create table Mecanico(
	idMecanico int auto_increment primary key,
    Nome varchar(45) not null,
    Endereço varchar(45) not null,
    Especialidade varchar(45) not null
);

desc Mecanico;

-- tabela equipe de mecanicos
create table EqpMecanicos(
	idEqpMecanicos int auto_increment primary key
);

alter table EqpMecanicos add constraint fk_Mecanico foreign key (idEqpMecanicos) references Mecanico(idMecanico);
alter table OdServiço add constraint fk_OdServiço foreign key (idOdServiço) references OdServiço(idOdServiço);

desc EqpMecanicos;

-- tabela ordem de serviço
create table OdServiço(
	idOdServiço int auto_increment primary key,
    DataEmissão date,
    ValorServiço float not null,
    ValorPeça float not null,
    ValorTotal float not null,
    Status ENUM('AGUARDANDO', 'EM ANDAMENTO', 'CONCLUIDO', 'CANCELADO'),
    DataConclusão date
);

select * from OdServiço order by DataEmissão;
select * from OdServiço order by ValorTotal;
desc OdServiço;

-- referencia de peças
create table ReferenciaPreços(
	idReferenciaPreços int auto_increment primary key,
    constraint fk_referencia_precos foreign key (idReferenciaPreços) references OdServiço(idOdServiço)
);

desc ReferenciaPreços;

-- tabela autorização do clienta
create table Autorização(
	idAutorização int auto_increment primary key,
	Autorizado bool default false,
    constraint fk_autorização_cliente foreign key (idAutorização) references Clientes(idClientes),
    constraint fk_autorização_veiculo foreign key (idAutorização) references Veiculo(idVeiculo),
    constraint fk_autorização_OdServiço foreign key (idAutorização) references OdServiço(idOdServiço)
);

desc Autorização;

-- tabelaa Peças
create table Pecas(
	idPecas int auto_increment PRIMARY KEY,
    Descrição varchar(45),
    Valor float not null
);

desc Pecas;

-- tabela ordem de serviço Peças
create table OsPecas(
	idOsPecas int auto_increment PRIMARY KEY,
	constraint fk_pecas foreign key (idOsPecas) references Pecas(idPecas),
    constraint fk_os_pecas foreign key (idOsPecas) references OdServiço(idOdServiço)
);

desc OsPecas;

-- tabelaserviços
create table Serviços(
	idServiços INT auto_increment PRIMARY KEY,
    Descrição VARCHAR(45),
    Valor FLOAT NOT NULL
);

desc Serviços;

-- Tabela ordem de serviço
create table OdServiço(
	idOdServiço INT auto_increment PRIMARY KEY,
    constraint fk_serviços foreign key (idOdServiço) references Serviços(idServiços),
    constraint fk_os_serviços foreign key (idOdServiço) references OdServiço(idOdServiço)
);

desc OdServiço;