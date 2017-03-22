DROP TABLE kundenstamm;
CREATE TABLE kundenstamm (
  kdnr    INTEGER       NOT NULL UNIQUE,
  fname   VARCHAR(40)   NOT NULL,
  gform   VARCHAR(40)   CHECK(gform IN ('GBR', 'EK', 'GMBH', 'AG')),
  anspr   VARCHAR(40)   DEFAULT 'N.N.',
  kdseit  DATE          DEFAULT SYSDATE,
  aktiv   CHAR(1)       CHECK(aktiv IN ('J', 'N')),
  anluser VARCHAR(40),
  anldat  DATE

);
INSERT INTO kundenstamm (kdnr, fname, gform) VALUES (69, 'Tyrell Corp', 'AG');
INSERT INTO kundenstamm (kdnr, fname, gform) VALUES (70, 'Tyrell Corp', 'AG');
INSERT INTO kundenstamm (kdnr, fname, gform) VALUES (71, 'Tyrell Corp', 'AG');

SELECT * FROM kundenstamm;
