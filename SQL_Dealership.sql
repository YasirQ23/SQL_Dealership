create table mechanic(
mechanic_id serial primary key,
name varchar(30),
hourly_rate numeric(6,2)
);

create table parts(
part_id serial primary key,
name varchar(50),
price numeric(7,2)
);

create table customer(
customer_id serial primary key,
name varchar(50),
credit_score smallint
);

create table salesperson(
salesperson_id serial primary key,
name varchar(50),
hire_date date,
salary int
);

create table car(
vin int primary key,
salesperson_id int,
make varchar(50),
model varchar(50),
yearmade smallint,
used bool,
msrp numeric(9,2),
foreign key(salesperson_id) references salesperson(salesperson_id)
);

create table sales_invoice(
sales_invoice_id serial primary key,
vin int,
customer_id int,
sale_price numeric(9,2),
foreign key(vin) references car(vin),
foreign key(customer_id) references customer(customer_id)
);

create table service_invoice(
service_invoice_id serial primary key,
vin int,
customer_id int,
labor_cost numeric(7,2),
parts_cost numeric(7,2),
description varchar(500),
foreign key(vin) references car(vin),
foreign key(customer_id) references customer(customer_id)
);

create table mechanic_invoice(
service_invoice_id int,
mechanic_id int,
labor_hours int,
foreign key(mechanic_id) references mechanic(mechanic_id),
foreign key(service_invoice_id) references service_invoice(service_invoice_id)
);

create table service_part(
parts_id serial primary key,
quantity int,
part_id int,
service_invoice_id int,
foreign key(service_invoice_id) references service_invoice(service_invoice_id),
foreign key(part_id) references parts(part_id)
);


insert into mechanic (mechanic_id,name,hourly_rate)
values ('1','John Jacobs','25.00');

insert into mechanic (mechanic_id,name,hourly_rate)
values ('2','Bob Bingo','30.00');

select *
from mechanic;

insert into parts (part_id,name,price)
values ('1','transmission','300.00');

insert into parts (part_id,name,price)
values ('2','dashboard','50.00');

insert into parts (part_id,name,price)
values ('3','tires','600.00');

select *
from parts;

insert into customer (name,credit_score)
values ('Ryan Longbottom','600');

insert into customer (name,credit_score)
values ('Eric Tarrington','754');

insert into customer (name,credit_score)
values ('Katie Newport','799');

select *
from customer;

insert into salesperson (name, hire_date, salary)
values ('Frank White','2000-01-07','76000');

insert into salesperson (name, hire_date, salary)
values ('Pat Black','1995-08-11','80000');

insert into salesperson (name, hire_date, salary)
values ('Tommy Blue','2015-05-12','70000');

select *
from salesperson;

insert into car (vin, salesperson_id, make, model, yearmade, used, msrp)
values ('465749','2','Subaru','Outback','2020','False','38999');

insert into car (vin, salesperson_id, make, model, yearmade, used, msrp)
values ('937251','2','Subaru','BRZ','2017','True','22999');

insert into car (vin, salesperson_id, make, model, yearmade, used, msrp)
values ('952384','3','Subaru','WRX','2020','False','35999');

select *
from car;

insert into sales_invoice(vin, customer_id, sale_price)
values ('952384','2','34000');

insert into sales_invoice(vin, customer_id, sale_price)
values ('937251','1','20000');

insert into sales_invoice(vin, customer_id, sale_price)
values ('465749','3','36000');

select *
from sales_invoice;

insert into service_invoice(vin, customer_id, labor_cost, parts_cost, description)
values ('937251','1','700','300','New transmission installed');

insert into service_invoice(vin, customer_id, labor_cost, parts_cost, description)
values ('465749','3','300','50','New dashboard installed');

select *
from service_invoice;

insert into mechanic_invoice(service_invoice_id, mechanic_id, labor_hours)
values ('1','1','20');

insert into mechanic_invoice(service_invoice_id, mechanic_id, labor_hours)
values ('1','2','10');

insert into mechanic_invoice(service_invoice_id, mechanic_id, labor_hours)
values ('2','2','10');

select *
from mechanic_invoice;

insert into service_part(quantity, part_id, service_invoice_id)
values ('1','1','1');

insert into service_part(quantity, part_id, service_invoice_id)
values ('1','2','2');

select *
from service_part;