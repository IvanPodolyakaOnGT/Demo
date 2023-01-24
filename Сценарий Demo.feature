﻿// Даннаный фича файл служит для демонстрации написания кода. В соответствии с NDA некоторые данные заменены на скрыты символом "*"

#language: ru

@tree

Функционал: *

Как * я хочу
* 
чтобы * 

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: *
* Создание инвойса по api
	И я делаю 3 раз
		И я выполняю команду системы
			|newman run https://www.getpostman.com/collections/*|
		И я закрываю все окна клиентского приложения
		И Я открываю навигационную ссылку "*"
		И я нажимаю на кнопку с именем 'ФормаНайти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Номер документа'
		И в поле с именем 'Pattern' я ввожу текст '*'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице "Список" я перехожу к последней строке	
		И в таблице "Список" я выбираю текущую строку
		И Я запоминаю значение выражения 'Формат(ТекущаяДата(), "ДФ=dd.MM.yyyy")' в переменную "Date"
		Если значение поля с именем 'Дата' содержит текст '$Date$' тогда
			Если в таблице '*' количество строк "равно" 0 тогда
				Тогда я прерываю цикл

* Работа скрипта
	И в таблице '*' количество строк "равно" 0
	И я запоминаю значение поля с именем 'Ссылка' как 'LinkForPy'
	И я создаю файл "C:\environments\Project\LinkApiPy.txt"
		|'$LinkForPy$'|
	И я выполняю команду системы
		| 'C:\environments\selenium_env\Scripts\activate.bat & C:\environments\Project\*.py' |
	И я нажимаю на кнопку с именем 'ФормаЗакрыть'
	И я закрываю все окна клиентского приложения

* Выполнение рег заданий
	И Я открываю навигационную ссылку "*"
	И в таблице "тзРегламентныеЗадания" я перехожу к строке:
		| 'Имя метода'   | 'Наименование'                   |
		| '*' 			 | '*' 								|
	И я нажимаю на кнопку с именем 'ФормаВыполнитьСейчас'
	И Я закрываю окно 'Регламентные задания'
	И пауза 15

* Статус платежа
	И Я открываю навигационную ссылку "*"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Номер документа'
	И в поле с именем 'Pattern' я ввожу текст '*'
	И я нажимаю на кнопку с именем 'Find'
	И в таблице "Список" я перехожу к последней строке	
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Платежи" я нажимаю на кнопку с именем 'Обновить'
	И в таблице "Платежи" я выбираю текущую строку
	И элемент формы с именем '*' стал равен '*'
	И я запоминаю значение поля с именем 'Номер' как 'Number'

* Проверка колбека
	И Я открываю навигационную ссылку "*"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Документ'
	И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
	И в поле с именем 'Pattern' я ввожу значение переменной 'Number'
	И я перехожу к следующему реквизиту
	И я нажимаю на кнопку с именем 'Find'
	И в таблице "Список" количество строк "равно" 1 
	И я закрываю все окна клиентского приложения
	Тогда я удаляю файл "C:\environments\Project\LinkApiPy.txt"