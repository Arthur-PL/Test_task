-- Efficiency of execution
WITH time_ste AS (
	SELECT moderator, id_request, team,
		request_time,
		start_time,
		finish_time,
		timediff(finish_time, start_time) AS execut_time,
		timediff(start_time, request_time) AS waiting_time
	FROM task_2
    )
SELECT t.team,
	COUNT(CASE WHEN execut_time <= sec_to_time(300) THEN 1 END)
		AS meet_req,
	COUNT(CASE WHEN execut_time > sec_to_time(300) THEN 1 END)
		AS doesnt_meet
FROM time_ste AS t
GROUP BY t.team;

-- Efficiency of request processing (6)
WITH time_ste AS (
	SELECT moderator, id_request, team,
		request_time,
		start_time,
		finish_time,
		timediff(finish_time, start_time) AS execut_time,
		timediff(start_time, request_time) AS waiting_time
	FROM task_2
    )
SELECT t.team,
	COUNT(CASE WHEN waiting_time <= sec_to_time(900) THEN 1 END)
		AS meet_req,
	COUNT(CASE WHEN waiting_time > sec_to_time(900) THEN 1 END)
		AS doesnt_meet,
	COUNT(CASE WHEN waiting_time > sec_to_time(2700) THEN 1 END)
		AS unacceptable_delay
FROM time_ste AS t
GROUP BY t.team;

