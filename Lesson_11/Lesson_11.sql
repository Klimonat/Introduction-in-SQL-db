-- Практическое задание по теме “Оптимизация запросов”
/* 
   Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products 
   в таблицу logs помещается время и дата создания записи, название таблицы, 
   идентификатор первичного ключа и содержимое поля name.
*/

USE shop;
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  time_create DATETIME,
  name_table VARCHAR(255)
) ENGINE=ARCHIVE;

DROP TRIGGER IF EXISTS new_data_on_users;
CREATE TRIGGER new_data_on_users
BEFORE INSERT
ON users
FOR EACH ROW
	INSERT logs(name, time_create, name_table) 
	VALUES ('element_1', now() , 'users');

DROP TRIGGER IF EXISTS new_data_on_catalogs;
CREATE TRIGGER new_data_on_catalogs
BEFORE INSERT
ON catalogs
FOR EACH ROW
	INSERT logs(name, time_create, name_table) 
	VALUES ('element_2', now() , 'catalogs');

DROP TRIGGER IF EXISTS new_data_on_products;
CREATE TRIGGER new_data_on_products
BEFORE INSERT
ON products
FOR EACH ROW
	INSERT logs(name, time_create, name_table) 
	VALUES ('element_3', now() , 'products');
	
INSERT INTO users(name, birthday_at, created_at, updated_at)
VALUES ('Ефим', '2000-11-12', NOW(), NOW());

INSERT INTO catalogs(name)
VALUES ('Зарядное устройство');

INSERT INTO products(name, desription, price, catalog_id, created_at, updated_at)
VALUES ('Отличный продукт', 'Самый лучший продукт', 100000, 3, NOW(), NOW());