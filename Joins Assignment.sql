-- 1. Get the full name and contact details of all customers who made a purchase.
select concat(firstname , " ",lastname) as FullName 
,c.Email ,c.Phonenumber ,s.Quantity
 from customers c 
join
sales s 
on c.CustomerID = s.CustomerID;

-- 2. List the sales representative's full name and the total sales amount they generated.
select sr.SalesRepID ,concat(sr.firstname , " " ,sr.lastname) as FullName , 
sum(s.totalamount) as Totalsales 
from sales_reprentative sr 
left join
sales s 
on sr.SalesRepID = s.SalesRepID
group by sr.SalesRepID ,FullName;

/* 3. Retrieve the list of customers and the products they 
have purchased, including the quantity and total amount spent */
select concat(firstname , " ", lastname) as FullName ,
 productname ,quantity ,totalamount 
 from customers c 
join
sales s  
on c.CustomerID = s.CustomerID
join 
products p 
on s.ProductID = p.ProductID;

-- 4. List all sales representatives along with the number of sales they have made.
select concat(firstname," ", lastname) as FullName ,
 sum(quantity) as Total_Sales ,sum(totalamount) as Total_Amount 
 from sales_reprentative sr
 left join
 sales s 
 on sr.SalesRepID = s.SalesRepID
 group by FullName;
 
 -- 5. Find the sales representative details for all sales made in a specific store location. 
 -- #use Left Join for all sales representative
 select concat(firstname," ", lastname) as FullName 
 ,HireDate ,Region , StoreLocation , sum(totalamount) as Total_Amount,
 sum(quantity) as Total_Sales
 from sales_reprentative sr
 join 
 sales s 
 on sr.SalesRepID = s.SalesRepID
 group by FullName ,HireDate , region , storelocation;
 
 -- 6. Get the total sales amount for each product along with its category.
 select productname ,category , sum(totalamount) as Total_Amount
 from products p 
 left join 
 sales s 
 on p.ProductID = s.ProductID
 group by productname ,category ;
 
 /* 7. List all customers along with the product 
 they have purchased and the total amount spent */
select concat(c.firstname," ", c.lastname) as FullName ,
 p.productname ,sum(s.totalamount) as Total_Amount
from customers c 
join 
sales s 
on c.CustomerID = s.CustomerID
join
products p 
on s.ProductID = p.ProductID
group by FullName ,p.productname;

/* Retrieve the sales data including customer names and
product details for a specific sales representative. */
select concat(sr.firstname," ",sr.lastname) as Sales_Representative_FullName 
,concat(c.firstname ," ",c.lastname) as Customer_FullName ,
 p.productname ,p.category ,p.unitprice 
 from sales s
 join 
 customers c
 on s.CustomerID = c.CustomerID
join
products p 
on s.ProductID = p.ProductID 
join 
sales_reprentative sr
on s.SalesRepID = sr.SalesRepID
group by Sales_Representative_FullName ,
 p.productname ,p.category ,p.unitprice 
 ,Customer_FullName;
 
 -- 9. Find the sales representative details and the products sold by them in each region.
 -- Names Are repeating because other sales representatives has not made any sales.
 select concat(sr.firstname," ",sr.lastname) as Sales_representative_FullName ,
 max(sr.HireDate) as HireDate,
 sr.Region , p.productname
 from sales_reprentative sr
 join
 sales s
 on sr.SalesRepID = s.SalesRepID
 join 
 products p
 on s.ProductID = p.ProductID
 group by Sales_representative_FullName ,sr.Region , p.productname;
 
 -- 10.Get the total number of products sold and their corresponding sales amount for each customer. 
 select p.productname ,sum(s.totalamount) as Total_Sales 
 from sales s 
 join
 products p 
 on s.ProductID = p.ProductID
 group by p.productname;
 
 -- 11.Retrieve the contact details of customers who have bought products from multiple categories.
 select * from (select c.customerid ,
 concat(c.firstname," ",c.lastname) as Customer_Name ,
 c.email , c.phonenumber ,c.city ,c.state ,
 count(p.category) as Category_count
 from customers c 
 join 
 sales s 
 on c.CustomerID = s.CustomerID
join
 products p 
 on s.ProductID = p.ProductID
 group by c.customerid ,Customer_Name ,
 c.email , c.phonenumber ,c.city ,c.state) cte
 where category_count > 1;
 
 -- 12.Get the total quantity sold and the sales amount for each product in a specific region.
 select p.productname ,sr.region ,
 sum(s.quantity) as Total_quantity ,
 sum(totalamount) as Total_Sales 
 from sales s 
 join
 products p 
 on s.ProductID = p.ProductID
 join 
 sales_reprentative sr
 on s.SalesRepID = sr.SalesRepID
 group by p.productname ,sr.region;
 
 -- 13.List all sales made for a specific product category, including customer details and total amount.
 select concat(c.firstname," ",c.lastname) as Customer_Name ,
 c.email ,c.phonenumber ,c.city ,c.state ,
 p.category ,sum(s.totalamount) as Total_Sales
 from products p 
 join sales s 
 on p.ProductID = s.ProductID
 join 
 customers c
 on s.CustomerID = c.CustomerID
 group by Customer_Name ,
 c.email ,c.phonenumber ,c.city ,c.state ,
 p.category
 order by category;
 
 -- 14.Find the customers who purchased the highest quantity of a specific product.
 select concat(firstname," ",lastname) as Customer_Name , 
 quantity ,ProductName 
 from sales s 
 join products p 
 on s.ProductID = p.ProductID
 join 
 customers c 
 on s.CustomerID = c.CustomerID
 where Quantity=(select max(quantity) from sales);
 
 -- 15.Get the total number of sales made by each sales representative for a specific time period.
 select monthname(s.date) as Month ,
 concat(firstname," ",lastname) as Sales_Representative_Name , 
 sum(quantity) as Total_Sales
 from sales_reprentative sr
 join
 sales s 
 on sr.SalesRepID = s.SalesRepID
 group by Month , Sales_Representative_Name;
 
 -- 16.List all the products purchased by customers from a specific city.
select concat(firstname," ",lastname) as Customer_name ,
 p.productname , c.City ,sum(quantity) as Total_Sales
 from products p 
join 
sales s 
on p.ProductID = s.ProductID
join
customers c 
on s.CustomerID = c.CustomerID
group by Customer_name , C.City ,p.productname
order by c.city;

-- 17.Retrieve the sales details of customers who made purchases in two or more store locations.
select c.CustomerID ,concat(firstname," ",lastname) as Customer_Name ,
c.email ,c.PhoneNumber, c.City ,c.State 
from (select customerid , StoreLocation ,
count(storelocation) as No_Purchase 
from sales s
group by CustomerID ,StoreLocation
having No_Purchase >= 2) cte
join 
customers c 
on cte.CustomerID = c.CustomerID;

-- 18.Find the top 5 products that generated the highest sales amount, along with their category.
select p.category ,sum(s.totalamount) over (partition by productname) as Total_Amount 
from sales s 
join 
products p 
on s.ProductID = p.ProductID;
-- its showing the same result in with categories too.
select p.productname ,p.category ,sum(s.totalamount) as Total_Amount
from sales s 
join 
products p 
on s.ProductID = p.ProductID
group by p.productname ,p.category;