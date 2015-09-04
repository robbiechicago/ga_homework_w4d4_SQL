1. Selects the names of all products that are not on sale.
SELECT name FROM products WHERE on_sale = 't';
2. Selects the names of all products that cost less than £20.
SELECT name FROM products WHERE price < 20;
3. Selects the name and price of the most expensive product.
SELECT name, price FROM products WHERE price = (SELECT max(price) FROM products);
4. Selects the name and price of the second most expensive product.
SELECT name, price FROM products WHERE price = (SELECT max(price) FROM products WHERE price < (SELECT max(price) FROM products));
5. Selects the name and price of the least expensive product.
SELECT name, price FROM products WHERE price = (SELECT min(price) FROM products);
6. Selects the names and prices of all products, ordered by price in descending order.
SELECT name, price FROM products ORDER BY price desc;
7. Selects the average price of all products.
SELECT avg(price) FROM products;
8. Selects the sum of the price of all products.
SELECT sum(price) FROM products;
9. Selects the sum of the price of all products whose prices is less than £20.
SELECT sum(price) FROM products WHERE price < 20;
10. Selects the id of the user with your name.
assuming my name is Dani Zraikat - SELECT id FROM users WHERE name = 'Dani Zraikat';
11. Selects the names of all users whose names start with the letter "J".
SELECT name FROM users WHERE name like 'J%';
12. Selects the number of users whose first names are "Spencer".
SELECT count(name) FROM users WHERE name like 'Spencer%';
13. Selects the number of users who want a "Teddy Bear".
13)
SELECT 
  count(distinct(w.user_id)) 
FROM 
  wishlists w 
  inner join products p on p.id = w.product_id
WHERE
  p.name = 'Teddy Bear';
14. Selects the count of items on the wishlish of the user with your name.
14)
SELECT
  count(distinct(w.product_id))
FROM
  wishlists w
  inner join users u on u.id = w.user_id
WHERE
  u.name = 'Dani Zraikat';
15. Selects the count and name of all products on the wishlist, ordered by count in descending order.
15)
SELECT 
  p.name, 
  count(*) 
FROM 
  wishlists w 
  inner join products p on p.id = w.product_id 
GROUP BY 
  p.name
ORDER BY 
  count(*) desc;
16. Selects the count and name of all products that are not on sale on the wishlist, ordered by count in descending order.
16)
SELECT 
  p.name, 
  count(*) 
FROM 
  wishlists w 
  inner join products p on p.id = w.product_id
WHERE
  p.on_sale = 'f'
GROUP BY 
  w.product_id
ORDER BY 
  count(*) desc;
17. Inserts a user with the name "Jonathan Anderson" into the users table. Ensure the created_at column is set to the current time.
INSERT into users (created_at, name) values (CURRENT_TIMESTAMP, 'Jonathan Anderson');
18. Selects the id of the user with the name "Jonathan Anderson"?
SELECT id FROM users WHERE name = 'Jonathan Anderson';
19. Inserts a wishlist entry for the user with the name "Jonathan Anderson" for the product "The Ruby Programming Language".
INSERT into wishlists (created_at, user_id, product_id) VALUES (CURRENT_TIMESTAMP, 15, 4);
20. Updates the name of the "Jonathan Anderson" user to be "Jon Anderson".
UPDATE users SET name = 'Jon Anderson' WHERE name = 'Jonathan Anderson';
21. Deletes the user with the name "Jon Anderson".
DELETE FROM users WHERE name = 'Jon Anderson';
22. Deletes the wishlist item for the user you just deleted.
DELETE FROM wishlists w inner join users u WHERE u.id is NULL
