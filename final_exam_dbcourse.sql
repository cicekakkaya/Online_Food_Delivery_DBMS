/*
Create the database (name: TEST_DATAMANAGEMENT)
*/

create database TEST_DATAMANAGEMENT

USE TEST_DATAMANAGEMENT


/*
Create the tables 
*/

CREATE TABLE CUSTOMERS (
	Customer_ID int identity(1,1) primary key,
	Full_Name nvarchar(40),
	Adress nvarchar(100)

)

CREATE TABLE PRODUCTS (
	Item_ID int identity(1,1) primary key,
	Item nvarchar(40),
	Price decimal (10,2)

)

CREATE TABLE ORDERS (
	ORDER_ID int identity(1,1) primary key,
	OrderDate date,
	Customer_ID int,
	Foreign key (Customer_ID) references Customers(Customer_ID)

)

CREATE TABLE ORDER_ITEMS (
	ORDER_ITEMS_ID int identity(1,1) primary key,
	ORDER_ID int,
	Foreign key (ORDER_ID) references ORDERS(ORDER_ID),
	Item_ID int,
	foreign key (Item_ID) references Products(Item_ID),
	Order_Item_Qty int,
	PriceAtSale decimal(10,2)
)


/*
Insert the data 
*/


insert into CUSTOMERS (Full_Name, Adress)
values 
('Mickey Mouse', 'Mouseton, United Sytates of America'),
('Minnie Mouse', 'Mouseton, United Sytates of America'),
('Donald Duck', 'Duckburg, Canada'),
('Daisy Duck', 'Duckburg, Canada'),
('Scrooge McDuck', 'Duckburg, Canada')



insert into PRODUCTS (Item, Price)
values 
('Hamburger', 12),
('Hot dog', 9),
('Apple pie', 30),
('Pancake', 3),
('Crispbread', 0.05)



insert into ORDERS (OrderDate, Customer_ID)
values
('2025-06-21', 1),
('2025-06-22', 2),
('2025-06-22', 3),
('2025-06-23', 4),
('2025-06-24', 1),
('2025-06-24', 5)




insert into Order_Items (Order_ID, Item_ID, Order_Item_Qty, PriceAtSale)
values 
(2,1,3,12), (2,2,5,9), (3,5,5,0.05),(3,3,1,30),
(4,4,36,3), (5,3,3,30), (6,1,5,12), (7,5,10,0.05)



/*
Count how many orders you have received
*/

select count(Order_ID) from ORDERS

/*
List the orders reporting the date, item, quantity, price and total amount of the sale
*/

SELECT OrderDate, Item, Order_Item_Qty, PriceAtSale, (Order_Item_Qty*PriceAtSale) as Sale_Amount 
from ORDER_ITEMS
join ORDERS on ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
join PRODUCTS on PRODUCTS.Item_ID = ORDER_ITEMS.Item_ID

