-- kr1_setup.sql — привязка оценок к предметам и студентам + наполнение
-- Запускайте в MySQL (phpMyAdmin → вкладка SQL). Требуется InnoDB, MySQL 8.0+

-- 1) Базовые таблицы (если их ещё нет)
CREATE TABLE IF NOT EXISTS students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  group_name VARCHAR(64) NULL,
  UNIQUE KEY uq_students_full_name (full_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS subjects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  UNIQUE KEY uq_subjects_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2) Таблица с оценками (создать, если нет)
CREATE TABLE IF NOT EXISTS marks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  grade TINYINT UNSIGNED NOT NULL,
  graded_at DATE DEFAULT (CURRENT_DATE),
  CHECK (grade BETWEEN 1 AND 5),
  INDEX idx_marks_student (student_id),
  INDEX idx_marks_subject (subject_id),
  CONSTRAINT fk_marks_student FOREIGN KEY (student_id)
    REFERENCES students(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_marks_subject FOREIGN KEY (subject_id)
    REFERENCES subjects(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;