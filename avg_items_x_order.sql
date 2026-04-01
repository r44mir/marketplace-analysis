-- сколько товаров в среднем в одном заказе

SELECT
    ROUND(AVG(items_count), 2) AS avg_items_per_order
FROM (
    SELECT
        order_id,
        SUM(quantity) AS items_count
    FROM order_items
    GROUP BY order_id
) t;