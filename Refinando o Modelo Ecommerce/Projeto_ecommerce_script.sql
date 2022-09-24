-- criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce; 
create database ecommerce;
use ecommerce;
-- criar tabela cliente
create table clients(
       idClient int auto_increment primary key,
       Fname varchar(10),
       Minit char(3),
       Lname varchar (20),
       CPF char (11) not null,
       Address varchar (30),
       constraint unique_cpf_cliente unique (CPF)
);
desc clients;
select Fname, Address from clients;
alter table clients auto_increment=1;

-- criar tabela produto --
create table product(
       idProduct int auto_increment primary key,
       Pname varchar (10) not null,
       classificatiopn_kids bool,
       category enum ('Eletroeletrônico', 'Vestimento', 'Brinquedo', 'Alimentos','Móveis') not null,
       avaliação float default 0,
       size varchar(10)
);
select * from  product where category;
-- criar tabela Pagamento --
create table payments(
    idclient int,
    idpayment int,    
    typePayment enum('Boleto','Cartão','Dois cartões'),
    LimitAvaliable float,
    primary key (idClient, idpayment)

);
desc payments;
-- criar tabela pedido 
create table orders(
     idOrder int auto_increment primary key,
     idOrderClient int,
     orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
     orderDescription varchar (255),
     sendValue float default 10,
     paymentCash bool default false,
     constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
);
desc orders;
-- criar tabela estoque
create table productStorage (
     idProdtStorage int auto_increment primary key,
     storageLocation varchar(255),
     quantity int default 0
);
desc orders;
-- criar tabela fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar (255) not null,
    CNPJ char (15) not null,
    contact varchar (11) not null,
    constraint unique_supplier unique (CNPJ)
);
desc supplier;
  -- criar a tabela Fronecedor  
create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar (255) not null,
    CNPJ char (15) not null,
    CPF char (9),
    location varchar (255),
    contact varchar (11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);
desc seller;
-- criar a tabela do produto e vendedor
create table productSeller(
	idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_productSeller foreign key (idPseller) references seller(idSeller),
    constraint fk_product foreign key (idProduct) references product(idProduct)
);
desc productSeller;
-- criar a tabela ordem do produto
 create table productOder(
	idPOproduct int,
    idPOoder int,
    poQuantity int default 1,
    poStatus enum ('Disponivel', 'Sem estoque') default 'Disponivel',
    primary key (idPOproduct, idPOoder),
    constraint fk_produc_tSeller foreign key (idPOproduct) references product (idProduct),
    constraint fk_product_productOder foreign key (idPOoder) references orders(idOrder)  
);
desc productOder;
-- criar a tabela localização da loja
create table storeLocation(
	idLproduct int,
    idLstorage int,
    location varchar (255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdtStorage)  
);
desc storeLocation;
 -- criar a tabela Produto Fronecedor 
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_prodct foreign key (idPsProduct) references product(idProduct)  
);
desc productSupplier;

show tables;