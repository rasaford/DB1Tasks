-- deleting the FK constraints
ALTER TABLE proj_mitglied DROP CONSTRAINT UC_student;
ALTER TABLE proj_mitglied DROP CONSTRAINT FK_student;
ALTER TABLE proj_mitglied DROP CONSTRAINT FK_proj_nr;
ALTER TABLE student DROP CONSTRAINT FK_heim_anschr;
ALTER TABLE student DROP CONSTRAINT FK_sem_anschr;
-- deleting the PK constraints
ALTER TABLE student DROP CONSTRAINT PK_student;
ALTER TABLE anschrift DROP CONSTRAINT PK_anschrift;
ALTER TABLE MIProjekt DROP CONSTRAINT PK_MIProjekt;
-- dropping the tables
DROP TABLE proj_mitglied;
DROP TABLE student;
DROP TABLE anschrift;
DROP TABLE MIProjekt;
-- creating tables
CREATE TABLE MIProjekt (
    id      INTEGER,
    titel   VARCHAR(40)     NOT NULL,
    betreuer VARCHAR(40)    NOT NULL,
    semester INTEGER        NOT NULL
);
CREATE TABLE anschrift (
    id          INTEGER,
    plz         INTEGER     NOT NULL,
    straße      VARCHAR(40),
    ort         VARCHAR(40) NOT NULL,
    land        VARCHAR(40)
);
CREATE TABLE student (
    mat_nr      INTEGER,
    name        VARCHAR(60) NOT NULL,
    nachname    VARCHAR(60) NOT NULL,
    tel         INTEGER,
    sem_anschr  INTEGER,
    heim_anschr INTEGER
);
CREATE TABLE proj_mitglied (
    id          INTEGER,
    proj_nr     INTEGER,
    student     INTEGER,
    edvnr       INTEGER     NOT NULL,
    note        NUMBER(4,2)
);
-- creating pirmary key constraints
ALTER TABLE MIProjekt ADD CONSTRAINT PK_MIProjekt PRIMARY KEY(id);
ALTER TABLE anschrift ADD CONSTRAINT PK_anschrift PRIMARY KEY(id);
ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY(mat_nr);
-- creating foreign key constraints
ALTER TABLE student ADD CONSTRAINT FK_sem_anschr FOREIGN KEY(sem_anschr) REFERENCES anschrift(id);
ALTER TABLE student ADD CONSTRAINT FK_heim_anschr FOREIGN KEY(heim_anschr) REFERENCES anschrift(id);
ALTER TABLE proj_mitglied ADD CONSTRAINT FK_proj_nr FOREIGN KEY(proj_nr) REFERENCES MIProjekt(id);
ALTER TABLE proj_mitglied ADD CONSTRAINT FK_student FOREIGN KEY(student) REFERENCES student(mat_nr);
ALTER TABLE proj_mitglied ADD CONSTRAINT UC_student UNIQUE (proj_nr, student);

-- 5.
INSERT INTO MIProjekt (id, titel, betreuer, semester) VALUES (1, 'datenbaken', 'brukhard', 20171);
INSERT INTO MIProjekt (id, titel, betreuer, semester) VALUES (2, 'software entwicklung 2', 'kriha / jordine', 20171);
-- primary key insertion error
INSERT INTO MIProjekt (id, titel, betreuer, semester) VALUES (1, 'linux grundlagen', '?', 20171);

-- 6.
INSERT INTO anschrift (id, plz, straße, ort, land) VALUES (1, 70180, 'Neue Weinsteige 35', 'Stuttgart', 'Deutschland');
INSERT INTO anschrift (id, plz, straße, ort, land) VALUES (2, 69198, 'Sonnenblumenweg 24', 'Schriesheim', 'Deutschland');

-- 7.
INSERT INTO student (mat_nr, name, nachname, tel, sem_anschr, heim_anschr)
    VALUES (4711, 'Maxmimilian', 'Fruehauf', 015170064342, 1, 2);
-- 8.
INSERT INTO proj_mitglied (id, proj_nr, student, edvnr, note) VALUES (1, 1, 4711, 12345, 1.0);

-- 10.
-- expected error
DELETE FROM anschrift WHERE id = 1;
DELETE FROM student WHERE mat_nr = 4711;
