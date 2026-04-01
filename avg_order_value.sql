-- считаю средний чек через общую выручку / количество заказов
-- так наглядно видно как формируется метрика
SELECT
    ROUND(
        SUM(total_amount)::numeric / COUNT(DISTINCT order_id)::numeric,
        2
    ) AS avg_order_value
FROM orders
WHERE status != 'canceled';