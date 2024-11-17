DROP TABLE administrator;
DROP TABLE customer;
DROP TABLE product;
DROP TABLE "order";
DROP TABLE order_item;
DROP TABLE zona;
DROP TABLE municipio;

DELETE FROM customer;
DELETE FROM administrator;
DELETE FROM "order";
DELETE FROM order_item;
DELETE FROM product;
DELETE FROM zona;
DELETE FROM municipio;
DELETE FROM category_table;


create table category_table(
	category varchar(50) PRIMARY KEY,
	name varchar(50),
	status varchar(20),
	image TEXT
);

CREATE TABLE product (
    id_product SERIAL,
    name varchar(50),
    description varchar(250),
    weight INTEGER,
    price decimal(10, 2),
    status varchar(50),
    category varchar(50),  
    image TEXT,
	primary key (id_product,category),
	foreign key (category) references category_table(category)
);

CREATE TABLE customer (
    id_customer SERIAL PRIMARY KEY NOT NULL,
    name CHARACTER VARYING(50) NOT NULL,
    e_mail CHARACTER VARYING(100) NOT NULL UNIQUE,
    status CHARACTER VARYING(50) NOT NULL,
    password CHARACTER VARYING(60) NOT NULL,
    address CHARACTER VARYING(200) NOT NULL,
    phone CHARACTER VARYING(20) NOT NULL,
    id_municipio INTEGER,
    id_zona INTEGER,
    FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio) ON DELETE SET NULL,
    FOREIGN KEY (id_zona) REFERENCES zona(id_zona) ON DELETE SET NULL
);


CREATE TABLE "order" (
    id_order SERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    comment VARCHAR(100),
    date TIMESTAMP with time zone,
    total_price NUMERIC(10, 2) NOT NULL,
    id_customer INTEGER,
	fecha_p TIMESTAMP with time zone,
	fecha_e TIMESTAMP with time zone,
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer)
);

CREATE TABLE order_item (
    id_item SERIAL PRIMARY KEY,
	category varchar(10),
    amount INTEGER NOT NULL,
    id_order INTEGER NOT NULL,
    id_product INTEGER NOT NULL,
    FOREIGN KEY (id_order) REFERENCES "order" (id_order),
    FOREIGN KEY (id_product,category) REFERENCES product (id_product,category) -- Asumiendo que tienes una tabla 'product'
);

create table administrator(
	id_admin SERIAL Primary key,
	name varchar(50),	
	e_mail varchar(100),
	status varchar(50),
	password varchar(300), 
	phone varchar(20)
);


CREATE TABLE municipio (
    id_municipio SERIAL PRIMARY KEY,
    nombre_municipio VARCHAR(50) NOT NULL
);

INSERT INTO municipio (nombre_municipio) VALUES
('Guatemala'),
('Mixco'),
('San Miguel Petapa');


CREATE TABLE zona (
    id_zona SERIAL PRIMARY KEY,
    nombre_zona VARCHAR(50) NOT NULL
);

INSERT INTO zona (nombre_zona) VALUES
('Zona 10'),
('Zona 13'),
('Zona 1');

insert into category_table(category,name,status,image) values ('e','Embutidos','status','https://productoscloud2.blob.core.windows.net/productos-pagina2/Carrousel4.PNG?sp=r&st=2024-11-16T21:56:11Z&se=2024-11-17T05:56:11Z&sv=2022-11-02&sr=b&sig=kqvGt7dKIZzcdnFu%2Fi2nOEVXCJLGuY43LOdrQM7J2yA%3D')
insert into category_table(category,name,status,image) values ('e','Embutidos','on-line','https://productoscloud2.blob.core.windows.net/productos-pagina2/Carrousel4.PNG?sp=r&st=2024-11-16T21:56:11Z&se=2024-11-17T05:56:11Z&sv=2022-11-02&sr=b&sig=kqvGt7dKIZzcdnFu%2Fi2nOEVXCJLGuY43LOdrQM7J2yA%3D')
insert into category_table(category,name,status,image) values ('cl','Chorizos y Longanizas','on-line','https://productoscloud2.blob.core.windows.net/productos-pagina2/Carrousel1.PNG?sp=r&st=2024-11-16T22:10:48Z&se=2024-11-22T06:10:48Z&sv=2022-11-02&sr=b&sig=mW8tuhjhmn5kKO1aoefE2%2BC1CtOFBhZMzvGPMfgUEkc%3D')
insert into category_table(category,name,status,image) values ('m','Madurados','on-line','https://productoscloud2.blob.core.windows.net/productos-pagina2/Carrousel2.PNG?sp=r&st=2024-11-16T22:08:37Z&se=2024-11-30T06:08:37Z&sv=2022-11-02&sr=b&sig=4Ok%2FsMMhpYE9%2FQNly%2FVuUHxCnW9%2FPrFoEkRB2W1Bvak%3D')
 
