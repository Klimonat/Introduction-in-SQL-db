/* 
Задача 1
Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.

В файле записано: 
[client]
user = root
password = пароль
*/


/* 
Задача 2
Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/

drop database if exists example;
create database example;
use example;

create table users (
  id int unsigned not null primary key,
  name varchar(255)
);

insert into users values (1, "Ivan");
insert into users values (2, "Nataliya");


/* 
Задача 3
Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.

Выполненные команды (в консоли, запущенной от администратора):
mysqldump example > dump.sql
mysql sample < dump.sql
*/
