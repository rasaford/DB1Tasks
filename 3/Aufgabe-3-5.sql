DROP TABLE anzeigen;

CREATE TABLE anzeigen (
  ident INTEGER PRIMARY KEY,
  kunden_id VARCHAR(10) NOT NULL,
  typ VARCHAR(30) NOT NULL,
  breite INTEGER,
  hoehe INTEGER,
  einlieferung DATE NOT NULL,
  dfue VARCHAR(10)

);

INSERT INTO anzeigen (ident, kunden_id, typ, einlieferung, dfue) VALUES (123, 'P0488', 'SW-Text', to_date('15.01.2012', 'DD.MM.YYYY'), 'ISDN');
INSERT INTO anzeigen (ident, kunden_id, typ, breite, hoehe, einlieferung, dfue) VALUES (785, 'I2628', 'F-Bild', 67, 178, to_date('24.05.2011', 'DD.MM.YYYY'), 'DSL');
INSERT INTO anzeigen (ident, kunden_id, typ, breite, hoehe, einlieferung) VALUES (968, 'I2628', 'SW-Bild', 153, 50, to_date('28.07.2011', 'DD.MM.YYYY'));
COMMIT;

SELECT * FROM anzeigen WHERE (breite * hoehe) > 250;

UPDATE anzeigen SET dfue = 'DSL' WHERE ident = '968' AND kunden_id = 'I2628';

-- amazing delta script <3
ALTER TABLE anzeigen ADD (
  avis DATE
  ) MODIFY (
  einlieferung NULL
);
UPDATE anzeigen SET avis = einlieferung;

ALTER TABLE anzeigen MODIFY (
  avis NOT NULL
);

select * from anzeigen where avis < to_date('04.04.2013', 'DD.MM.YYYY');
delete from anzeigen where avis < to_date('04.04.2013', 'DD.MM.YYYY');
