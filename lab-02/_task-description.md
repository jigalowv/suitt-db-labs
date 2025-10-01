# Лабораторная работа 2. 
Создание собственной базы данных СУБД PostgreSQL
## Вариант 20
Розробити інформаційну систему фріланс-біржі (замовники, виконавці, коментарі, портфоліо тощо).

## Описание задания
1. Создать таблицу "Описание сущностей, атрибутов и ограничений" (смотри пример курсового проекта табл 3.1)
2. Создать объекты своей БД с помощью языка DDL для СУБД PostgreSQL (методичка по лекциям и методичка по КП)
3. Заполнить таблицы информацией (не менее 15 строк) с помощью команд языка DML - INSERT, UPDATE

### Ссылки:
#### [Описание сущностей](./entities-description.md)
#### Схемы (DML):
- [Таблицы](./db/schemas/index.sql)
- [Типы](./db/schemas/types.sql)
#### Seeds (DDL):
- [пользователи](./db/seeds/member_seed.sql)
- [заказчики](./db/seeds/customer_seed.sql)
- [исполнители](./db/seeds/performer_seed.sql)
- [навыки](./db/seeds/skill_seed.sql)
- [навыки у исполнителей](./db/seeds/performer_skill_seed.sql)
- [задания](./db/seeds/customer_order_seed.sql)
- [требуемые для заданий навыки](./db/seeds/required_skill_seed.sql)
- [тип контакта](./db/seeds/contact_type_seed.sql)
- [контакт пользователя](./db/seeds/contact_seed.sql)
- [комментарий под профилем](./db/seeds/comment_seed.sql)
- [диапазоны дохода](./db/seeds/income_range_seed.sql)
- [запрос на выполнение задания](./db/seeds/perform_request_seed.sql)