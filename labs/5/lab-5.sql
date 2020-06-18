-- 2.  Добавьте таблицы
CREATE TABLE dvd (
	dvd_id	INTEGER identity(1,1)  PRIMARY KEY ,
	title	VARCHAR(100) NOT NULL,
	director VARCHAR(50) NOT NULL
	production_year	INTEGER NOT NULL
);

CREATE TABLE customer (
	customer_id	INTEGER identity(1,1) PRIMARY KEY ,
	first_name	VARCHAR(50) NOT NULL,
	last_name	VARCHAR(50) NOT NULL,
	gender	VARCHAR(20) NOT NULL,
	registration_date	DATE NOT NULL
);

CREATE TABLE offer (
	offer_id	INTEGER identity(1,1) PRIMARY KEY ,
	dvd_id	INTEGER NOT NULL,
	customer_id	INTEGER NOT NULL,
	offer_date	DATE NOT NULL,
	cost MONEY NOT NULL
	return_date	DATE ,
);

-- 3.  Подготовьте SQL запросы для заполнения таблиц данными.
INSERT INTO dvd (title, production_year) 
VALUES 
	('Один дома', 'Крис Коламбус', 1990), 
	('Один дома 2', 'Крис Коламбус',1992), 
	('Один дома 3', 'Раджа Госнелл', 1997), 
	('Отель «Гранд Будапешт»', 'Уэс Андерсон', 2014), 
	('Остров собак', 'Уэс Андерсон', 2018), 
	('Автостопом по галлактике', 'Гарт Дженнингс', 2005), 

SELECT * FROM dvd

INSERT INTO customer (first_name, last_name, passport_code, registration_date) 
VALUES
	('Андрей', 'Токарев', 'мужской', '2014-01-05'), 
	('Вячеслав', 'Анисимов', 'мужской', '2009-07-02'),
	('Станислав', 'Котов', 'мужской', '2020-04-25'),
	('Мария', 'Володина', 'женский', '2019-11-11'), 
	('Анастасия', 'Королёва', 'женский', '2015-10-16'),  

SELECT * FROM customer

INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) 
VALUES 
	(1, 2, '2020-01-14', '114.6', '2020-01-16'), 
	(2, 1, '2020-02-13', '117.1', '2020-02-15'), 
	(3, 3, '2020-03-30', '87.9', '2020-03-30'),
	(4, 2, '2020-05-16', '200.5', '2020-05-25'),
	(5, 7, '2020-06-27', '450.1', NULL),
	(8, 9, '2020-03-12', '999.9', NULL),
	(6, 3, '2020-02-08', '474.0', '2020-04-04');

SELECT * FROM offer

-- 4.  Подготовьте SQL запрос получения списка всех DVD, год выпуска которых 2010, 
--	отсортированных в алфавитном порядке по названию DVD.
SELECT * 
FROM dvd 
WHERE production_year = 2010 
ORDER BY title ASC;

--5.  Подготовьте SQL запрос для получения списка DVD дисков, которые в настоящее время
--	находятся у клиентов.
SELECT offer.return_date, dvd.title
FROM offer JOIN dvd ON offer.dvd_id = dvd.dvd_id
WHERE offer.return_date IS NULL;

--6.  Напишите SQL запрос для получения списка клиентов, которые брали какие-либо DVD 
--	диски в текущем году. В результатах запроса необходимо также отразить какие диски 
--	брали клиенты.
SELECT customer.first_name, customer.last_name, customer.passport_code, customer.registration_date,
       dvd.title, dvd.production_year 
FROM customer 
LEFT JOIN offer ON offer.customer_id = customer.customer_id
LEFT JOIN dvd ON offer.dvd_id = dvd.dvd_id     
WHERE 
datediff(YEAR, offer_date, GETDATE()) = GETDATE() ;
	
