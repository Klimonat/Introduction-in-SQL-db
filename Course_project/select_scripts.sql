USE web_university;

/* Получить всех студентов с обычной стипендией */

SELECT 
	*
FROM student
WHERE id IN (
	SELECT student_id FROM students_to_academic_grant
	WHERE academic_grant_id = 4
);

/* Получить список предметов по id группы (к примеру, 10 группы) */

SELECT 
	s.*, 
	sg.name as group_name
FROM subject AS s
JOIN study_group_to_subject AS sgts ON sgts.subject_id = s.id
JOIN study_group AS sg ON sgts.study_group_id = sg.id AND sg.id = 10;

/* Получить все предметы, которые ведут преподаватели со стажем работы более 20 лет */

SELECT DISTINCT
	s.*
FROM subject AS s
JOIN professor_to_subject AS pts ON pts.subject_id = s.id 
JOIN professor AS p ON pts.professor_id = p.id 
WHERE p.experience > 20;

/* Получить всех студентов, изучающих Математику или Английский язык */

SELECT 
	*
FROM student
WHERE study_group_id IN (
	SELECT study_group_id FROM study_group_to_subject WHERE subject_id = 1
	UNION
	SELECT study_group_id FROM study_group_to_subject WHERE subject_id = 2
);