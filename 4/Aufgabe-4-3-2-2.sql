CREATE TABLE niederlassung (
    id          INTEGER         PRIMARY KEY,
    ort         VARCHAR(20)     NOT NULL
);

CREATE TABLE fahrzeug (
    id          INTEGER         PRIMARY KEY,
    standort    INTEGER         NOT NULL,
    kennzeichen CHAR(9)         NOT NULL
);

CREATE TABLE wartungsleistung (
    id          INTEGER         PRIMARY KEY,
    art         INTEGER         NOT NULL,
    fahrzeug    INTEGER         NOT NULL
);

ALTER TABLE fahrzeug ADD CONSTRAINT fahrzeug_fk1 FOREIGN KEY (standort) REFERENCES niederlassung (id);
ALTER TABLE wartungsleistung ADD CONSTRAINT wartungsleistung_fk1 FOREIGN KEY (fahrzeug) REFERENCES fahrzeug (id);
