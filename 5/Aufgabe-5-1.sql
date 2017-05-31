-- preparations to get all the tables set up properly
ALTER TABLE anzeige DROP CONSTRAINT anzeige_fk1;
ALTER TABLE content DROP CONSTRAINT content_pk1;
ALTER TABLE content DROP CONSTRAINT content_fk1;
ALTER TABLE content DROP CONSTRAINT content_fk2;
ALTER TABLE ausgabe DROP CONSTRAINT ausgabe_fk1;

DROP TABLE preisliste;
DROP TABLE ausgabe;
DROP TABLE content;
DROP TABLE anzeige;
DROP TABLE produkt2;
DROP TABLE kunde;

CREATE TABLE kunde (
    kunde_id        INTEGER         PRIMARY KEY,
    name            VARCHAR(40)     NOT NULL
);

CREATE TABLE produkt2 (
    produkt_id      INTEGER         PRIMARY KEY,
    name            VARCHAR(40)     NOT NULL
);

CREATE TABLE anzeige (
    anzeige_id      INTEGER         PRIMARY KEY,
    kunde_id        INTEGER         NOT NULL,
    breite_mm       INTEGER         NOT NULL,
    hoehe_mm        INTEGER         NOT NULL,
    einlieferung    DATE            DEFAULT sysdate
);

CREATE TABLE content (
    anzeige_id      INTEGER         NOT NULL,
    ausgabe_id      INTEGER         NOT NULL
);

CREATE TABLE ausgabe (
    ausgabe_id      INTEGER         PRIMARY KEY,
    produkt_id      INTEGER         NOT NULL,
    datum           DATE            NOT NULL
);

CREATE TABLE preisliste (
    produkt_id      INTEGER         NOT NULL,
    preis_qmm       FLOAT           NOT NULL
);

ALTER TABLE anzeige ADD CONSTRAINT anzeige_fk1 FOREIGN KEY (kunde_id)  REFERENCES kunde (kunde_id);

ALTER TABLE content ADD CONSTRAINT content_pk1 PRIMARY KEY (anzeige_id, ausgabe_id);
ALTER TABLE content ADD CONSTRAINT content_fk1 FOREIGN KEY (anzeige_id) REFERENCES anzeige (anzeige_id);
ALTER TABLE content ADD CONSTRAINT content_fk2 FOREIGN KEY (ausgabe_id) REFERENCES ausgabe (ausgabe_id);

ALTER TABLE ausgabe ADD CONSTRAINT ausgabe_fk1 FOREIGN KEY (produkt_id) REFERENCES produkt2 (produkt_id);

insert into kunde values(123, 'Maier');
insert into kunde values(124, 'Müller');

INSERT into anzeige values(47,123,20,30,to_date('02.12.2011', 'DD.MM.YYYY'));
INSERT into anzeige values(48,123,40,40,to_date('10.04.2011', 'DD.MM.YYYY'));
INSERT into anzeige values(49,123,80,20,to_date('21.02.2012', 'DD.MM.YYYY'));
INSERT into anzeige values(50,124,10,20,to_date('17.02.2012', 'DD.MM.YYYY'));
INSERT into anzeige values(51,124,50,65,to_date('11.11.2011', 'DD.MM.YYYY'));

insert into produkt2 values(11,'Klatsch und Tratsch');
insert into produkt2 values(12,'PCZeit');
insert into produkt2 values(13,'Politik und mehr');
insert into produkt2 values(14,'Die Erde');

insert into ausgabe values(18,12,to_date('29.02.2012', 'DD.MM.YYYY'));
insert into ausgabe values(19,11,to_date('18.11.2011', 'DD.MM.YYYY'));
insert into ausgabe values(20,11,to_date('11.02.2012', 'DD.MM.YYYY'));
insert into ausgabe values(21,12,to_date('01.04.2012', 'DD.MM.YYYY'));
insert into ausgabe values(22,13,to_date('14.03.2011', 'DD.MM.YYYY'));
insert into ausgabe values(23,13,to_date('21.02.2012', 'DD.MM.YYYY'));
insert into ausgabe values(24,14,to_date('19.07.2011', 'DD.MM.YYYY'));
insert into ausgabe values(25,14,to_date('01.10.2011', 'DD.MM.YYYY'));

insert into content values(47,18);
insert into content values(48,24);
insert into content values(49,22);
insert into content values(50,25);
insert into content values(51,25);

insert into preisliste values(11,0.21);
insert into preisliste values(12,0.61);
insert into preisliste values(13,0.47);
insert into preisliste values(14,0.25);

-- a.)
SELECT count(distinct a.produkt_id) FROM
    content c, ausgabe a
    WHERE a.ausgabe_id = c.ausgabe_id AND
    c.anzeige_id = 47;

-- b.)

-- c.)

-- d.)

