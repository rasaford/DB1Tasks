CREATE TABLE kinofilm (
    id          INTEGER         PRIMARY KEY,
    titel       VARCHAR(24)     NOT NULL
);

CREATE TABLE sender (
    id          INTEGER         PRIMARY KEY,
    gruppe      VARCHAR(24)     NOT NULL,
    name        VARCHAR(24)     NOT NULL
);

CREATE TABLE sendeplan (
    id          INTEGER         PRIMARY KEY,
    film        INTEGER         NOT NULL,
    sender      INTEGER         NOT NULL,
    beginn      DATE            NOT NULL,
    ende        DATE            NOT NULL
);

ALTER TABLE sendeplan ADD CONSTRAINT sendeplan_fk1 FOREIGN KEY (film) REFERENCES kinofilm (id);
ALTER TABLE sendeplan ADD CONSTRAINT sendeplan_fk2 FOREIGN KEY (sender) REFERENCES sender (id);
