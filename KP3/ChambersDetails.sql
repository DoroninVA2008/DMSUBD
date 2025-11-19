CREATE TABLE `Палаты_Детали` (
      Палата varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
      Этаж tinyint(4) NOT NULL,
      Ответственный_врач varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
      PRIMARY KEY (Палата)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `Палаты_Детали` (Палата, Этаж, Ответственный_врач)
    SELECT DISTINCT `Палата`, `Этаж`, `Ответственный_врач`
    FROM `Больничная_палата`;