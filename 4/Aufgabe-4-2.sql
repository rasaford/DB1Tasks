-- 1.
-- a.)
SELECT g.bezeichnung as produktgrp, p.bezeichnung, p.preis FROM produkt p, produktgruppe g
WHERE p.produktgrp = g.produktgrp;
-- b.)
SELECT g.bezeichnung as produktgrp, l.bezeichnung as lieferant, p.bezeichnung as produkt, p.preis
FROM produkt p, produktgruppe g, lieferant l
WHERE p.produktgrp = g.produktgrp AND p.lieferant = l.ident;
-- c.)
SELECT g.bezeichnung as produktgrp, l.bezeichnung as lieferant, p.bezeichnung as produkt, p.preis
FROM produkt p, produktgruppe g, lieferant l
WHERE p.produktgrp = g.produktgrp AND p.lieferant = l.ident AND g.bezeichnung  = 'Smartphone';
-- d.
SELECT g.bezeichnung produktgruppe, count(*) anzahl FROM verkauf v, produkt p, produktgruppe g
WHERE v.produkt = p.produktnr AND p.produktgrp = g.produktgrp AND g.bezeichnung = 'Smartphone'
GROUP BY g.bezeichnung;
-- e.
SELECT g.bezeichnung produktgrp, l.bezeichnung lieferant, p.bezeichnung produkt, v.datum
FROM verkauf v, produkt p, Produktgruppe g, lieferant l
WHERE v.produkt = p.produktnr AND p.produktgrp = g.produktgrp AND p.lieferant = l.ident AND v.datum > to_date('15.09.2012', 'DD.MM.YYYY') AND v.datum < to_date('25.09.2012', 'DD.MM.YYYY')
ORDER BY produktgrp, lieferant, produkt, datum;

-- 2.
-- a.)
SELECT bezeichnung FROM produktgruppe
WHERE bezeichnung NOT IN (
  SELECT g.bezeichnung FROM produkt p, produktgruppe g
  WHERE p.produktgrp = g.produktgrp
);
SELECT g.* FROM produktgruppe g, produkt p
WHERE g.produktgrp = p.produktgrp(+) AND p.produktgrp IS NULL;
-- b.)
SELECT l.bezeichnung lieferant, count(v.ident) Anzahl FROM verkauf v, produkt p, lieferant l
WHERE p.lieferant = l.ident AND p.produktnr = v.produkt(+)
GROUP BY l.bezeichnung;

-- 4.2.2
-- 3.
SELECT z.bezeichnung, sum(p.preis), count(*) FROM zeit z, verkauf v, produkt p
WHERE v.produkt = p.produktnr
    AND v.datum BETWEEN z.beginn AND z.ende
GROUP BY z.bezeichnung
ORDER BY z.bezeichnung;
-- 4.
SELECT z.bezeichnung Zeitraum, g.bezeichnung Produktgruppe, sum(p.preis) Umsatz, count(*) Anzahl
FROM zeit z, verkauf v, produkt p, Produktgruppe g
WHERE v.produkt = p.produktnr AND p.produktgrp = g.produktgrp
    AND v.datum BETWEEN z.beginn AND z.ende
GROUP BY z.bezeichnung, g.bezeichnung
ORDER BY z.bezeichnung;
-- 5
SELECT z.bezeichnung Zeitraum, g.bezeichnung Produktgruppe, sum(p.preis) Umsatz, count(*) Anzahl
FROM zeit z, verkauf v, produkt p, Produktgruppe g, preisliste pl
WHERE v.produkt = p.produktnr AND p.produktgrp = g.produktgrp AND p.produktnr = e.produktnr
    AND v.datum BETWEEN z.beginn AND z.ende
    AND v.datum BETWEEN pl.gueltig_von AND pl.gueltig_bis
GROUP BY z.bezeichnung, g.bezeichnung
ORDER BY z.bezeichnung;
