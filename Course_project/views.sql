USE web_university;

/* Представление 1 */

/* Получить всех преподавателей, которые преподают в МГТУ.
 * Необходимо учитывать, что один преподаватель может преподавать в разных университетах */

CREATE OR REPLACE VIEW professor_from_BMSTU AS
SELECT DISTINCT 
  p.* 
FROM
  professor AS p 
JOIN professor_to_subject AS pts ON p.id = pts.professor_id 
JOIN subject AS s ON pts.subject_id = s.id
JOIN study_group_to_subject AS sgts ON sgts.subject_id = s.id
JOIN study_group AS sg ON sgts.study_group_id = sg.id
JOIN department AS d ON sg.department_id = d.id 
JOIN faculty AS f ON d.faculty_id = f.id
JOIN university AS u ON (f.university_id = u.id) AND (u.id = 2)
ORDER BY p.id;

SELECT * FROM professor_from_BMSTU;

/* Представление 2 */

/* Получить список университетов, в которых есть кафедра 'Экспертные системы' */

CREATE OR REPLACE VIEW university_with_department AS
SELECT
	*
FROM university
WHERE id IN (
	SELECT university_id FROM faculty
	WHERE id IN (
		SELECT faculty_id FROM department
		WHERE name = 'Экспертные системы'
	)
);

SELECT * FROM university_with_department;


