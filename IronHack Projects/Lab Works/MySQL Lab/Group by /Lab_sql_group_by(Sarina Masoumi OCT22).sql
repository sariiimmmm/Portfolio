use sakila;

#1
select last_name from actor
group by last_name
having count(last_name) like 1;

#2
select last_name from actor
group by last_name
having count(last_name) >1 ;

#3
select staff_id, count(rental_id) as 'num' from rental
group by staff_id;

#4
select rating, count(rating) as 'num_rate' from film
group by rating;

#5
select rating, round(avg(length),2) as 'average_length' from film 
group by rating;


#6
select rating from film 
group by rating 
having avg(length)>120;





