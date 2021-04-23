USE web_university;

/* Процедура 1 */

/* Получить список всех преподавателей, которые могут преподавать определенной группе
 * (определяется на базе списка предметов, которые читаются у этой группы).
 * Для примера выбрана группа № 10. Всего групп 12. */

DROP PROCEDURE IF EXISTS group_professors;
DELIMITER //
CREATE PROCEDURE group_professors (IN group_number INT)
BEGIN
	SELECT 
		*
	FROM professor
	WHERE id IN (
		SELECT professor_id FROM professor_to_subject
		WHERE subject_id IN (
			SELECT subject_id FROM study_group_to_subject
			WHERE study_group_id = group_number
		)
	);
END //
DELIMITER ;

SET @group_number = 10;
CALL group_professors (@group_number);


/* Процедура 2 */

/* Посчитать суммарную стипендию для каждого из студентов и отсортировать по убыванию. */

DROP PROCEDURE IF EXISTS total_scholarship;
DELIMITER //
CREATE PROCEDURE total_scholarship ()
BEGIN
	SELECT 
		s.*,
		SUM(ag.grant_size) AS sum_money
	FROM student as s
	JOIN students_to_academic_grant AS stag ON s.id = stag.student_id
	JOIN academic_grant AS ag ON stag.academic_grant_id = ag.id 
	GROUP BY s.id
	ORDER BY sum_money DESC;
END //
DELIMITER ;

CALL total_scholarship ();

/* Триггер 1 */

/* Перед добавлением нового студента проверить, чтобы у него были указаны фамилия, имя и учебная группа. 
 * Иначе студента не добавлять, а вывести сообщение */

DROP TRIGGER IF EXISTS add_student;
DELIMITER //
CREATE TRIGGER add_student
BEFORE INSERT
ON student
FOR EACH ROW
BEGIN
	IF NEW.name is NULL or NEW.surname is NULL THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Name and surname could not be null';
	ELSEIF NEW.study_group_id is NULL THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Group could not be null';
	END IF;
END//
	
DELIMITER ;

-- INSERT INTO student (surname, name) VALUES
-- 	('Javonte', 'Javonte');
 
-- INSERT INTO student (study_group_id, surname, name) VALUES
-- 	(NULL, 'Javonte', 'Javonte');
 
-- INSERT INTO student (study_group_id, surname, name) VALUES
-- 	(1, NULL, 'Javonte');

/* Триггер 2 */

/* После добавления преподавателя необходимо случайным образом добавить название предмета, который он будет вести */

DROP TRIGGER IF EXISTS add_professor;
DELIMITER //
CREATE TRIGGER add_professor
AFTER INSERT
ON professor
FOR EACH ROW
BEGIN
	INSERT INTO professor_to_subject (subject_id, professor_id, hours) 
	VALUES (FLOOR(1 + RAND() * 10), (SELECT MAX(id) FROM professor), 18);
END//

DELIMITER ;

-- INSERT INTO professor (name, surname, fathersname, academic_degree, experience) VALUES
-- 	('Penny','Poller','Caren','assistant', 2);