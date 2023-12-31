﻿#language: ru

@tree

Функционал: проверка указания количества документа Заказ

Как МенеджерПродаж я хочу
проверить работу поля ТоварыКоличество
чтобы проводить верные расчеты суммы документа Заказы

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я подключаю TestClient "Admin" логин "Администратор" пароль ""
	

Сценарий: проверка расчета суммы документа Заказ

	И я закрываю все окна клиентского приложения
* Открытие формы создания документа Заказ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа 
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Животноводство ООО '
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'	
* Добавление товара в табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000027' | 'Ряженка'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '6'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка расчета суммы 
	Тогда таблица "Товары" стала равной:
		| 'Товар'   | 'Сумма' |
		| 'Ряженка' | '330,00' |
	
		
Сценарий: добавление количества для Услуги
* Открытие формы создания документа Заказ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа 
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Животноводство ООО '
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'	
* Добавления количества для Услуги
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'доставка'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
* Проверка добавления количества для Услуги
	Тогда таблица "Товары" стала равной:
		| 'Товар'    | 'Цена'      | 'Количество' | 'Сумма'     |
		| 'Доставка' | '*'    | '1'           | '*'    |
	
	
		