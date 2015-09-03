SELECT name FROM products WHERE on_sale = 't';
SELECT name FROM products WHERE price < 20;
SELECT name, price FROM products WHERE price = (SELECT max(price) FROM products);
SELECT name, price FROM products WHERE price = (SELECT max(price) FROM products WHERE price < (SELECT max(price) FROM products));
SELECT name, price FROM products WHERE price = (SELECT min(price) FROM products);
SELECT name, price FROM products ORDER BY price desc;
SELECT avg(price) FROM products;
SELECT sum(price) FROM products;
SELECT sum(price) FROM products WHERE price < 20;
assuming my name is Dani Zraikat - SELECT id FROM users WHERE name = 'Dani Zraikat';
SELECT name FROM users WHERE name like 'J%';
SELECT count(name) FROM users WHERE name like 'Spencer%';

13)
SELECT 
  count(distinct(w.user_id)) 
FROM 
  wishlists w 
  inner join products p on p.id = w.product_id
WHERE
  p.name = 'Teddy Bear';

14)
SELECT
  count(distinct(w.product_id))
FROM
  wishlists w
  inner join users u on u.id = w.user_id
WHERE
  u.name = 'Dani Zraikat';

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

17)
INSERT into users (created_at, name) values (CURRENT_TIMESTAMP, 'Jonathan Anderson');

18)
SELECT id FROM users WHERE name = 'Jonathan Anderson';

19)
INSERT into wishlists (created_at, user_id, product_id) VALUES (CURRENT_TIMESTAMP, 15, 4);

20)
UPDATE users SET name = 'Jon Anderson' WHERE name = 'Jonathan Anderson';

21)
DELETE FROM users WHERE name = 'Jon Anderson';

22)
DELETE FROM wishlists WHERE user_id = 15;
