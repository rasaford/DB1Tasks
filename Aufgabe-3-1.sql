REATE TABLE zahlungen (
  kunde   VARCHAR(30),
  rechnnr INTEGER,
  rechdat DATE,
  betrag  NUMERIC(9,2),
  mahnstufe INTEGER,
  zahldat   DATE,
  zahldiff  NUMERIC(9,2)
);

INSERT INTO zahlungen (kunde, rechnnr, rechdat, betrag, mahnstufe, zahldat, zahldiff)
  VALUES ('Meier OHG', 2, to_date('15.11.11', 'DD.MM.YY'), 45.58, 0, to_date('05.12.11', 'DD.MM.YY'), 0.58);
INSERT INTO zahlungen (kunde, rechnnr, rechdat, betrag, mahnstufe)
  VALUES ('Meier OHG', 4, to_date('18.11.11', 'DD.MM.YY'), 69.23, 2);
INSERT INTO zahlungen (kunde, rechnnr, rechdat, betrag, mahnstufe)
  VALUES ('Hinz GmbH', 7, to_date('22.11.11', 'DD.MM.YY'), 963.25, 3);
INSERT INTO zahlungen (kunde, rechnnr, rechdat, betrag, mahnstufe)
  VALUES ('Hinz GmbH', 9, to_date('27.11.11', 'DD.MM.YY'), 56.12, 0);
COMMIT;

SELECT * FROM zahlungen;

UPDATE zahlungen SET mahnstufe = -1 WHERE rechnnr = 7;
UPDATE zahlungen SET mahnstufe = mahnstufe + 1 WHERE rechnnr = 4 OR rechnnr = 9;
UPDATE zahlungen SET zahldiff = 1.23 , zahldat = to_date('25.11.11', 'DD.MM.YY') WHERE rechnnr = 4;
UPDATE zahlungen SET rechdat = to_date('25.11.11', 'DD.MM.YY') WHERE rechdat = to_date('27.11.11', 'DD.MM.YY');

SELECT * FROM zahlungen;

CREATE VIEW offene_zahlungen_detail AS
  SELECT betrag, mahnstufe, rechdat FROM zahlungen ORDER BY mahnstufe, rechdat;

SELECT * FROM offene_zahlungen_detail;

CREATE VIEW offene_zahlungen_summe AS
  SELECT sum(betrag) AS summe FROM zahlungen;

SELECT * FROM offene_zahlungen_summe;
