-- Var.1 User-region:
WITH region_avg_cte AS (
	SELECT id_region, AVG(amount) AS region_avg
	FROM task_1
	WHERE `status` = 'success'
	GROUP BY id_region),
user_amount_cte AS (
	SELECT id_user, id_region, SUM(amount) AS user_amount
	FROM task_1
	WHERE `status` = 'success'
	GROUP BY id_user, id_region
    )
SELECT c1.id_user, c2.id_region, user_amount, region_avg
FROM user_amount_cte AS c1
INNER JOIN region_avg_cte AS c2
USING(id_region)
WHERE user_amount > region_avg
ORDER BY id_user, id_region;
-- Output: 5003 user-region pairs