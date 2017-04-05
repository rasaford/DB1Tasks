CREATE TABLE maschinen (
  ident VARCHAR(10),
  hersteller VARCHAR(50),
  typ VARCHAR(10),
  zulassung DATE,
  personen NUMERIC(6),
  fracht NUMERIC(6),
  pate VARCHAR(50)


);

INSERT INTO maschinen (ident, hersteller, typ, zulassung, personen, fracht, pate)
VALUES ('D-L123', 'Airbus', 'A-310', to_date('25.03.2000', 'DD.MM.YYYY'), 178, 15000, 'Frankfurt');

SELECT * FROM maschinen;
INSERT INTO maschinen (ident, hersteller, typ, zulassung, fracht)
VALUES ('DJ-785', 'Boing', '757', to_date('01.01.2001', 'DD.MM.YYYY'), 24500);

SELECT * FROM maschinen;
INSERT INTO maschinen (ident, hersteller, typ, zulassung, personen, fracht, pate)
VALUES ('D-L968', 'Fokker', 'F-50', to_date('15.03.2001', 'DD.MM.YYYY'), 50, 8000, 'Oberlenningen');

SELECT * FROM maschinen;

SELECT DISTINCT(hersteller) FROM maschinen;

DELETE FROM maschinen WHERE typ NOT IN ('A-310', '757', 'F-50');

ALTER TABLE maschinen
ADD leergewicht NUMERIC(6)
ADD dienstende DATE;

ALTER TABLE maschinen
ADD CONSTRAINT leergewicht_uni UNIQUE (leergewicht);

UPDATE maschinen SET leergewicht = 57000 WHERE typ = 'A-310';
UPDATE maschinen SET leergewicht = 54500 WHERE hersteller = 'Boing' AND typ = '757';
UPDATE maschinen SET leergewicht = 17800 WHERE hersteller = 'Fokker' AND typ = 'F-50';
