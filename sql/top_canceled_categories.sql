-- смотрю какие категории чаще всего отменяются
-- это может показать проблемные товары или категории
SELECT
  c.category_id,
  c.name,
  COUNT(DISTINCT o.order_id) AS cancelled_orders_count
FROM marketplace.orders o
JOIN marketplace.order_items oi ON o.order_id = oi.order_id
JOIN marketplace.products p ON oi.product_id = p.product_id
JOIN marketplace.categories c ON p.category_id = c.category_id
WHERE o.status = 'canceled' AND o.order_date BETWEEN '2025-04-01' AND '2025-06-30'
GROUP BY c.category_id, c.name
ORDER BY cancelled_orders_count DESC
LIMIT 10;