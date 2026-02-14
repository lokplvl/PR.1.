PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS "Клиенты" (
    "КлиентId" INTEGER PRIMARY KEY,
    "Телефон" TEXT,
    "ФИО" TEXT NOT NULL,
    "Примечание" TEXT,
    "Создано" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "Задачи" (
    "ЗадачаId" INTEGER PRIMARY KEY,
    "Название" TEXT NOT NULL,
    "Проект" TEXT,
    "Контекст" TEXT,
    "Срок" TEXT,
    "Статус" TEXT NOT NULL,
    "Создано" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "Контакты" (
    "КонтактId" INTEGER PRIMARY KEY,
    "КлиентId" INTEGER NOT NULL,
    "Канал" TEXT NOT NULL,
    "Время" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "Итог" TEXT,
    FOREIGN KEY ("КлиентId") REFERENCES "Клиенты"("КлиентId")
);

CREATE TABLE IF NOT EXISTS "Сделки" (
    "СделкаId" INTEGER PRIMARY KEY,
    "КлиентId" INTEGER NOT NULL,
    "Сумма" NUMERIC NOT NULL,
    "Статус" TEXT NOT NULL,
    "Описание" TEXT,
    "Время" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("КлиентId") REFERENCES "Клиенты"("КлиентId")
);

CREATE TABLE IF NOT EXISTS "ПомодороСессии" (
    "СессияId" INTEGER PRIMARY KEY,
    "ЗадачаId" INTEGER,
    "Начало" TEXT NOT NULL,
    "Конец" TEXT,
    "МинутыРаботы" INTEGER NOT NULL,
    "МинутыОтдыха" INTEGER NOT NULL,
    "Статус" TEXT NOT NULL,
    FOREIGN KEY ("ЗадачаId") REFERENCES "Задачи"("ЗадачаId")
);

CREATE TABLE IF NOT EXISTS "События" (
    "Идентификатор" INTEGER PRIMARY KEY,
    "Время" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ТипСобытия" TEXT NOT NULL,
    "Контекст" TEXT,
    "Источник" TEXT,
    "ТелоJson" TEXT,
    "ПроектId" TEXT,
    "КлиентId" INTEGER,
    "ЗадачаId" INTEGER,
    FOREIGN KEY ("КлиентId") REFERENCES "Клиенты"("КлиентId"),
    FOREIGN KEY ("ЗадачаId") REFERENCES "Задачи"("ЗадачаId")
);

CREATE TABLE IF NOT EXISTS "ОтчётыДня" (
    "Дата" TEXT PRIMARY KEY,
    "ИндексДня" INTEGER NOT NULL,
    "Текст" TEXT NOT NULL,
    "Создано" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
