CREATE TABLE verein (
    id          INTEGER         PRIMARY KEY,
    name        VARCHAR(24)     NOT NULL
);

CREATE TABLE abteilung (
    id          INTEGER         PRIMARY KEY,
    verein      INTEGER         NOT NULL,
    name        VARCHAR(24)     NOT NULL,
    leiter      INTEGER         NOT NULL
);

CREATE TABLE mitglied (
    id          INTEGER         PRIMARY KEY,
    name        VARCHAR(24)     NOT NULL
);

CREATE TABLE abteilungsmitglied (
    id          INTEGER         PRIMARY KEY,
    abteilung   INTEGER         NOT NULL,
    mitglied    INTEGER         NOT NULL
);

ALTER TABLE abteilung ADD CONSTRAINT abteilung_fk1 FOREIGN KEY (verein) REFERENCES verein(id);
ALTER TABLE abteilung ADD CONSTRAINT abteilung_fk2 FOREIGN KEY (leiter) REFERENCES mitglied(id);
ALTER TABLE abteilung ADD CONSTRAINT abteilung_unique UNIQUE (leiter);
ALTER TABLE abteilungsmitglied ADD CONSTRAINT abteilungsmitglied_fk1 FOREIGN KEY (abteilung) REFERENCES abteilung(id);
ALTER TABLE abteilungsmitglied ADD CONSTRAINT abteilungsmitglied_fk2 FOREIGN KEY (mitglied) REFERENCES mitglied(id);
