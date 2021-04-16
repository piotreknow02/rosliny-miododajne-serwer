SELECT
  rosliny.Nazwa,
  rosliny.Nazwa_lacinska,
  kraje.Kraj,
  rosliny.Wydajnosc_miodowa,
  rosliny.Wydajnosc_pylkowa,
  rosliny.Zdjecie,
  rodzaje_roslin.Nazwa
FROM
  kraje_roslin
  INNER JOIN ON kreaje_roslin.Id = kraje.Id
  INNER JOIN ON kraje_roslin.Id_drzewa = rosliny.Id
  INNER JOIN ON rosliny.Id_rodzaju_rosliny = rodzaje_roslin.Id;