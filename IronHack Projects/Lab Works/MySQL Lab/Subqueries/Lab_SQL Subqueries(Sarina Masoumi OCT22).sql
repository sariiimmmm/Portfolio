use sakila;


#1
select title, length from film 
where length > ( 
 select avg(length) from film);


 
 #2
 select count(film_id) as 'number_of_copy' from inventory
 where film_Id = (
     select film_ID from film
       where title like 'Hunchback Impossible')
group by film_id;



#3
select first_name, last_name from actor 
where actor_id in (
  select actor_id from film_actor
  where film_id in (
    select film_id from film 
     where title like  'Alone Trip'));
     
     
     
     
#4
select title from film
where film_id in (
  select film_id from film_category
    where category_id in (
     select category_id from category
       where name like 'family')
       );



#5-subqueries

select first_name,Last_name, email from customer
 where address_id in (
   select address_id from address
     where city_id in(
       select city_id from city
          where country_id in (
            select country_id from country
              where country like 'Canada')));
              
              
#5-join
select first_name,Last_name, email from customer
join address using (address_Id)
join city using (city_id)
join country using (country_id)
where country like 'Canada';


#6
select title from film
 where film_id in (
  select film_id from film_actor
   where actor_id = (
  select sub1.actor_id from (select actor_id, count(film_id) as 'num_act' from film_actor
       group by actor_id
	   order by num_act desc
       limit 1) as sub1));   
       

   

 select sub1.actor_id from (select actor_id, count(film_id) as 'num_act' from film_actor
       group by actor_id
	   order by num_act desc
       limit 1) as sub1;



#7

select title from film 
  where film_id in (
  select film_id from inventory
  where inventory_id in (
    select inventory_id from rental
     where rental_id in (
       select rental_id from payment
          where customer_id = ( 
              select customer_id from payment
              group by customer_id 
              order by sum(amount) desc
              limit 1))));
    
    
    #8
select customer_id,sum(amount) from payment   
where sum(amount)>(select avg(amount) from payment
group by customer_id );
    
    
    