SELECT * FROM rest.restaurants;
alter table restaurants rename to res;
select distinct city from res
order by city;
select * from res;
select name ,(select min(rating_count) from res) as "no_of_visiters"  from res
where city = "abohar"
order by no_of_visiters;
select name ,rating_count*cost as revenue from res
order by revenue desc
limit 1;
select name ,rating from res
where rating > (select avg(rating) from res)
order by rating;
select name ,rating_count*cost as revenue from res
where city = "delhi"
order by revenue desc;
select name ,count(name) as "no_of_res" from res
group by name
order by no_of_res desc;
select name ,sum(rating_count*cost) as "revenue_by_chain" from res
group by name
order by revenue_by_chain desc;
select city ,count(name) as "no_of_res" from res
group by city
order by no_of_res desc;
select city ,sum(rating_count*cost) as "revenue_by_city" from res
group by city
order by revenue_by_city desc;
select * from res;
select cuisine ,cost from res
order by cost;
select cuisine ,cost from res
order by cost desc;
select city from res
where cuisine="biryani"
group by city 
having max(rating_count);
select distinct name ,rating_count*cost as revenue from res
order by revenue desc;