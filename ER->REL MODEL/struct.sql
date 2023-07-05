CREATE TABLE KLUB
(
  idKlub CHAR(10) NOT NULL,
  imeKlub VARCHAR(20) NOT NULL,
  Lokacija VARCHAR(20) NOT NULL,
  PRIMARY KEY (idKlub)
);

CREATE TABLE IGRAČ
(
  idIgrač CHAR(10) NOT NULL,
  imeIgrač VARCHAR(20) NOT NULL,
  prezimeIgrač VARCHAR(20) NOT NULL,
  idKlub CHAR(10),
  PRIMARY KEY (idIgrač),
  FOREIGN KEY (idKlub) REFERENCES KLUB(idKlub)
);

CREATE TABLE OZLJEDA
(
  idIgrač CHAR(10) NOT NULL,
  vrstaOzlj VARCHAR(20),
  idIgrač CHAR(10) NOT NULL,
  PRIMARY KEY (idIgrač, idIgrač),
  FOREIGN KEY (idIgrač) REFERENCES IGRAČ(idIgrač),
  UNIQUE (vrstaOzlj)
);

CREATE TABLE PODUZEĆE
(
  poduzId CHAR(10) NOT NULL,
  imePoduz VARCHAR(20) NOT NULL,
  PRIMARY KEY (poduzId)
);

CREATE TABLE Sponzorira
(
  poduzId CHAR(10) NOT NULL,
  idKlub CHAR(10) NOT NULL,
  donacija NUMERIC NOT NULL,
  sezona INT NOT NULL,
  CONSTRAINT chkSezona CHECK (sezona >= 1900 AND sezona <= 3000),
  idKlub CHAR(10) NOT NULL,
  poduzId CHAR(10) NOT NULL,
  PRIMARY KEY (poduzId),
  FOREIGN KEY (idKlub) REFERENCES KLUB(idKlub),
  FOREIGN KEY (poduzId) REFERENCES PODUZEĆE(poduzId),
  UNIQUE (idKlub, poduzId)
);

CREATE TABLE poduzSuvlasnik
(
  poduzId_1 CHAR(10) NOT NULL,
  poduzSuvlasnikpoduzId_2 CHAR(10) NOT NULL,
  PRIMARY KEY (poduzId_1, poduzSuvlasnikpoduzId_2),
  FOREIGN KEY (poduzId_1) REFERENCES PODUZEĆE(poduzId),
  FOREIGN KEY (poduzSuvlasnikpoduzId_2) REFERENCES PODUZEĆE(poduzId)
);