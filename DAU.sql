-- активные пользователи по дням
SELECT
  order_date::date AS order_dttm,
  COUNT(DISTINCT buyer_id) AS dau
FROM marketplace.orders
WHERE order_date BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY order_dttm
ORDER BY order_dttm;