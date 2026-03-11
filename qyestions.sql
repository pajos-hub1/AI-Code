-- * FROM online_store.products;'

-- Find all customers who are active and live in city_id = 300
select * from customer
where active = 1 and address_id IN 
(
select city_id from address
where city_id = 300
)



-- LIKE (search for pattern (text), (% ansd _), IN, BEWTEEN(), AND, ANY, OR 
-- find all cities that start with 'A'
select * from city 
Where city like '%a' 

select * from customer 
Where address_id between 3 and 10  
-- find all customer that their first name is either Mary or Susan
select * from customer 
where first_name IN ("Mary", 'Susan')


-- List all How many  films has the rental_rate greater than 3.00
select count(*) AS Total_films from film
where rental_rate > 3.00

-- Find all actors whose last name starts with 'S'
select * from actor
where last_name like 'S%'

-- Show all payments greater than $8.00
select * from payment 
where amount > 8

-- List all films with a rating of 'PG-13' and length greater than 120 minutes
select * from film 
where rating = 'PG-13' and length > 120

-- List all customers ordered by last name alphabetically
select * from customer 
order by last_name ASC


-- Show all films ordered by rental_rate from highest to lowest
select * from film
order by rental_rate DESC

-- List all payments ordered by amount descending
select * from payment
order by amount desc


-- Show all films ordered by length ascending, then by title alphabetically
select *  from film 
order by length asc, title asc 

-- List all staff ordered by first name
select * from staff 
order by first_name 


-- How many films are in each rating category (G, PG, PG-13, etc.)?
select  count(title) as film_count, rating from film
group by rating
order by count(title) desc

-- What is the total payment amount collected from each customer, show the first name of the customer and the total amount?
-- p payment and  c customer. key column - customer_id 
select c.first_name, sum(p.amount) as total_amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name
order by total_amount desc 


-- How many actors are there per last name?
select last_name, count(*) as actor_count 
from actor 
group by last_name
order by actor_count desc

-- What is the average rental rate per film category, show the category name and the avg_rental_rate?
-- film, film_category, category
-- category_id, film_id 
select * from film_category fc
select * from film f
select * from category c

Select c.name, avg(f.rental_rate) as avg_rental_rate
from film f 
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
group by c.name
order by avg_rental_rate desc 

Select c.name, avg(f.rental_rate) as avg_rental_rate
from category c 
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
group by c.name
order by avg_rental_rate desc

-- How many films does each language have?
-- film and language 
-- key column (language_id)
select * from language  l 
select * from film f 

select l.name as lan_name, count(f.film_id) as film_count
from language l 
JOIN film f 
ON l.language_id = f.language_id 
Group by l.name
order by film_count desc 


-- List all customers with their city and country
-- Show all films along with their category name
-- List all rentals with the customer's full name and film title
-- Show each staff member and the store address they work at
-- Find all actors and the films they appeared in