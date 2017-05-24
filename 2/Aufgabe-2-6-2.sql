DROP TABLE kundenstamm;

CREATE TABLE kundenstamm (
  kdnr    INTEGER       NOT NULL,
  fname   VARCHAR(40)   NOT NULL,
  gform   VARCHAR(40)   ,
  anspr   VARCHAR(40)   ,
  kdseit  DATE          ,
  aktiv   CHAR(1)       ,
  anluser VARCHAR(40),
  anldat  DATE


);

ALTER TABLE kundenstamm
  ADD CONSTRAINT kdnr_unique UNIQUE(kdnr);
ALTER TABLE kundenstamm
  ADD CONSTRAINT check_gform CHECK(gform IN ('GBR', 'EK', 'GMBH', 'AG'));
ALTER TABLE kundenstamm
  MODIFY anspr DEFAULT('N.N.');
ALTER TABLE kundenstamm
  MODIFY kdseit DEFAULT SYSDATE;
ALTER TABLE kundenstamm
  ADD CONSTRAINT check_aktiv CHECK(aktiv IN ('J', 'N'));


ALTER TABLE todolist
  ADD duration INTEGER;

SELECT * FROM todolist;

UPDATE todolist SET duration=5;
SELECT * FROM todolist;
