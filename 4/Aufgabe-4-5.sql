-- 3.)
CREATE INDEX i_teldat_1 ON teldat (datum, uhrzeit, ndauer);
-- 4.)
ANALYZE INDEX i_teldat_1 VALIDATE STRUCTURE;
SELECT blocks FROM INDEX_STATS;
SELECT blocks FROM USER_TABLES WHERE table_name = 'TELDAT';
-- 5.)
CREATE TABLE artikel (
    artikelnummer       INTEGER         PRIMARY KEY,
    bezeichnung         CHAR(80)        DEFAULT 'Test',
    gundpreis           FLOAT           NOT NULL
);

INSERT INTO artikel VALUES (123, 'Test1', 45.6);
INSERT INTO artikel VALUES (124, 'Test2', 12.5);
INSERT INTO artikel VALUES (125, 'Test3', 10.0);
INSERT INTO artikel VALUES (126, 'Test4', 12.5);

-- 1.)
CREATE INDEX i_artikel_1 ON artikel (bezeichnung);

-- 2.)
-- INDEX auf artikelnummer kann nicht erzeugt werden, da dieser ein PRIMARY KEY
-- ist und somit bereits einen UNIQUE INDEX hat.

-- 3.)
CREATE INDEX i_artikel_3 ON artikel (bezeichnung DESC);
