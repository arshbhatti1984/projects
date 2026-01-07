create database Movie_verse;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    country VARCHAR(50),
    subscription_type VARCHAR(20)
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    genre VARCHAR(50),
    release_year INT,
    rating DECIMAL(3,1),
    duration INT
);

CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    plan_name VARCHAR(50),
    price DECIMAL(10,2),
    start_date DATE,
    end_date DATE
);

CREATE TABLE WatchHistory (
    watch_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    watch_date DATE,
    watch_time_minutes INT
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    method VARCHAR(50),
    status VARCHAR(20)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    review_text TEXT,
    stars INT,
    review_date DATE
);
--

INSERT INTO Users (name, email, country, subscription_type) VALUES
('Amit Sharma', 'amit@gmail.com', 'India', 'Premium'),
('Sara Khan', 'sara@yahoo.com', 'India', 'Standard'),
('John Smith', 'john@gmail.com', 'USA', 'Free'),
('Emily Davis', 'emily@hotmail.com', 'UK', 'Premium'),
('Raj Patel', 'raj@gmail.com', 'India', 'Standard'),
('Sophia Brown', 'sophia@gmail.com', 'Canada', 'Premium'),
('Michael Lee', 'mike@gmail.com', 'Australia', 'Free'),
('Anjali Mehta', 'anjali@gmail.com', 'India', 'Premium'),
('David Johnson', 'david@gmail.com', 'USA', 'Standard'),
('Priya Verma', 'priya@yahoo.com', 'India', 'Free'),
('Alex Kim', 'alex@gmail.com', 'South Korea', 'Premium'),
('Liam Miller', 'liam@gmail.com', 'UK', 'Standard');

--
INSERT INTO Movies (title, genre, release_year, rating, duration) VALUES
('Inception', 'Sci-Fi', 2010, 8.8, 148),
('Avengers: Endgame', 'Action', 2019, 8.4, 181),
('The Dark Knight', 'Action', 2008, 9.0, 152),
('Parasite', 'Thriller', 2019, 8.6, 132),
('Interstellar', 'Sci-Fi', 2014, 8.7, 169),
('Dangal', 'Drama', 2016, 8.5, 161),
('Joker', 'Drama', 2019, 8.4, 122),
('KGF Chapter 2', 'Action', 2022, 8.2, 168),
('Pushpa', 'Action', 2021, 7.9, 179),
('3 Idiots', 'Comedy', 2009, 8.4, 170),
('Oppenheimer', 'Biography', 2023, 8.8, 180),
('Spider-Man: No Way Home', 'Action', 2021, 8.3, 148),
('Barbie', 'Comedy', 2023, 7.1, 114);

--

INSERT INTO Subscriptions (user_id, plan_name, price, start_date, end_date) VALUES
(1, 'Premium', 999.00, '2024-01-01', '2024-12-31'),
(2, 'Standard', 499.00, '2024-02-01', '2024-08-01'),
(3, 'Free', 0.00, '2024-03-15', '2024-09-15'),
(4, 'Premium', 999.00, '2024-04-01', '2025-03-31'),
(5, 'Standard', 499.00, '2024-01-15', '2024-07-15'),
(6, 'Premium', 999.00, '2024-03-10', '2025-03-10'),
(7, 'Free', 0.00, '2024-05-01', '2024-11-01'),
(8, 'Premium', 999.00, '2024-02-20', '2025-02-20'),
(9, 'Standard', 499.00, '2024-04-25', '2024-10-25'),
(10, 'Free', 0.00, '2024-06-01', '2024-12-01'),
(11, 'Premium', 999.00, '2024-03-01', '2025-03-01'),
(12, 'Standard', 499.00, '2024-05-10', '2024-11-10');

--
INSERT INTO WatchHistory (user_id, movie_id, watch_date, watch_time_minutes) VALUES
(1, 1, '2024-03-01', 120),
(1, 2, '2024-03-02', 150),
(2, 4, '2024-03-03', 132),
(3, 3, '2024-03-05', 90),
(4, 5, '2024-03-06', 160),
(5, 6, '2024-03-07', 140),
(6, 7, '2024-03-08', 122),
(7, 8, '2024-03-09', 168),
(8, 9, '2024-03-10', 179),
(9, 10, '2024-03-11', 100),
(10, 11, '2024-03-12', 180),
(11, 12, '2024-03-13', 148),
(12, 13, '2024-03-14', 114);

