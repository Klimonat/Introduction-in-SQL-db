/* 
Задача 1
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


