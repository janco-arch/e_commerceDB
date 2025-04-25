
create database e_commerceDB;
use e_commerceDB;


-- brand table
create table brand(
brand_id int primary key,
brand_name varchar(60) not null,
brand_description varchar(255));

-- insert values into brand table
INSERT INTO brand (brand_id, brand_name,brand_description) VALUES
(1, 'Nike',"Renowned for sportswear and athletic footwear"),
(2, 'Apple',"A technology giant known for groundbreaking electronics such as iPhones"),
(3, 'Sony',"A leading brand in consumer electronics, especially known for entertainment products like PlayStation consoles"),
(4, 'Adidas',"A global sportswear company specializing in performance-driven footwear");


-- product table
create table product(
product_id int primary key,
product_name varchar(255) not null,
product_price decimal(10,2) not null,
brand_id int not null,
foreign key (brand_id) references brand(brand_id));

-- insert into product table
 insert into product(product_id,product_name,product_price,brand_id)
 values
 (1,"Running Shoes",12000.00,1),
 (2,"Iphone 15",145000.45,2),
 (3,"Play Station",60000.20,3),
 (4,"Football",23523.45,4);


-- product_image table
create table product_image(
image_id int primary key,
product_id  int not null,
image_url varchar(255) not null,
foreign key (product_id) references product(product_id));

-- insert into product_image table
insert into product_image (image_id, product_id, image_url)
values
(1, 1, 'https://example.com/nike-shoes.jpg'),
(2, 2, 'https://example.com/iphone-14.jpg'),
(3, 3, 'https://example.com/ps5.jpg'),
(4, 4, 'https://example.com/soccer-ball.jpg');


-- product_item table
create table product_item(
item_id int primary key,
product_id int not null,
variation_id int not null,
stock_quantity int not null,
foreign key (product_id) references product(product_id));

-- isert values into product_item table
insert into product_item (item_id, product_id, variation_id,stock_quantity) 
values
(1,1,1,50),
(2,2,2,30),
(3, 3,3,100);


-- product _attribute table
create table product_attribute(
attribute_id int primary key,
product_id int not null,
attribute_type_id int not null,
attribute_value varchar(150),
category_id int not null,
attribute_name varchar(60),
foreign key (product_id) references product(product_id));

-- insert values into product_attribute table
insert into product_attribute (attribute_id, product_id, attribute_type_id, attribute_value,category_id,attribute_name) 
values
(1, 1, 2, 'Mesh',1,"build material"),
(2, 2, 3, '6.1 inches',2,"size"),
(3, 3, 1, '3.9 kg',3,"weight");

-- product_variation table
CREATE TABLE product_variation(
variation_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,
product_id INT ,
color_id INT ,
size_option_id INT ,
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (color_id) REFERENCES color(color_id),
FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);
INSERT INTO product_variation(product_id, color_id, size_option_id) VALUES
(1,3,2),
(1,3,1),
(2,1,3),
(3,2,1);

-- color table
CREATE TABLE color(
color_id INT PRIMARY KEY NOT NULL  AUTO_INCREMENT,
color_name VARCHAR (50) NOT NULL
);
INSERT INTO color(color_name) VALUES
("Blue"),
("Yellow"),
("Green"),
("Orange");

-- size_option table
CREATE TABLE size_option(
size_option_id INT PRIMARY KEY NOT NULL  AUTO_INCREMENT,
size_name VARCHAR (50) NOT NULL,
size_description VARCHAR(50) NOT NULL,
size_category_id INT ,
FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);
INSERT INTO size_option(size_name, size_description, size_category_id) VALUES
("M", "Medium", 2),
("L", "Large", 3),
("S", "Small", 1);

-- size_category table
CREATE TABLE size_category(
size_category_id INT PRIMARY KEY NOT NULL  AUTO_INCREMENT,
size_category_name VARCHAR (50) NOT NULL
);
INSERT INTO size_category(size_category_name) VALUES
('Children Wear'),
('Women'),
('Men Wear');


