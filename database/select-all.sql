SELECT
  rosliny.Nazwa,
  rosliny.Nazwa_lacinska,
  kraje.Kraj,
  rosliny.Wydajnosc_miodowa,
  rosliny.Wydajnosc_pylkowa,
  rosliny.Zdjecie,
  kategorie.Nazwa AS Kategoria
FROM
  kraje_roslin
  INNER JOIN rosliny ON kraje_roslin.Id_rosliny = rosliny.Id
  INNER JOIN kategorie ON rosliny.Id_rodzaju_rosliny = kategorie.Id
  INNER JOIN kraje ON kraje_roslin.Id_kraju = kraje.Id;