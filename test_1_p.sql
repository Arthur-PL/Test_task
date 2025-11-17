-- Users verification by regions:

SELECT id_user, COUNT(DISTINCT id_region) AS user_region
FROM task_1
WHERE 'status' = 'success'
GROUP BY id_user
HAVING user_region > 1;
-- Output: 1139 rows