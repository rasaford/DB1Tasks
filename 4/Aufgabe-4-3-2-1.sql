CREATE TABLE moebelart (
    id,         INTEGER     PRIMARY KEY,
    kurzbez     VARCHAR(20) NOT NULL,
    bezeichnung VARCHAR(80)
);

CREATE TABLE raum (
    id          INTEGER     PRIMARY KEY,
    raumnr      CHAR(10)    NOT NULL
);

CREATE TABLE moebelstueck (
    id          INTEGER     PRIMARY KEY,
    art         INTEGER     NOT NULL,
    standort    INTEGER     NOT NULL,
    preis       FLOAT       NOT NULL,
    beschaff    DATE        NOT NULL
);

ALTER TABLE moebelstueck ADD CONSTRAINT moebelstueck_fk1 FOREIGN KEY (art) REFERENCES moebelart (id);

ALTER TABLE moebelstueck ADD CONSTRAINT moebelstueck_fk2 FOREIGN KEY (standort) REFERENCES raum (id);
