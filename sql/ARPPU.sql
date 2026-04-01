-- средняя выручка на платящего пользователя
WITH paying_users AS (
    SELECT DISTINCT buyer_id
    FROM marketplace.orders
    WHERE order_date BETWEEN '2025-05-01' AND '2025-05-31'
    AND status != 'canceled'
),
revenue_data AS (
    SELECT 
        SUM(total_amount::NUMERIC) AS total_revenue,
        COUNT(DISTINCT buyer_id) AS paying_users_count
    FROM marketplace.orders
    WHERE order_date BETWEEN '2025-05-01' AND '2025-05-31'
    AND status != 'canceled'
)
SELECT 
    rd.total_revenue,
    rd.paying_users_count,
    ROUND(
        COALESCE(rd.total_revenue, 0)::numeric / NULLIF(rd.paying_users_count, 0)::numeric, 
        2
    ) AS arppu
FROM revenue_data rd;