INSERT INTO product (id_product, name, description, weight, price, status, category, image) VALUES
(1, 'Chorizo Rosca Polaca', 'Delicioso chorizo en forma de herradura basado en una receta internacional.', 420, 25.00, '1', 'cl', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/Polaca.png?sp=r&st=2024-11-16T22:14:34Z&se=2024-11-30T06:14:34Z&sv=2022-11-02&sr=b&sig=yNwR71XCvS6mgEoVt3RTqtDkIz1MWG%2BYzdST5Zxu9q4%3D'),
(2, 'Chorizo Chipotle', 'Delicioso chorizo en forma de herradura con un toque especial de picante chipotle.', 420, 25.00, '1', 'cl', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/Polaca.png?sp=r&st=2024-11-16T22:14:34Z&se=2024-11-30T06:14:34Z&sv=2022-11-02&sr=b&sig=yNwR71XCvS6mgEoVt3RTqtDkIz1MWG%2BYzdST5Zxu9q4%3D'),
(3, 'Chorizo Ahumado Tecpán', 'Delicioso chorizo basado en una receta tradicional de la comunidad Tecpaneca.', 420, 25.00, '1', 'cl', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/Tecpan.png?sp=r&st=2024-11-16T22:17:22Z&se=2024-11-23T06:17:22Z&sv=2022-11-02&sr=b&sig=agJwyt8EjILyZ%2B0it9Gb3G7jJr8TD9wghyNZxAx9BR0%3D'),
(4, 'Longaniza Tipo Tecpán', 'Deliciosa longaniza basada en una receta tradicional de la comunidad Tecpaneca.', 420, 25.00, '1', 'cl', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/Longaniza-Tecpan.png?sp=r&st=2024-11-16T22:18:33Z&se=2024-11-23T06:18:33Z&sv=2022-11-02&sr=b&sig=YBiBl1oKOtzoY7N%2BLpH6ZmsQsqyoFAUeWRfRpARIvWE%3D'),
(5, 'Jamón Curado Cataluña', 'Jamón finamente seleccionado de res, curado y madurado artesanalmente.', 100, 22.00, '1', 'm', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/curado-cataluna.png?sp=r&st=2024-11-16T22:19:36Z&se=2024-11-23T06:19:36Z&sv=2022-11-02&sr=b&sig=QEHESQHrdRWG8pf%2BXIRZhpii7%2BbttK4n%2BHJfxDzV9CI%3D'),
(6, 'Jamón Curado Marsella', 'Jamón finamente seleccionado de cerdo, curado y madurado artesanalmente.', 100, 16.00, '1', 'm', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/curado-marsella.png?sp=r&st=2024-11-16T22:21:23Z&se=2024-11-30T06:21:23Z&sv=2022-11-02&sr=b&sig=PqOkbfdlWreJScKVf5%2F9%2FUGQO14frSdx7zP4xgevBP0%3D'),
(7, 'Carpaccio de Res Aderezado', 'Jamón curado y aderezado con receta de la casa.', 100, 22.00, '1', 'm', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/aderezado-res.png?sp=r&st=2024-11-16T22:23:48Z&se=2024-11-23T06:23:48Z&sv=2022-11-02&sr=b&sig=YSiFgSt5OAzLhTJEqV%2B44SOksDmrRL%2BrZgrK7UvCXgU%3D'),
(8, 'Carpaccio de Cerdo Aderezado', 'Jamón curado y aderezado con receta de la casa.', 100, 20.00, '1', 'm', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/aderezado-cerdo.png?sp=r&st=2024-11-16T22:25:10Z&se=2024-11-30T06:25:10Z&sv=2022-11-02&sr=b&sig=RG3jRjLs0hdqcFoa2kpPMCYV35XWj0PDxoMCACN%2FyCg%3D'),
(9, 'Pepperoni', 'Elaborado con una receta tradicional para un comportamiento a alta temperatura, especial para pizzas.', 454, 24.00, '1', 'e', 'https://productoscloud2.blob.core.windows.net/productos-pagina2/peperoni.png?sp=r&st=2024-11-16T22:26:24Z&se=2024-11-23T06:26:24Z&sv=2022-11-02&sr=b&sig=nfE8JzG%2BqSizFud8zIgIGhlaPl1TjmMawqNI6L%2FR6Cw%3D')
;



select * from municipio;
select * from zona;
select * from customer;
select * from "order";
select * from order_item;
select * from administrator;
select * from product;
select * from category_table;


