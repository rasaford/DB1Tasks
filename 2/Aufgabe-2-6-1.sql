DROP TABLE test_alter;

CREATE TABLE test_alter (
  abc CHAR(1),
  def INTEGER

);
INSERT INTO test_alter (abc, def) VALUES ('X', 1);
INSERT INTO test_alter (abc, def) VALUES ('Y', 2);

ALTER TABLE test_alter
  MODIFY  (abc NOT NULL)
  MODIFY  (def NOT NULL)
  ADD     (ghi INTEGER DEFAULT 1 NOT NULL)
;

SELECT * FROM test_alter;
