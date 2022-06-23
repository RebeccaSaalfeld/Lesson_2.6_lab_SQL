USE sakila;

#In the table actor, which are the actors whose last names are not repeated?
SELECT last_name FROM sakila.actor;

SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

        
#Which last names appear more than once?
SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

				
#Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(staff_id)
FROM sakila.rental
GROUP BY staff_id;


#Using the film table, find out how many films were released each year. (NOTE=: There is only one year!)
SELECT * FROM sakila.film;

SELECT release_year , COUNT(release_year)
FROM sakila.film
GROUP BY release_year;

#Using the film table, find out for each rating how many films were there.
SELECT rating , COUNT(rating)
FROM sakila.film
GROUP BY rating;

#What is the mean length of the film for each rating type. Round off the average lengths to two decimal places:
SELECT rating , round(AVG(length),2) AS 'mean_length'
FROM sakila.film
GROUP BY rating;

#Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating , round(AVG(length),2) AS 'mean_length'
FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;


#Rank films by length (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.

SELECT title, length
FROM sakila.film
WHERE (length IS NOT NULL)
ORDER BY length ASC;
