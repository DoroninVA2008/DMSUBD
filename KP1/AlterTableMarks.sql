-- 2a) Если таблица marks уже существовала и в ней нет нужных полей/связей — добавим через ALTER
-- Примечание: IF NOT EXISTS у ADD CONSTRAINT нет, поэтому запускайте по мере необходимости.
ALTER TABLE marks
  ADD COLUMN IF NOT EXISTS student_id INT NOT NULL,
  ADD COLUMN IF NOT EXISTS subject_id INT NOT NULL,
  ADD COLUMN IF NOT EXISTS grade TINYINT UNSIGNED NOT NULL,
  ADD COLUMN IF NOT EXISTS graded_at DATE DEFAULT (CURRENT_DATE),
  ADD INDEX IF NOT EXISTS idx_marks_student (student_id),
  ADD INDEX IF NOT EXISTS idx_marks_subject (subject_id);

-- Пробуем навесить внешние ключи (если их не было)
-- При ошибке "Duplicate" значит связь уже есть — строку можно пропустить
ALTER TABLE marks
  ADD CONSTRAINT fk_marks_student FOREIGN KEY (student_id)
    REFERENCES students(id)
    ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE marks
  ADD CONSTRAINT fk_marks_subject FOREIGN KEY (subject_id)
    REFERENCES subjects(id)
    ON DELETE RESTRICT ON UPDATE CASCADE;