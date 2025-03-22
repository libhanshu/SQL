SELECT * FROM myntra.data;
select product_tag ,rating from data
group by product_tag , rating
order by rating desc
limit 5;
select product_tag from data
order by product_tag desc
limit 10;
select product_tag , rating ,brand_name from data
where product_tag ="tshirts"
group by product_tag ,brand_name
having brand_name in ("adidas" , "nike")
order by rating desc
limit 10;
select brand_name ,marked_price from data
where product_tag = "tshirts"
and brand_name in ("nike","adidas")
and marked_price between 1400 and 1700
order by brand_name;
select count(distinct brand_name) from data ;
select brand_name , count(distinct product_tag) as "nop_per_brand" from data
group by brand_name
order by nop_per_brand desc
limit 5;
select brand_name ,count(distinct product_tag) as "a_s"from data
group by brand_name
order by a_s desc;
select * from data;
select brand_name , max(marked_price) as"expensive_brand" from data
group by brand_name
order by expensive_brand
limit 5;
select brand_name ,sum(marked_price*rating_count) as "revenue" from data
group by brand_name
order by revenue desc
limit 5;
select * from data;
select product_tag ,sum(rating_count) as "top_seller" from data
group by product_tag
order by top_seller desc
limit 10;
select brand_name ,product_tag ,sum(discount_amount) as "max_discount" from data
group by brand_name ,product_tag
order by brand_name;
select brand_name ,discount_amount from data
order by discount_amount desc
limit 10;
select product_tag ,max(marked_price) "most_expensive" from data
group by product_tag
order by most_expensive desc ;
select brand_name , prduct_tag from data
group by brand_name ;
select brand_name ,marked_price from data 
where marked_price > (select avg(marked_price) from data)
;
select count(*) 
from (
select brand_name from data 
where marked_price > (select avg(marked_price) from data)
) as subquery; 
select * from data;
select product_tag , discount_percent from data
where discount_percent > (select avg(discount_percent) from data
where product_tag = "wallets")
order by discount_percent;
select brand_name ,product_tag ,max(rating_count) as "highest_seller" from data
group by brand_name ,product_tag
order by highest_seller desc;
select brand_name ,rating_count from data
where product_tag = "tshirts"
group by brand_name ,rating_count
having max(rating_count)
order by rating_count desc
limit 5;
select product_tag ,max(rating_count) as "most_popular" from data
group by product_tag
order by most_popular desc
limit 1;
select rating ,count(product_tag) as "product_sold " from data
group by rating
order by rating;
select rating ,count(product_tag) as "product_sold" from data
where product_tag ="tshirts"
group by rating
order by rating;