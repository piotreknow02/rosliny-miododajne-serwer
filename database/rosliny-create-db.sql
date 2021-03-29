DROP DATABASE IF EXISTS RoslinyMiododajne;

CREATE DATABASE RoslinyMiododajne;

CREATE TABLE rosliny (
  Id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Id_rodzaju_rosliny int(10) UNSIGNED NOT NUL,
  Nazwa varchar(30) NOT NULL,
  Nazwa_lacinska varchar(40) NOT NULL,
  Wydajnosc_miodowa int(10) UNSIGNED DEFAULT NULL,
  Wydajnosc_pylkowa int(10) UNSIGNED DEFAULT NULL,
  Zdjecie varchar(50) DEFAULT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (Id_rodzaju_rosliny) REFERENCES rodzaje_roslin (Id)
);

CREATE TABLE kraje (
  Id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Nazwa varchar(40) NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE kraje_drzew (
  Id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Id_kraju int(10) UNSIGNED NOT NULL,
  Id_drzewa int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (Id_drzewa) REFERENCES rosliny (Id),
  FOREIGN KEY (Id_kraju) REFERENCES kraje (Id)
);

CREATE TABLE rodzaje_roslin(
  Id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Nazwa varchar(30) NOT NULL,
  PRIMARY KEY (Id)
);