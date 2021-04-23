SELECT
  rosliny.Nazwa,
  rosliny.Nazwa_lacinska,
  kraje.Kraj,
  rosliny.Wydajnosc_miodowa,
  rosliny.Wydajnosc_pylkowa,
  rosliny.Zdjecie,
  rodzaje_roslin.Nazwa AS Rodzaj
FROM
  kraje_roslin
  INNER JOIN rosliny ON kraje_roslin.Id_rosliny = rosliny.Id
  INNER JOIN rodzaje_roslin ON rosliny.Id_rodzaju_rosliny = rodzaje_roslin.Id
  INNER JOIN kraje ON kraje_roslin.Id_kraju = kraje.Id;