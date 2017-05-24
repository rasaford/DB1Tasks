-- a.) table creation
CREATE TABLE studium (
    edvnr INTEGER NOT NULL,
    titel VARCHAR(80) NOT NULL,
    dozent CHAR(10) NOT NULL,
    semester CHAR(10) NOT NULL,
    pruefungsdatum DATE NOT NULL,
    note FLOAT NULL,
    PRIMARY KEY (edvnr, pruefungsdatum)
);
-- some default insertions to have some data to work with
INSERT INTO studium VALUES (13123, 'Mathematik 3', 'Meier', 'SS11', to_date('28.09.2011', 'DD.MM.YYYY'), 4.7);
INSERT INTO studium VALUES (13169, 'Geschichte der Informatik', 'Schulz', 'SS12', to_date('30.06.2012', 'DD.MM.YYYY'), 2.3);
INSERT INTO studium VALUES (13123, 'Mathematik 3', 'Müller', 'WS12', to_date('09.02.2012', 'DD.MM.YYYY'), 4.7);
INSERT INTO studium VALUES (13123, 'Mathematik 3', 'Müller', 'WS12', to_date('15.03.2012', 'DD.MM.YYYY'), 4.0);
COMMIT;
-- b.)
DELETE FROM studium WHERE pruefungsdatum < to_date('01.10.2012', 'DD.MM.YYYY') AND note IS NULL;
-- c.)
UPDATE studium SET note = 1.3 WHERE titel = 'Geschichte der Informatik' AND note = 2.3;
-- d.)
ALTER TABLE studium ADD (
    abschnitt VARCHAR(2)
    bermerkung VARCHAR(255),
    stg VARCHAR(3)
);
UPDATE studium SET abschnitt = 'GS', stg = 'MIB';
ALTER TABLE studium MODIFY (
    abschnitt NOT NULL,
    stg NOT NULL;
);
