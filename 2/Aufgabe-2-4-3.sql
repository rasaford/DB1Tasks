DROP TABLE test_konv;
CREATE TABLE test_konv (
        d DATE,
        c CHAR(1)

);
INSERT INTO test_konv (d, c) VALUES (SYSDATE, 's');

SELECT * FROM test_konv;
-- slektiert keine Zeilen, da sysdate mehr Daten, als DD.MM.YYYY speichert. Somit ist der Vergleich falsch
SELECT * FROM test_konv WHERE d = to_date('22.03.2017', 'DD.MM.YYYY');
SELECT * FROM test_konv WHERE to_char( d, 'DD.MM.YYYY' ) = '22.03.2017';
