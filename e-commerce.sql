
create database e_commerceDB;
use e_commerceDB;


-- brand table
create table brand(
brand_id int primary key,
brand_name varchar(60) not null,
brand_description varchar(255));


-- product table
create table product(
product_id int primary key,
product_name varchar(255) not null,
product_price decimal(10,2) not null,
brand_id int not null,
foreign key (brand_id) references brand(brand_id));


-- product _image table
create table product_image(
image_id int primary key,
product_id  int not null,
image_url varchar(255) not null,
foreign key (product_id) references product(product_id));


-- product_item table
create table product_item(
item_id int primary key,
product_id int not null,
variation_id int not null,
stock_quantity int not null,
foreign key (product_id) references product(product_id));


-- product _attribute table
create table product_attribute(
attribute_id int primary key,
product_id int not null,
attribute_type_id int not null,
attribute_value varchar(150),
category_id int not null,
attribute_name varchar(60),
foreign key (product_id) references product(product_id));



 insert into product(product_id,product_name,product_price,brand_id)
 values
 (1,"Running Shoes",12000.00,1),
 (2,"Iphone 15",145000.45,2),
 (3,"Play Station",60000.20,3),
 (4,"Football",23523.45,4);-- 


insert into product_image (image_id, product_id, image_url)
values
(1, 1, 'https://example.com/nike-shoes.jpg'),
(2, 2, 'https://example.com/iphone-14.jpg'),
(3, 3, 'https://example.com/ps5.jpg'),
(4, 4, 'https://example.com/soccer-ball.jpg');

insert into product_item (item_id, product_id, variation_id,stock_quantity) 
values
(1,1,1,50),
(2,2,2,30),
(3, 3,3,100);

insert into product_attribute (attribute_id, product_id, attribute_type_id, attribute_value,category_id,attribute_name) 
values
(1, 1, 2, 'Mesh',1,"build material"),
(2, 2, 3, '6.1 inches',2,"size"),
(3, 3, 1, '3.9 kg',3,"weight");