--
INSERT INTO Payments (user_id, amount, payment_date, method, status) VALUES
(1, 999.00, '2024-01-01', 'Credit Card', 'Success'),
(2, 499.00, '2024-02-01', 'UPI', 'Success'),
(3, 0.00, '2024-03-15', 'Free', 'N/A'),
(4, 999.00, '2024-04-01', 'Credit Card', 'Success'),
(5, 499.00, '2024-01-15', 'Debit Card', 'Success'),
(6, 999.00, '2024-03-10', 'Paytm', 'Success'),
(7, 0.00, '2024-05-01', 'Free', 'N/A'),
(8, 999.00, '2024-02-20', 'UPI', 'Success'),
(9, 499.00, '2024-04-25', 'Credit Card', 'Success'),
(10, 0.00, '2024-06-01', 'Free', 'N/A'),
(11, 999.00, '2024-03-01', 'Debit Card', 'Success'),
(12, 499.00, '2024-05-10', 'Credit Card', 'Success');

--
INSERT INTO Reviews (user_id, movie_id, review_text, stars, review_date) VALUES
(1, 1, 'Mind-blowing visuals and story!', 5, '2024-03-01'),
(2, 2, 'Epic conclusion to the Marvel saga.', 4, '2024-03-03'),
(3, 3, 'Best superhero movie ever.', 5, '2024-03-05'),
(4, 4, 'Brilliant social commentary.', 5, '2024-03-06'),
(5, 5, 'A masterpiece in science fiction.', 5, '2024-03-07'),
(6, 6, 'Very inspiring and emotional.', 4, '2024-03-08'),
(7, 7, 'Dark but powerful.', 4, '2024-03-09'),
(8, 8, 'Mass action entertainer.', 5, '2024-03-10'),
(9, 9, 'Stylish and engaging.', 4, '2024-03-11'),
(10, 10, 'A fun and heartwarming film.', 4, '2024-03-12'),
(11, 11, 'Brilliant direction by Nolan.', 5, '2024-03-13'),
(12, 12, 'Pure nostalgia for Spider-Man fans.', 5, '2024-03-14');

-- Update the rating of a movie
 set sql_safe_updates = 0;
update movies
set rating = 9.1
where movie_id = 1;

-- 

delete from users
where name = 'john Smith';

--
select *
from movies
where release_year > 2020;

select*
from users;

select *
from movies;

select *
from subscriptions;

select *
from watchhistory;

select *
from payments;

select *
from reviews;


-- Filtering and Searching
-- 1) List all users with “Premium” subscriptions.
select * 
from subscriptions
where plan_name = 'Premium';

-- 2) Show all movies in the “Action” or “Drama” genre. 
select * 
from movies
where genre in ('Action' , 'Drama');

-- 3) Display movies with a rating above 8.0

select *
from movies
having rating >8.0;

-- 4) Find users who watched more than 5 movies. 
select user_id, count(movie_id) as total_movies
from watchhistory
group by user_id
having count(movie_id)>5;


-- 5) Retrieve payments made through the “Credit Card” method. 

select *
from payments
having method = 'credit card';
--

-- Aggeregation
-- 1) Count how many users are subscribed to each plan.
select plan_name,
count(user_id) as users_count
from subscriptions
group by plan_name;

-- 2) Find the average movie rating per genre. 

select genre,
avg(rating) as avg_rating
from movies
group by genre
order by avg_rating desc;

-- 3) Find the total revenue earned from subscriptions.

select sum(price) as total_revinue
from subscriptions;

-- 4) Find the total watch time per user. 
select user_id,
sum(watch_time_minutes) as total_watch_time_minutes
from watchhistory
group by user_id
order by total_watch_time_minutes desc;

--- 

-- Joins

-- 1) List all users and the movies they have watched. 

select user_id,name,
movie_id,title,genre
from users
join movies
	on user_id = movie_id
;

-- 2) Show payment details along with user names and plan names. 
select p.payment_id, p.user_id,
u.name, s.plan_name,p.payment_date,
p.status,p.amount, s.start_date, s.end_date
from payments as p
join users as u
	on p.user_id = u.user_id
join subscriptions as s
	on p.user_id = s.user_id
order by p.payment_date;

