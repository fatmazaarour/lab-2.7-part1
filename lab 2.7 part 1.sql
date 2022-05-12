use sakila;
/*
How many films are there for each of the categories in the category table. Use appropriate join to write this query.
*/

select * from sakila.category;
select * from sakila.film;
select * from sakila.film_category;


select * from sakila.category as c
join sakila.film as f 
on c.category_id = f.category_id;

select f.film_id , COUNT( c.category_id) as "number_categ"
from sakila.category as c
join sakila.film_category as f 
on c.category_id = f.category_id
GROUP BY c.category_id
ORDER BY f.film_id ASC;

select c.category_id , COUNT( f.film_id) as "number_film"
from sakila.category as c
join sakila.film_category as f 
on c.category_id = f.category_id
GROUP BY c.category_id
ORDER BY f.film_id ASC;


select f.film_id, c.category_id 
from sakila.category as c
join sakila.film_category as f 
on c.category_id = f.category_id
GROUP BY c.category_id
ORDER BY f.film_id ASC;



/*
Display the total amount rung up by each staff member in August of 2005.
*/

select * from sakila.payment;
select * from sakila.staff;

select p.amount, p.staff_id, p.payment_date
from sakila.payment as p
join sakila.staff as a 
on p.staff_id= a.staff_id
where p.payment_date like '2005-08%';


/*
Which actor has appeared in the most films?
*/
select* from sakila.actor;
select* from sakila.film_actor;
select* from sakila.film;



select a.first_name, f.film_id, fil.title, a.actor_id
from sakila.actor as a
join sakila.film_actor as f
on a.actor_id= f.actor_id
join sakila.film as fil
on f.film_id= fil.film_id
order by a.actor_id asc;

/*
Most active customer (the customer that has rented the most number of films)
*/

select *from sakila.customer;
select *from sakila.rental;
select *from sakila.film;

select customer_id, rental_id from sakila.rental
order by customer_id asc;
/* I DIDN'T UNDERSTAND THE QUESTION
*/

/*
Display the first and last names, as well as the address, of each staff member.
*/
select * from sakila.staff;

select staff_id, first_name, last_name, address_id from sakila.staff;

/*
List each film and the number of actors who are listed for that film.
*/
select * from sakila.film;
select * from sakila.actor;
select * from sakila.film_actor;



select f.title, count(fa.actor_id)
from  sakila.film as f
join sakila.film_actor as fa
on f.film_id = fa.film_id
group by title;

/*
Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
List the customers alphabetically by last name.
*/

select * from sakila.payment;
select * from sakila.customer;

select p.amount, count(c.customer_id), c.last_name 
from sakila.payment as p
join sakila.customer as c
on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name;

/*
List number of films per category
*/
select* from sakila.film_category;

select category_id, film_id
from sakila.film_category
group by category_id;


