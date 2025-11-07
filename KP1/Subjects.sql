-- 3) Наполним предметы (идемпотентно)
INSERT INTO subjects (name) VALUES
  ('Математика'),
  ('Информатика'),
  ('Физика')
ON DUPLICATE KEY UPDATE name = VALUES(name);