SELECT * FROM todolist;

SELECT prio, MIN(duration) FROM todolist GROUP BY prio;
