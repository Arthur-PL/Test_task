-- Time interval (request)
SELECT
	MIN(request_time) AS start_req,
    MAX(request_time) AS fin_req,
	timestampdiff(day, MIN(request_time), MAX(request_time)) AS interval_day
FROM task_2;

-- Time interval (execution)
SELECT
	MIN(start_time) AS start_execut,
    MAX(finish_time) AS fin_execut,
	timestampdiff(day, MIN(start_time), MAX(finish_time)) AS interval_day
FROM task_2;

-- Teams
SELECT team, COUNT(DISTINCT moderator) AS team_staff
FROM task_2
GROUP BY team;

-- Operations
SELECT team, COUNT(DISTINCT id_request) AS operations
FROM task_2
GROUP BY team;


