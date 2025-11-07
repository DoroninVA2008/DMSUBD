-- 4) Наполним студентов (примерные данные)
INSERT INTO students (full_name, group_name) VALUES
  ('Иванов Иван', 'ИС-101'),
  ('Петров Пётр', 'ИС-101'),
  ('Сидорова Анна', 'ИС-102')
ON DUPLICATE KEY UPDATE group_name = VALUES(group_name);