--Вариант 4. ДоронинВА2008
--1. Стандартные характеристики для редактирования на сайте MySQL
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
--2. Выявление первичного ключа
CREATE TABLE `Больничная_палата` (
  `Пациент_ID` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ФИО_пациента` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Палата` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Этаж` tinyint(4) NOT NULL,
  `Ответственный_врач` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--3. Выявление транзитивной зависимости
INSERT INTO `Больничная_палата` (`Пациент_ID`, `ФИО_пациента`, `Палата`, `Этаж`, `Ответственный_врач`) VALUES
('P77', 'Котов И.И.', '101', 1, 'Сидоров А.А.'),
('P78', 'Петрова А.А.', '205', 2, 'Иванова В.К.'),
('P79', 'Жуков Л.Л.', '101', 1, 'Сидоров А.А.');
--4. Приведение сущности к ЗНФ
ALTER TABLE `Больничная_палата`
    DROP COLUMN `Этаж`,
    DROP COLUMN `Ответственный_врач`;
  ADD PRIMARY KEY (`Пациент_ID`);
COMMIT;