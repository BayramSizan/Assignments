/* Charlie's Chocolate Factory company produces chocolates. 
The following product information is stored: product name, product ID, and quantity on hand. 
These chocolates are made up of many components. Each component can be supplied by one or more suppliers.
The following component information is kept: component ID, name, description, quantity on hand, 
suppliers who supply them, when and how much they supplied, and products in which they are used. 
On the other hand following supplier information is stored: supplier ID, name, and activation status.

Assumptions

A supplier can exist without providing components.
A component does not have to be associated with a supplier. It may already have been in the inventory.
A component does not have to be associated with a product. Not all components are used in products.
A product cannot exist without components. 

Do the following exercises, using the data model.

     a) Create a database named "Manufacturer"

     b) Create the tables in the database.

     c) Define table constraints.

*/



USE Manifacturer;

create table product(
	prod_id int primary key identity(1,1) not null,
	prod_name varchar(50) null,
	quantity int
)

create table supplier(
	supp_id int primary key identity(1,1) not null,
	supp_name varchar(50) null,
	supp_location varchar(50) null,
	supp_country varchar(50) null,
	is_active bit
)

create table component(
	comp_id int identity(1,1) not null,
	comp_name varchar(50) null,
	[description] varchar(50) null,
	quantity_comp int null,
	
	primary key (comp_id)
)

create table prod_comp(
	prod_id int identity(1,1) not null foreign key references product (prod_id),
	comp_id int not null foreign key references component (comp_id),
	quantity_comp int null

	primary key (prod_id, comp_id),
)

create table comp_supp(
	supp_id int identity(1,1) not null,
	comp_id int not null,
	order_date date,
	quantity int
	
	primary key (supp_id, comp_id)

	foreign key (supp_id) references supplier (supp_id),
	foreign key (comp_id) references component (comp_id)
)

DROP TABLE IF EXISTS prod_comp;
DROP TABLE IF EXISTS comp_supp;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS component;