-- Productivity of staff

-- Nomber of transactions:
SELECT team, moderator,
	COUNT(id_request) AS Requests,
	timestampdiff(day, MIN(start_time), MAX(finish_time)) + 1 AS work_period_day
FROM task_2
GROUP BY team, moderator
ORDER BY team;
