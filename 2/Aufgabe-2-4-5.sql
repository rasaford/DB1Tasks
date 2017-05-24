DROP TABLE namen;

CREATE TABLE namen (
  nname   VARCHAR(24),
  vname   VARCHAR(24),
  gebdat  DATE,
  UNIQUE (nname, vname, gebdat)

);
-- WTF?! why is it inserting duplicate entries if the query gets run often enough ???
INSERT INTO namen (nname, vname, gebdat) VALUES ('John', 'Doe', SYSDATE);
INSERT INTO namen (nname, vname, gebdat) VALUES ('Jane', 'Doe', SYSDATE);
INSERT INTO namen (nname, vname, gebdat) VALUES ('John', 'Doe', SYSDATE);
INSERT INTO namen (nname, vname, gebdat) VALUES ('John', 'Doe', SYSDATE);

SELECT * FROM namen;
