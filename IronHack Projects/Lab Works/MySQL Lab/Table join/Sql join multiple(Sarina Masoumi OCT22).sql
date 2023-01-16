use sakila;

#1
select store_id, city,country from store
join address using (address_id)
join city using (city_id)
join country using (country_id);


#2
select store_id, sum(amount) from payment
left join staff using (staff_ID)
group by store_id;

#3
select name ,avg(length) as 'average_len' from film
join film_category using (film_id)
join category using (category_id)
group by name;

#4
select name ,avg(length) as 'average_len' from film
join film_category using (film_id)
join category using (category_id)
group by name
order by average_len desc
limit 5 ;


#5
select title, count(rental_id) as 'num_rent' from film
join inventory using(film_ID)
join rental using (inventory_id)
group by title
order by num_rent desc
limit 5;



#6
select name, sum(amount) as 'gross_revenue' from payment
join rental using(rental_id)
join inventory using(inventory_id)
join film_category using (film_id)
join category using(category_id)
 group by name
 order by gross_revenue desc
 limit 5;
 
 
 #7
 select title, store_id from rental
join inventory using(inventory_id) 
join store using(store_id)
join film_text using(film_id)
where title like "Academy Dinosaur"
order by return_date desc
limit 1;