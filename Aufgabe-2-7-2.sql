SELECT * FROM todolist;

SELECT task, nvl(prio, 'keine') FROM todolist;
SELECT task, decode(prio, 'H', 'hoch', 'M', 'mittel', 'L', 'niedrig', 'keine')
       FROM todolist;
