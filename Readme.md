# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

Шаг 2. Создание нового пользователя PostgreSQL и БД "store"

    CREATE USER user1 WITH PASSWORD 'user1';
    CREATE DATABASE store OWNER user1;

Шаг 3. Выдача новому пользователю прав на базу store.

    GRANT ALL PRIVILEGES ON DATABASE store TO user1;

Шаг 10. Запрос, отражающий количество проданных сосисок за каждый день предыдущей недели

    SELECT 
        o.date_created,
        SUM(op.quantity)
    FROM 
        orders o
    JOIN 
        order_product op ON o.id = op.order_id
    WHERE 
        o.status = 'shipped' AND o.date_created BETWEEN CURRENT_DATE - INTERVAL '7 days' AND CURRENT_DATE - INTERVAL '1 day'
    GROUP BY 
        o.date_created
    ORDER BY 
        o.date_created;
