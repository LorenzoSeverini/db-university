-- usare join sql 

-- 1 Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia 🐊
SELECT * FROM students
JOIN degrees ON students.degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Economia';

-- 2 Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze 🍉
SELECT * FROM degrees
JOIN departments ON degrees.department_id = departments.id
WHERE degrees.level = 'magistrale' AND departments.name = 'Dipartimento di Neuroscienze';

-- 3 Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) 👷‍♂️
SELECT * FROM courses
JOIN course_teacher ON courses.id = course_teacher.course_id
WHERE course_teacher.teacher_id = 44;

-- 4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome 🎢
SELECT students.name, students.surname, degrees.name AS degree_name, departments.name AS department_name
FROM students
JOIN degrees ON students.degree_id = degrees.id
JOIN departments ON degrees.department_id = departments.id
ORDER BY students.surname, students.name;

-- 5 Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti 🔔
SELECT degrees.name AS degree_name, courses.name AS course_name, teachers.name AS teacher_name, teachers.surname AS teacher_surname
FROM degrees
JOIN courses ON degrees.id = courses.degree_id
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON course_teacher.teacher_id = teachers.id;

-- 6 . Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) 🦀
SELECT teachers.name, teachers.surname
FROM teachers
JOIN course_teacher ON teachers.id = course_teacher.teacher_id
JOIN courses ON course_teacher.course_id = courses.id
JOIN degrees ON courses.degree_id = degrees.id
JOIN departments ON degrees.department_id = departments.id
WHERE departments.name = 'Dipartimento di Matematica';

-- 7 BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18 😱😨😱😨
SELECT students.name, students.surname, exam_student.exam_id, COUNT(exam_student.exam_id) AS tentativi, MAX(exam_student.vote) AS voto_massimo
FROM students
JOIN exam_student ON students.id = exam_student.student_id
GROUP BY students.id, exam_student.exam_id
HAVING voto_massimo >= 18
ORDER BY students.surname, students.name;
