CREATE OR REPLACE VIEW view_decode AS
SELECT task, decode(prio, 'H', 'hoch', 'M', 'mittel', 'L', 'niedrig', 'keine') AS
prio FROM todolist;

SELECT * FROM view_decode;
SELECT * FROM view_decode WHERE prio = 'hoch';
