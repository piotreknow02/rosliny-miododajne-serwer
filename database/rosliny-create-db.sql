DROP DATABASE IF EXISTS RoslinyMiododajne;

CREATE DATABASE RoslinyMiododajne;

USE RoslinyMiododajne;

CREATE TABLE kategorie(
  Id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Nazwa varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (Id)
);

CREATE TABLE rosliny(
  Id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Id_rodzaju_rosliny int(10) UNSIGNED NOT NULL,
  Nazwa varchar(30) NOT NULL UNIQUE,
  Nazwa_lacinska varchar(40) NOT NULL UNIQUE,
  Wydajnosc_miodowa int(10) UNSIGNED DEFAULT NULL,
  Wydajnosc_pylkowa int(10) UNSIGNED DEFAULT NULL,
  Zdjecie TEXT(50000) DEFAULT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (Id_rodzaju_rosliny) REFERENCES kategorie (Id)
);

CREATE TABLE kraje(
  Id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Kraj varchar(40) NOT NULL UNIQUE,
  PRIMARY KEY (Id)
);

CREATE TABLE kraje_roslin(
  Id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Id_kraju int(10) UNSIGNED NOT NULL,
  Id_rosliny int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (Id_rosliny) REFERENCES rosliny (Id),
  FOREIGN KEY (Id_kraju) REFERENCES kraje (Id)
);

CREATE USER 'User'@localhost IDENTIFIED BY '${MYSQL_USER_PASSWORD}';
GRANT SELECT ON * TO 'User'@localhost;
GRANT INSERT ON * TO 'User'@localhost;
FLUSH PRIVILEGES;