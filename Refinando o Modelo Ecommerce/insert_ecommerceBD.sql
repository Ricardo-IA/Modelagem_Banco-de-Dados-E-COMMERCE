-- inserção de dados e queries
use ecommerce;
show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname,CPF, Address)
	  values('Ricardo', 'M', 'Fonseca', '2554896','Rua agosto 29, tulipa' ),
			('João', 'B', 'Silva', '7644924', 'Rua setembro 30, Tiradentes' ),
            ('Raquel', 'F', 'Santos', '8661554', 'Rua Suzana mattos 9, Ademar' ),
            ('Arthur', 'L', 'Moraes', '36294354', 'Rua Senador queiroz 19,  Dali' ),
            ('Selma', 'G', 'Rocha', '78953354', 'Rua Nove de julho 24, Marrocos' );
 
select * from clients;
 -- idProduct Pname, classificatiopn_kids, category, avaliação, size
 
 insert into product (Pname, classificatiopn_kids, category, avaliação, size)
		values('Hulk', false, 'Eletroeletrônico', '2', null ),
			  ('Ventilador', false, 'Vestimento', '4', null ),
              ('Cama', false, 'Brinquedo', '1', '203x198' ),
              ('Bicicleta', false, 'Alimentos', '3', null ),
              ('Arroz', false, 'Móveis', '5', null );
              
select * from product;  
           

	
-- idOrder idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
delete from orders where idOrderClient in (1,2,3);
insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
        values(1, default, ' App', null,1),
              (2, default,' Loja', 50,0),
              (3, 'Confirmado', null, null,1),
              (4, default,' web', 150,0);
select * from orders;
-- idPOproduct, idPoorder, poQuantity, poStatus 
drop table productOrder;
delete from productOrder where idPOproduct in (1,2,3);
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) 
					values(1,5,2,null),           
						  (2,5,1,null), 
                          (3,6,1,null);
						
select * from productOrder;        
-- storageLocation, quantity 
insert into productStorage (atorageLocation,quantity)
              values('Rio de janeiro', 1000), 
                    ('Rio de janeiro',500),
                    ('São Paulo', 200),
                    ('São Paulo', 10),
                    ('Rio de janeiro', 600);
 -- idLproduct, idLstorage, location                         
insert into storageLocation (idLproduct, idLstorage, location)
                   values (1, 2, 'RJ'),
                          (2, 6, 'GO');
                          
-- SocialName, CNPJ, contact
insert into supplier(SocialName, CNPJ, contact)    
              values('Alameda e filhos', 101234564400, '21985474'), 
                    ('Eletronicos Silva',5026767672110, '21983674'),
                    ('Eletronicos Valma', 20186171006170, '21395474');
                    
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSuplier, idPsProduct, quantity)
             values(1,1,500),
				   (1,2,400),
                   (2,4,340),
                   (3,3,520),
                   (5,5,100);
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller(SocialName, AbstName, CNPJ, CPF, location, contact)
            values ('Tech eletronics', null, 635667484348, null, 'Rio de janeiro','987766655'),
                   ('Metalurgia AB', null, null, 6478392372,'Salvador', 243663787),
                   ('Planeta MT', null, 898392372,'Paraiba', 111663787);
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity)
            values(1,6,80),
                  (2,7,10);
                  
select * from 	productSeller;			



                                            