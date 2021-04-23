DROP DATABASE IF EXISTS web_university;
CREATE DATABASE web_university;

USE web_university;

DROP TABLE IF EXISTS university;
CREATE TABLE university (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название университета',
  city VARCHAR(255),
  rating INT UNSIGNED,
  UNIQUE name_city(name, city)
) COMMENT = 'Список университетов';

DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  university_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(255) COMMENT 'Название факультета',
  FOREIGN KEY (university_id) REFERENCES university(id)
) COMMENT = 'Список факультетов';

DROP TABLE IF EXISTS department;
CREATE TABLE department (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  faculty_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(255) COMMENT 'Название кафедры',
  FOREIGN KEY (faculty_id) REFERENCES faculty(id)
) COMMENT = 'Список кафедр';

DROP TABLE IF EXISTS study_group;
CREATE TABLE study_group (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  department_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(255) COMMENT 'Название учебной группы',
  FOREIGN KEY (department_id) REFERENCES department(id)
) COMMENT = 'Список учебных групп';

DROP TABLE IF EXISTS student;
CREATE TABLE student (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  study_group_id BIGINT UNSIGNED NOT NULL,
  surname VARCHAR(255) COMMENT 'фамилия студента',
  name VARCHAR(255) COMMENT 'имя студента',
  fathersname VARCHAR(255) COMMENT 'отчество студента',
  FOREIGN KEY (study_group_id) REFERENCES study_group(id)
) COMMENT = 'Студенты';

DROP TABLE IF EXISTS subject;
CREATE TABLE subject (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) UNIQUE COMMENT 'название предмета'
) COMMENT = 'Учебные предметы';

DROP TABLE IF EXISTS professor;
CREATE TABLE professor (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  surname VARCHAR(255) COMMENT 'фамилия преподавателя',
  name VARCHAR(255) COMMENT 'имя преподавателя',
  fathersname VARCHAR(255) COMMENT 'отчество преподавателя',
  experience BIGINT UNSIGNED COMMENT 'опыт работы',
  academic_degree VARCHAR(255) COMMENT 'ученая степень'
) COMMENT = 'Преподаватели';

DROP TABLE IF EXISTS academic_grant;
CREATE TABLE academic_grant (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) COMMENT 'название стипендии',
  grant_size INT UNSIGNED COMMENT 'Величина стипендии'
) COMMENT = 'Стипендии';

DROP TABLE IF EXISTS professor_to_subject;
CREATE TABLE professor_to_subject (
  subject_id BIGINT UNSIGNED NOT NULL,
  professor_id BIGINT UNSIGNED NOT NULL,
  hours INT UNSIGNED COMMENT 'Выделенные учебные часы',
  PRIMARY KEY (subject_id, professor_id),
  FOREIGN KEY (subject_id) REFERENCES subject(id),
  FOREIGN KEY (professor_id) REFERENCES professor(id)
) COMMENT = 'Связь преподавателей и предметов';

DROP TABLE IF EXISTS study_group_to_subject;
CREATE TABLE study_group_to_subject (
  subject_id BIGINT UNSIGNED NOT NULL,
  study_group_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (subject_id, study_group_id),
  FOREIGN KEY (subject_id) REFERENCES subject(id),
  FOREIGN KEY (study_group_id) REFERENCES study_group(id)
) COMMENT = 'Связь учебных групп и предметов';

DROP TABLE IF EXISTS students_to_academic_grant;
CREATE TABLE students_to_academic_grant (
  student_id BIGINT UNSIGNED NOT NULL,
  academic_grant_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (student_id, academic_grant_id),
  FOREIGN KEY (student_id) REFERENCES student(id),
  FOREIGN KEY (academic_grant_id) REFERENCES academic_grant(id)
) COMMENT = 'Связь студентов и стипендий';
