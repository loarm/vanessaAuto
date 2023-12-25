﻿#language: ru

@tree

Функционал: добавление нового контрагента

Как Менеджер я хочу
добавить нового клиента 
чтобы вести клиентскую базу 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я подключаю TestClient "Admin" логин "Администратор" пароль ""
	

Сценарий: проверка создания клиента

	И я закрываю все окна клиентского приложения
* Открытие формы создания контрагента
	И В командном интерфейсе я выбираю 'Продажи' 'Контрагенты'
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСоздать'	
* Заполнение нименования
	Когда открылось окно 'Контрагент (создание)'
	И в поле с именем 'Наименование' я ввожу текст 'ООО \"Фуршеты\"'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Закупочная'	
* Заполнение номера телефона
	И в поле с именем 'Телефон' я ввожу текст '1111111111111111'
* Сохранение
	И я нажимаю на кнопку с именем 'ФормаЗаписать'	
* Проверка создания клиента по коду
	И я запоминаю значение поля "Код" как 'Код'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'ООО "Фуршеты" (Контрагент)' в течение 20 секунд
	Тогда таблица "Список" содержит строки
		| 'Код'  |
		|'$Код$' |
	
			
	
