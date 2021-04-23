USE shop;

/*
 * Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 */
/* 1 вариант */
SELECT name FROM users 
WHERE id IN (SELECT user_id FROM orders);

/* 2 вариант */
SELECT DISTINCT u.name 
FROM users AS u
JOIN orders AS o
ON u.id = o.user_id;

/*
 * Выведите список товаров products и разделов catalogs, который соответствует товару.
*/
SELECT p.id, p.name, c.name 
FROM products AS p
JOIN catalogs AS c
ON p.catalog_id = c.id; 