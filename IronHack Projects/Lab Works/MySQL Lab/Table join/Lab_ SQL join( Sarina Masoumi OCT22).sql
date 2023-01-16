use sakila;


#1
select first_name, last_name, count(film_id) as 'num' from actor 
join film_actor using (actor_id)
group by actor_id
order by num desc
limit 1 ;

#2
select first_name, last_name, count(*) as 'num' from customer
left join rental using (customer_id)
group by customer_id
order by num desc
limit 1 ;

#3
select name,count(*) as 'num' from category
left join film_category using(category_id) 
group by name;

#4
select first_name, last_name, address from staff
left join address using (address_id);

#5
select title, name  from film
join language using (language_Id) 
where title like"M%" and 
name like  'english' or name like 'italian'
order by title desc;

#6
select first_name, last_name, round(sum(amount),2) as 'total' from payment
join staff using (staff_id)
where payment_date like "2005-08%"
group by first_name, last_name;

#7
select title, count(actor_id) as 'actors_num' from film
join film_actor using (film_id)
group by title
order by actors_num desc;

#8
select first_name, last_name, sum(amount) from customer
join payment using (customer_Id)
group by first_name, last_name
order by last_name;

#9
select first_name, last_name,title from actor
left join film_actor using (actor_id)
right join film using (film_id)
where title is null;

#10
select address from address
left join customer using (address_id)
where customer_id is null and address like '%e';

#11
select title, count(title) as 'times_rental' from rental
join inventory using(inventory_id)
join film using (film_id)
group by title
order by times_rental desc
limit 1;
 