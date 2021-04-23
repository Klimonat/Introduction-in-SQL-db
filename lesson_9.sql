-- Практическое задание по теме “Транзакции, переменные, представления” 
/*
 * 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
	Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
 */
select * from sample.users;
select * from shop.users;

START TRANSACTION;
INSERT INTO sample.users 
	SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

/*
 * 2. Создайте представление, которое выводит название name товарной позиции из таблицы products 
	и соответствующее название каталога name из таблицы catalogs.
 */

CREATE OR REPLACE VIEW prod_view
AS SELECT p.name as prod_name, c.name  as cat_name
FROM products AS p
JOIN catalogs AS c
ON p.catalog_id = c.id; 

SELECT * FROM prod_view;

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

/*
 * 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
 * в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
 * возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
 * с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
 */

DELIMITER //
CREATE FUNCTION hello() RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
  RETURN CASE 
    WHEN HOUR(CURTIME()) BETWEEN 6 AND 12 THEN 'Доброе утро'
    WHEN HOUR(CURTIME()) BETWEEN 12 AND 18 THEN 'Добрый день'
    WHEN HOUR(CURTIME()) BETWEEN 18 AND 24 THEN 'Добрый вечер'
    ELSE 'Доброй ночи'
END;
END//
DELIMITER ;

SELECT hello();

/*
 * 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 * Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное 
 * значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля 
 * были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
 */
DELIMITER //
CREATE TRIGGER not_both_null
BEFORE INSERT
ON products
FOR EACH ROW
	IF NEW.name is NULL and NEW.desription is NULL THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Both name and description field couldnt be null';
	END IF//
DELIMITER ;
