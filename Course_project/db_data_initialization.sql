USE web_university;

INSERT INTO university (name, city, rating) VALUES 
	('МГТУ', 'Калуга', '78'),
	('МГУ', 'Москва', '97'),
	('ВШЭ', 'Мурманск', '83');
	
INSERT INTO faculty (name, university_id) VALUES 
	('Информационные технологии', 1),
	('ВМК', 2),
	('Экономика и финансы', 3);
	
INSERT INTO department (name, faculty_id) VALUES
	('Автоматизированные системы летательных аппаратов', 1),
	('Программная инженерия', 1),
	('Программная инженерия', 2),
	('Экспертные системы', 2),
	('Экспертные системы', 3),
	('Экономика производства', 3);
	
INSERT INTO study_group (name, department_id) VALUES
	('Группа 11', 1),
	('Группа 41', 1),
	('Группа 32', 2),
	('Группа 72', 2),
	('Группа 23', 3),
	('Группа 33', 3),
	('Группа 14', 4),
	('Группа 54', 4),
	('Группа 85', 5),
	('Группа 65', 5),
	('Группа 46', 6),
	('Группа 96', 6);

INSERT INTO student (study_group_id, surname, name, fathersname) VALUES
	(1,'Javonte','Jakubowski','Ratke'),
	(2,'Aurelia','Ratke','Fritsch'),
	(3,'Jacey','Fritsch','Whitney'),
	(4,'Whitney','Jerde','Jonathon'),
	(5,'Axel','Lynch','Jacey'),
	(6,'Karlee','Kunde','Ryann'),
	(7,'Ryann','Prosacco','Karleet'),
	(8,'Ona','Schumm','Adelia'),
	(9,'Kennith','Gaylord','Alphonso'),
	(10,'Alexandre','Rowe','David'),
	(11,'Laurie','Green','Nicolas'),
	(12,'Rahsaan','Schowalter','Gerhold'),
	(1,'David','Carter','Anderson'),
	(2,'Lea','Hilpert','Jed'),
	(3,'Christ','Reilly',''),
	(4,'Madge','Conroy','Joanie'),
	(5,'Luisa','Weber','Gerda'),
	(6,'Rubye','Upton','Roy'),
	(7,'Mikayla','Cole','Jessica'),
	(8,'Roberto','Zemlak','Rubye'),
	(9,'Greg','Bergnaum','Erich'),
	(10,'Tre','Dietrich','Leonardo'),
	(1,'Demond','O\'Kon','Alexandre'),
	(1,'Domingo','Hamill','Margarita');

INSERT INTO subject (name) VALUES
	('Математика'),
	('Английский язык'),
	('Программирование'),
	('Социология'),
	('Физическая культура'),
	('Алгоритмы и структуры данных'),
	('Политология'),
	('Экономика'),
	('Информационные технологии и сети'),
	('Компьютерная безопасность');

INSERT INTO professor (name, surname, fathersname, academic_degree, experience) VALUES
	('Neoma','Heller','Dereck','assistant', 3),
	('Amira','Dickinson','Tomas','professor', 17),
	('Vernie','Grant','Lester','assistant', 1),
	('Kamren','Hirthe','Stamm','associate professor', 9),
	('Eda','Willms','Robert','professor', 62),
	('Nasir','Pagac','Gerald','associate professor', 8),
	('Norval','Cole','Chadrick','assistant', 2),
	('Madelyn','Braun','Casper','professor', 25),
	('Athena','Mosciski','Reynolds','associate professor', 7),
	('Dereck','Huels','Lucile','professor', 27),
	('Abigale','Olson','Rene','assistant', 3),
	('Tomasa','Stamm','Dickinson','professor', 43),
	('Kellie','Runolfsdottir','Sauer','associate professor', 14),
	('Olen','Wilkinson','Ron','professor', 17),
	('Kirsten','Lynch','Braun','associate professor', 10),
	('Michelle','Ziemann','Hessel','assistant', 5),
	('Cordelia','Ullrich','Nathanael','professor', 20),
	('Ashtyn','McLaughlin','Christop','associate professor', 13),
	('Carleton','Lubowitz','Wilkinson','assistant', 4),
	('Chadrick','Hessel','Jacey','professor', 25);

INSERT INTO academic_grant (name, grant_size) VALUES
	('Повышенная стипендия за спортивную деятельность', 5600),
	('Повышенная стипендия за учебную деятельность', 12000),
	('Повышенная стипендия за научную деятельность', 25000),
	('Стипендия для 1 курса', 1700),
	('Стипендия Президента РФ', 8600),
	('Стипендия Правительства РФ', 6800);


INSERT INTO professor_to_subject (subject_id, professor_id, hours) VALUES
	(1, 1, 72),
	(1, 2, 36),
	(2, 3, 144),
	(2, 4, 36),
	(2, 5, 18),
	(3, 6, 36),
	(3, 7, 72),
	(4, 8, 72),
	(4, 9, 144),
	(5, 10, 216),
	(6, 11, 18),
	(6, 12, 36),
	(7, 13, 72),
	(7, 14, 216),
	(8, 15, 18),
	(8, 16, 144),
	(9, 17, 72),
	(9, 18, 108),
	(10, 19, 36),
	(10, 20, 72);


INSERT INTO study_group_to_subject (study_group_id, subject_id) VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(3, 6),
	(4, 7),
	(4, 8),
	(5, 9),
	(5, 10),
	(6, 1),
	(6, 3),
	(7, 4),
	(7, 2),
	(8, 3),
	(8, 4),
	(8, 1),
	(9, 2),
	(10, 6),
	(10, 7),
	(10, 8),
	(11, 9),
	(11, 10),
	(12, 8);

INSERT INTO students_to_academic_grant(student_id, academic_grant_id) VALUES
	(1, 1),
	(1, 5),
	(1, 4),
	(2, 2),
	(2, 1),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(6, 1),
	(6, 3),
	(7, 1),
	(8, 2),
	(9, 3),
	(9, 2),
	(10, 4),
	(11, 5),
	(12, 6),
	(13, 1),
	(14, 2),
	(15, 3),
	(16, 4),
	(17, 5),
	(18, 6),
	(19, 1),
	(20, 2),
	(21, 3),
	(22, 4),
	(23, 5),
	(24, 6);