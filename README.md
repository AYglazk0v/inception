
<h1 align="center">
🐳Inception
</h1>

## 💡 О проекте:

> _ Этот проект посвящен системному администрированию и контейнеризации._

	Этот проект направлен на расширение ваших знаний о системном администрировании
	с помощью Docker. Вы будете виртуализировать несколько образов Docker, создав их на
	новой персональной виртуальной машине.
	Этот проект заключается в том, что вам необходимо создать небольшую инфраструктуру,
	состоящую из различных сервисов по определенным правилам:
	Вы должны использовать docker-compose.
	Каждый образ Docker должен иметь то же имя, что и соответсвующий ему сервис.
	Каждая служба должна работать в отдельном контейнере.
	Для повышения производительности контейнеры должны быть собраны либо из
	предпослежней стабильной версии Alpine Linux, либо из Debian Buster. Выбор за вами.
	Вы так же должны написать свои собственные Dockerfiles, по одному на каждый сервис.
	Dockerfiles должны быть вызваны в вашем docker-compose.yml вашим Makefile.
	Это означает, что вы должны сами создавать Docker-образы своего проекта.
	Затем запрещается использовать готовые образы Docker, а также такие сервисы, как
	DockerHub (Alpine/Debian -- исключение из этого правила).


Базовая часть:
- Развернуть Docker контейнер содержащий NGINX только с TLSv1.2 или TLSv1.3.
- Развернуть Docker контейнер содержащий WordPress + php-fpm (без NGINX).
- Развернуть Docker контейнер содержащий MariaDB (без NGINX).
- Использовать два тома для хранения данных: БД и файлы WordPress.
- Создать докер-сеть между контейнерами.
- Реализовать топологию взаимодействия между контейнерами (см. ниже).

<div id="topologiya" align="center">
  <img src="https://github.com/AYglazk0v/inception/blob/main/additionally/topologiya.png" width="400"/>
</div>

Бонусная часть:
 *  Настроить кэш redis для вашего сайта WordPress, чтобы правильно управлять кэшем.
 * Установить контейнер FTP-сервера, указывающий на том вашего сайта WordPress.
 * Развернуть контейнер с простым статическим сайтом на любом ЯП, кроме PHP.
 * Настроить adminer.
 * Развернуть контейнер с сервисом на свой выбор.
	
Более подробно о проекте и нюансах можно посмотреть в  [**subject**](https://github.com/AYglazk0v/inception/blob/main/additionally/en.subject.pdf).

## 🛠 Тестирование и использование:

	# Клонируйте проект и получите доступ к папке
	git clone git@github.com:AYglazk0v/inception.git && cd inception/

	# Для тестирования и сборки необходимо выполнить команду (с учетом, что у вас
	установлен docker и docker-compose):
	make
	
	# Для того, чтобы поднять docker-compose и пересобрать images, если
	были произведены изменения в конфигурациях:
	make re
	
	# Для того, чтобы выключит контейнеры:
	make down
	
	# Для того, чтобы выключить контейнеры и очистить кэш воспользуйтесь командой:
	make clean
	
	# Для того, чтобы полностью очистить систему после тестирования:
	make fclean	
	


