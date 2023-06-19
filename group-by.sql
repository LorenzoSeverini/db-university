-- gruop by sql 

-- 1 Contare quanti iscritti ci sono stati ogni anno (2018 = 912 , 2019 = 1709 ,2020 = 1645 , 2021 = 734) 👌
SELECT YEAR(enrolment_date) AS Anno, COUNT(*) AS NumeroIscritti
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY Anno;

-- 2 Contare gli insegnanti che hanno l'ufficio nello stesso edificio 💻
SELECT office_address, COUNT(*) AS office_number
FROM teachers
GROUP BY office_address
ORDER BY office_number DESC;

-- 3 Calcolare la media dei voti di ogni appello d'esame 🤠
SELECT exam_id, AVG(vote) AS average_vote
FROM exam_student
GROUP BY exam_id
ORDER BY average_vote DESC;

-- 4 Contare quanti corsi di laurea ci sono per ogni dipartimento 🫡
SELECT department_id, COUNT(*) AS degree_number
FROM degrees
GROUP BY department_id
ORDER BY degree_number DESC;




