-- смотрю какие пользователи приносят больше всего выручки
-- это помогает понять самых ценных клиентов

SELECT
    u.email,
    SUM(o.total_amount) AS total_revenue
FROM users u
JOIN orders o
    ON u.user_id = o.buyer_id
WHERE o.order_date BETWEEN '2025-03-01' AND '2025-05-31'
  AND o.status != 'canceled'
GROUP BY u.email
ORDER BY total_revenue DESC
LIMIT 10;