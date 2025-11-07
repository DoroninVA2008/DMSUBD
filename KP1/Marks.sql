-- 5) Добавим оценки: Оценка + студент + предмет
-- Используем подзапросы по именам/названиям, чтобы не заботиться об id
INSERT INTO marks (student_id, subject_id, grade, graded_at)
SELECT s.id, sub.id, 5, CURRENT_DATE()
FROM students s
JOIN subjects sub
  ON s.full_name = 'Иванов Иван' AND sub.name = 'Математика'
LIMIT 1;

INSERT INTO marks (student_id, subject_id, grade, graded_at)
SELECT s.id, sub.id, 4, CURRENT_DATE()
FROM students s
JOIN subjects sub
  ON s.full_name = 'Петров Пётр' AND sub.name = 'Информатика'
LIMIT 1;

INSERT INTO marks (student_id, subject_id, grade, graded_at)
SELECT s.id, sub.id, 3, CURRENT_DATE()
FROM students s
JOIN subjects sub
  ON s.full_name = 'Сидорова Анна' AND sub.name = 'Физика'
LIMIT 1;

-- 6) Проверка: сводная выборка «Оценка + студент + предмет»
SELECT m.id,
       s.full_name   AS `Студент`,
       sub.name      AS `Предмет`,
       m.grade       AS `Оценка`,
       m.graded_at   AS `Дата`
FROM marks m
JOIN students s  ON s.id = m.student_id
JOIN subjects sub ON sub.id = m.subject_id
ORDER BY s.full_name, sub.name;