-- 3) Display all movies along with their reviews and reviewer names. 

select m.movie_id, m.title,
r.review_id, r.review_text, r.stars, r.review_date,
u.user_id as reviewer_id, u.name as reviewer_name
from Movies m
join Reviews r 
on m.movie_id = r.movie_id
join Users u 
on r.user_id = u.user_id
order by m.movie_id, r.review_date;

-- 4) List users and their total time spent watching movies. 
select u.user_id, u.name,
SUM(w.watch_time_minutes) as total_watch_time_minutes
from Users u
join WatchHistory w 
on u.user_id = w.user_id
group by u.user_id, u.name
order by total_watch_time_minutes DESC;

-- Subqueries
-- 1) Find movies with a rating higher than the average rating

select movie_id, title, rating
from movies 
where rating >
			(select 
			avg(rating)
			from movies
			)
;

-- 2) Find users who have spent more than ₹700 on subscriptions. 

select user_id, name subscription_type
from users
where user_id in
				(select user_id
                from subscriptions
                group by user_id
                having sum(price) >700 
                )
;

-- 3)  Find the most-watched movie by total watch time.

select movie_id, title , duration
from movies
where movie_id =
				(
                select movie_id
                from watchhistory
                group by movie_id
                order by sum(watch_time_minutes) desc
                limit 1
                )
;

-- Union

-- 1 Combine movie titles and genre names into a single column called MovieData. 

select title as movie_data 
from movies
union 
select genre as movie_data from movies;

-- 2) Combine all user_id values from Subscriptions and Payments tables. 

select  user_id from subscriptions
union
select user_id from payments;

-- Case
-- 1) Categories movies by rating
select movie_id, title, rating,
case 
	when rating between 0 and 5.0 then 'Below Average'
	when rating between 5.1 and 8 then 'Good'
	when rating between 8.1 and 10 then 'Excellent'
end as Rating_categorty
from movies
;

-- 2) categorize users by subcription type

select user_id, name, subscription_type,
case 
	when subscription_type = 'free' then 'Limited Access'
	when subscription_type = 'Standard' then 'Full Access'
	when subscription_type = 'premium' then 'All Access + HD'
end as Access_level
from users
;

-- 3)  Classify users based on total watch time

select u.user_id, u.name,
sum(w.watch_time_minutes) as Total_watch_time,
case
	when sum(w.watch_time_minutes) <100 then 'Light Viwer'
    when sum(w.watch_time_minutes) between 100 and 500 then 'Regular Viewer'
	when sum(w.watch_time_minutes) > 500  then 'Binge Watcher'
end as viewer_category 
from users as u
join watchhistory as w
	on u.user_id = w.user_id
group by u.user_id, u.name
;

-- String Function
-- 1 Display all movie titles in uppercase.

select movie_id, title, upper(title) as capitlised
from movies
;

-- 2) Extract the first 4 letters of each user’s name. 

select user_id, name , left(name,4) as first_four_letters
from users
;

-- 3) Concatenate user name and subscription type.

select user_id, name, subscription_type, concat(name, " " ,subscription_type ) as name_with_plan
from users
;

-- 4) Find all users whose email IDs contain 'gmail'.

select user_id, name, email
from users
where instr(email, 'gmail')
;

-- Windows Functions

-- 1) Rank movies based on their ratings.
select movie_id, title,rating,
rank() over (order by rating desc) as rating_rank
from movies
;

-- 2) Use ROW_NUMBER() to list each user’s watched movies in order. 
select u.user_id, u.name as user_name,
w.movie_id, m.title as movie_title,
w.watch_date,
row_number() over (partition by w.user_id order by w.watch_date) as watch_order
from watchhistory as w
join users as u
	on w.user_id=u.user_id
join movies as m
	on w.watch_id=m.movie_id
;

-- 3) Use SUM() OVER (PARTITION BY user_id) to calculate total watch time.

select user_id, movie_id, watch_time_minutes,
sum(watch_time_minutes) over (partition by user_id) as total_watch_time
from watchhistory
;

-- 4) Find top 3 most-watched movies using RANK(). 
select w.movie_id, m.title, w.watch_time_minutes,
rank() over (order by w. watch_time_minutes desc) as Rank_position
from watchhistory as w
join movies as m 
	on w.movie_id=m.movie_id
order by Rank_position
limit 3
;





