USE RoslinyMiododajne;

INSERT INTO rodzaje_roslin(Nazwa) VALUES ("Drzewo");

INSERT INTO kraje(Kraj) VALUES ("Polska");

INSERT INTO rosliny(Nazwa, Nazwa_lacinska, Id_rodzaju_rosliny, Wydajnosc_miodowa, Wydajnosc_pylkowa, Zdjecie) VALUES 
('jarząb pospolity', 'Sorbus aucuparia', 1, 20, 0, NULL),
('ewodia hupejska', 'Tetradium daniellii', 1, 260, 0, NULL),
('surmia', 'Catalpa', 1, 0, 0, NULL),
('kasztanowiec zwyczajny', 'Aesculus hippocastanus', 1, 50, 25, NULL),
('klon jawor', 'Acer pseudoplatanus', 1, 50, 0, NULL),
('klon polny', 'Acer campestre', 1, 50, 0, NULL),
('klon pospolity', 'Acer platanoides', 1, 100, 0, NULL),
('lipa drobnolistna', 'Tilia cordata', 1, 200, 35, NULL),
('lipa szerokolistna', 'Tilia platyphyllos', 1, 200, 35, NULL),
('lipa krymska', 'Tilia euchlora', 1, 0, 0, NULL),
('lipa węgierska', 'Tilia tomentosa', 1, 0, 0, NULL),
('robinia akacjowa', 'Robinia pseudoacacia', 1, 65, 15, NULL),
('wierzba', 'Salix', 1, 30, 45, NULL),
('śliwa domowa', 'Prunus domestica', 1, 30, 15, NULL);

INSERT INTO kraje_roslin(Id_kraju, Id_rosliny) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14);