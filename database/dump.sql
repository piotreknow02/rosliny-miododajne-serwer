-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: RoslinyMiododajne
-- ------------------------------------------------------
-- Server version       10.6.5-MariaDB-1:10.6.5+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorie` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Nazwa` (`Nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorie`
--

LOCK TABLES `kategorie` WRITE;
/*!40000 ALTER TABLE `kategorie` DISABLE KEYS */;
INSERT INTO `kategorie` VALUES (1,'Drzewo'),(2,'Krzew'),(3,'Pnącza'),(4,'Rośliny zielne');
/*!40000 ALTER TABLE `kategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kraje`
--

DROP TABLE IF EXISTS `kraje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kraje` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Kraj` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Kraj` (`Kraj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kraje`
--

LOCK TABLES `kraje` WRITE;
/*!40000 ALTER TABLE `kraje` DISABLE KEYS */;
INSERT INTO `kraje` VALUES (1,'Polska');
/*!40000 ALTER TABLE `kraje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kraje_roslin`
--

DROP TABLE IF EXISTS `kraje_roslin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kraje_roslin` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Id_kraju` int(10) unsigned NOT NULL,
  `Id_rosliny` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_rosliny` (`Id_rosliny`),
  KEY `Id_kraju` (`Id_kraju`),
  CONSTRAINT `kraje_roslin_ibfk_1` FOREIGN KEY (`Id_rosliny`) REFERENCES `rosliny` (`Id`),
  CONSTRAINT `kraje_roslin_ibfk_2` FOREIGN KEY (`Id_kraju`) REFERENCES `kraje` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kraje_roslin`
--

LOCK TABLES `kraje_roslin` WRITE;
/*!40000 ALTER TABLE `kraje_roslin` DISABLE KEYS */;
/*!40000 ALTER TABLE `kraje_roslin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rosliny`
--

DROP TABLE IF EXISTS `rosliny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rosliny` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Id_rodzaju_rosliny` int(10) unsigned NOT NULL,
  `Nazwa` varchar(30) NOT NULL,
  `Nazwa_lacinska` varchar(40) NOT NULL,
  `Wydajnosc_miodowa` int(10) unsigned DEFAULT NULL,
  `Wydajnosc_pylkowa` int(10) unsigned DEFAULT NULL,
  `Zdjecie` mediumtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Nazwa` (`Nazwa`),
  UNIQUE KEY `Nazwa_lacinska` (`Nazwa_lacinska`),
  KEY `Id_rodzaju_rosliny` (`Id_rodzaju_rosliny`),
  CONSTRAINT `rosliny_ibfk_1` FOREIGN KEY (`Id_rodzaju_rosliny`) REFERENCES `kategorie` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rosliny`
--

LOCK TABLES `rosliny` WRITE;
/*!40000 ALTER TABLE `rosliny` DISABLE KEYS */;
INSERT INTO `rosliny` VALUES (1,1,'jarz b pospolity','Sorbus aucuparia',20,50,'jarzab-pospolity.jpg'),(2,1,'ewodia hupejska','Tetradium daniellii',260,0,'ewodia-hupejska.jpg'),(3,1,'surmia','Catalpa',0,0,'catalpa.jpg'),(4,1,'kasztanowiec zwyczajny','Aesculus hippocastanus',50,25,'aesculus-hippocastanus.jpg'),(5,1,'klon jawor','Acer pseudoplatanus',50,0,'acer-pseudoplatanus.jpg'),(6,1,'klon polny','Acer campestre',50,0,'klon-polny.jpg'),(7,1,'klon pospolity','Acer platanoides',100,0,'klon-pospolity.jpg'),(8,1,'lipa drobnolistna','Tilia cordata',200,35,'lipa-drobnolistna.jpg'),(9,1,'lipa szerokolistna','Tilia platyphyllos',200,35,'lipa-szerokolistna.jpg'),(10,1,'lipa krymska','Tilia euchlora',0,0,'lipa-krymska.jpg'),(11,1,'lipa w gierska','Tilia tomentosa',0,0,'lipa-srebrzysta.jpg'),(12,1,'robinia akacjowa','Robinia pseudoacacia',65,15,'robinia_akacjowa.jpg'),(13,1,'wierzba','Salix',30,45,'wierzba-biala.jpg'),(14,1,' liwa domowa','Prunus domestica',30,15,'sliwa-domowa.jpg'),(15,2,'berberys','Berberis',0,0,'berberys.jpg'),(16,2,'czeremcha zwyczajna','Prunus padus',40,0,'czeremcha-pospolita.jpg'),(17,2,'g  g dwuszyjkowy','Crataegus oxyacantha',0,0,'crataegus-oxyacanthajpg'),(18,2,'g  g jednoszyjkowy','Crataegus monogyna',0,0,'crataegus-monogyna.jpg'),(19,2,'k okoczka po udniowa','Staphylea pinnata',0,0,'staphylea-pinnata.jpg'),(20,2,'kruszyna pospolita','Rhamnus frangula',80,0,'kruszyna-pospolita.jpg'),(21,2,'ligustr pospolity','Ligstrum vulgare',20,0,'ligustrum-vulgare.jpg'),(22,2,'malina w a ciwa','Rubus idaeus',0,0,'rubus-idaeus.jpg'),(23,2,'porzeczka czarna','Ribes nigrum',70,0,'ribes-nigrum.jpg'),(24,2,'r a','Rosa',0,0,'roza.jpg'),(25,2,' nieguliczka bia a','Symphoricarpos albus',190,0,'symphoricarpos-albus.jpg'),(26,3,'bluszcz pospolity','Hedera helix',300,0,'hedera-helix.jpg'),(27,3,'wiciokrzew pospolity','Lonicera xylosteum',120,0,'lonicera-xylosteum.jpg'),(28,3,'winobluszcz tr jklapowy','Parthenocissus',0,0,'winobluszcz.jpg'),(29,4,'brodawnik jesienny','Leontodon autumnalis',0,0,'leontodon-hispidus.jpg'),(30,4,'chaber b awatek','Centaurea cyanus',300,60,'centaura-cyanus.jpg'),(31,4,'chaber driakiewnik','Centaurea scabiosa',0,0,'centaurea-scabiosa.jpg'),(32,4,'chaber g rski','Centaurea montana',0,0,'centaura-montana.jpg'),(33,4,'chaber   kowy','Centaurea jacea',0,0,'centuara-jacea.jpg'),(34,4,'chaber nadre ski','Centaurea rhenana',0,0,'chaber-nadrenski.jpg'),(35,4,'czarcik s   kowy','Succisa pratensis',0,0,'succisa.jpg'),(36,4,'czy ciec prosty','Stachys recta',0,0,'czyściec-prosty-1.jpg'),(37,4,'d br wka roz ogowa','Ajuga reptans',100,0,'ajuga_reptans.jpg'),(38,4,'dyptam jesionolistny','Dictamnus albus',175,0,'dictamnus-albus.jpg'),(39,4,'dziurawiec zwyczajny','Hypericum perforatum',0,0,'dziurawiec.jpg'),(40,4,'facelia b  kitna','Phacelia tanacaetifolia',353,0,'phacelia.jpg'),(41,4,'farbownik lekarski','Anchusa officinalis',0,0,'anchusa-officinalis.jpg'),(42,4,'gajowiec   ty','Galeobdolon luteum',0,0,'galeobdolon-luteum.jpg'),(43,4,'g owienka pospolita','Prunella vulgaris',170,0,'prunella.jpg'),(44,4,'gorczyca bia a','Sinapis alba',22,0,'sinapis-alba.jpg'),(45,4,'gorczyca czarna','Sinapis nigra',0,0,'sinapsis-nigra.jpg'),(46,4,'gorczyca sarepska','Brassica juncea',0,0,'brassica-junea.jpg'),(47,4,'gryka zwyczajna','Fagopyrum sagittatum',198,25,'fagopyrum-esculentum.jpg'),(48,4,'hyzop lekarski','Hyssopus officinalis',400,0,'hyzip.jpg'),(49,4,'jasnota bia a','Lamium album',200,50,'lamium-album.jpg'),(50,4,'jasnota purpurowa','Lamium purpureum',0,0,'Cleaned-Illustration_Lamium_purpureum.jpg'),(51,4,'kocimi tka w a ciwa','Nepeta cataria',172,0,'Nepeta_cataria_Sturm24.jpg'),(52,4,'komonica','Lotus',0,0,'Sacred_lotus_Nelumbo_nucifera.jpg'),(53,4,'koniczyna bia a','Trifolium repens',95,30,'1200px-Illustration_Trifolium_repens0.jpg'),(54,4,'koniczyna bia or owa','Trifolium hybridum',100,30,'e032fa744457b3b0fe2e6806fef4da3bd55fb2ad.jpg'),(55,4,'koniczyna krwistoczerwona','Trifolium incarnatum',140,0,'1200px-Trifolium_incarnatum.jpg'),(56,4,'krwawnica pospolita','Lythrum salicaria',200,0,'pol_pl_Krwawnica-pospolita-Robin-Lythrum-salicaria-14517_1.jpg'),(57,4,'lebiodka pospolita','Origanum vulgare',500,0,'1200px-Illustration_Origanum_vulgare0.jpg'),(58,4,'lepi nik r owy','Petasites hybridus',0,0,'Petasites_hybridus_Sturm53.jpg'),(59,4,'lnica pospolita','Linaria vulgaris',0,0,'Linaria_vulgaris_Sturm10027.jpg'),(60,4,'lubczyk lekarski','Levisticum officinale',484,0,'1200px-Illustration_Levisticum_officinale0.jpg'),(61,4,'lucerna','Medicago',0,0,'Medicago_minima_W.jpg'),(62,4,' ubin   ty','Lupinus luteus',0,0,'1200px-Illustration_Lupinus_luteus1.jpg'),(63,4,' yszczec wiechowaty','Gypsophila paniculata',300,0,'gypsophila-paniculata-snowflake-lyszczec-wiechowaty-.jpg'),(64,4,'macierzanka piaskowa','Thymus serpyllum',0,0,'thymus-serpyllum-macierzanka-piaskowa.jpg'),(65,4,'macierzanka zwyczajna','Thymus pulegioides',0,0,'1200px-Thymus_pulegioides.jpg'),(66,4,'melisa lekarska','Melissa officinalis',89,0,'178px-Melissa_officinalis_-_Kohler–s_Medizinal-Pflanzen-094.jpg'),(67,4,'mi ta d ugolistna','Mentha longifolia',500,0,'Mentha_longifolia_2005.08.02_09.53.56.jpg'),(68,4,'miko ajek p askolistny','Eryngium planum',700,100,'Mikolajek-Plaskolistny-Eryngium-Planum-L-14-1.jpg'),(69,4,'miodownik melisowaty','Melittis melissophyllum',0,0,'Melittis_melissophyllum_cleaned_Sturm.jpg'),(70,4,'miodunka','Pulmonaria',0,0,'miodunka-moonshine-pulmonaria.jpg'),(71,4,'mniszek lekarski','Taraxacum officinale',20,200,'Taraxacum_officinale_-_Köhler–s_Medizinal-Pflanzen-135.jpg'),(72,4,'naw o  kanadyjska','Solidago canadensis',0,0,'Solidago_canadensis_20050815_248.jpg'),(73,4,'naw o  pospolita','Solidago virgaurea',0,0,'Nawloc-pospolita.jpg'),(74,4,'naw o  p na','Solidago serotina',750,50,'Solidago_gigantea01.jpg'),(75,4,'nostrzyk bia y ','Melilotus albus',450,123,'2278_1.jpg'),(76,4,'nostrzyk   ty ','Melilotus officinalis',100,30,'1200px-Illustration_Melilotus_officinalis0.jpg'),(77,4,'og recznik lekarski ','Borago officinalis',176,0,'Illustration_Borago_officinalis0.jpg'),(78,4,'orlik ','orlik (Aquilegia)',0,0,'gf-Ta8d-bEtv-uQD7_orlik-ogrodowy-664x442.jpg'),(79,4,'oset zwis y ','Carduus nutans',0,0,'1200px-Illustration_Carduus_nutans0.jpg'),(80,4,'ostro e b otny ','Cirsium palustre',0,0,'Cirsium_palustre_Sturm3.jpg'),(81,4,'ostrze g rski ','Cynoglossum germanicum',0,0,'c0035461-800px-wm.jpg'),(82,4,'o ota zwyczajna ','Galatella linosyris',0,0,'e0a4fe40d76d536c5f6d4e2c23ffe99f318d06fe.jpg'),(83,4,'pierwiosnek ','Primula',0,0,'pol_pl_Pierwwiosnek-Wanda-Primula-juliana-11424_1.jpg'),(84,4,'pop och pospolity ','Onopordum acanthium',100,35,'Onopordum_acanthium.jpg'),(85,4,'pszczelnik w skolistny ','Dracocephalum ruyschiana',0,0,'220px-Dracocephalum_ruyschiana_1.jpg'),(86,4,'pszczelnik mo dawski ','Dracocephalum moldavica',350,0,'Dracocephalum_moldavica_Sturm28.jpg'),(87,4,'przegorzan kulisty ','Echinopas sphaerocephalus',500,0,'640px-Illustration_Echinops_sphaerocephalus0.jpg'),(88,4,'przetacznik pag rkowy ','Veronica teucrium',0,0,'przetacznik-pagorkowy-veronica-teucrium-zdj-adobe-stock.jpg'),(89,4,'pysznog  wka purpurowa ','Monarda purpurea',0,0,'pysznoglowka-dancing-bird-monarda.jpg'),(90,4,'rdest w ownik ','Polygonum bistorta',350,40,'1200px-Polygonum_bistorta_a3.jpg'),(91,4,'rezeda   ta ','Reseda lutea',0,0,'Reseda_lutea1.jpg'),(92,4,'rezeda   tawa ','Reseda luteola',0,0,'Reseda_luteola_La_Palma1.jpg'),(93,4,'rozchodnik ','Sedum',0,0,'rozchodnik-sedum-zdj-adobe-stock.jpg'),(94,4,'ruta zwyczajna ','Ruta graveolens',295,0,'Ruta_graveolens_-_Kohler–s_Medizinal-Pflanzen-259.jpg'),(95,4,'rzepak ','Brassica napus',0,0,'Brassica_napus_-_Kohler–s_Medizinal-Pflanzen-169.jpg'),(96,4,'seradela pastewna ','Ornithopus sativus',0,0,'1200px-Ornithopus_sativus_flower,_serradelle_bloem.jpg'),(97,4,'serdecznik syberyjski ','Leonorus sibiricus',0,0,'1200px-Leonurus_sibiricus.jpg'),(98,4,'siedmiopalecznik b otny ','Comarum palustre',0,0,'Potentilla_palustris_Sturm20.jpg'),(99,4,'sparceta siewna ','Onobrychis viciifolia',180,60,'1200px-Onobrychis_viciifolia_Inflorescence_11April2009_CampoCalatrava.jpg'),(100,4,'szafran','Crocus',0,0,'Crocus_vernus_with_bee.jpg'),(101,4,'sza wia lekarska ','Salvia officinalis',510,0,'salvia_officinalis_.jpg'),(102,4,'sza wia   kowa ','Salvia pratensis',0,0,'260_Salvia_pratensis_L.jpg'),(103,4,'sza wia okr gowa ','Salvia verticillata',300,40,'1200px-Salvia_verticillata_240606.jpg'),(104,4,'szcze pospolita ','Dipsacus sylvestris',300,250,'Affoltern_-_Katzensee_2011-07-03_15-02-08.jpg'),(105,4,' laz zaniedbany ','Malva neglecta',0,0,'Malva_neglecta_Sturm64.jpg'),(106,4,'tojad ','Aconitum',0,0,'aconitum-napellus-tojad-mocny.jpg'),(107,4,'tr downik bulwiasty ','Scrophularia nodosa',700,0,'1200px-Illustration_Scrophularia_nodosa0_clean.jpg'),(108,4,'wielosi  b  kitny ','Polemonium caeruleum',0,0,'Polemonium_caeruleum_nf.jpg'),(109,4,'wierzb wka kiprzyca ','Chamaenerion angustifolium',200,0,'wierzbowka-kiprzyca.jpg'),(110,4,'wyka ptasia','Vicia cracca',0,0,'318_Vicia_cracca,_Vicia_villosa.jpg'),(111,4,'wyka p otowa','Vicia sepium',0,0,'Vicia_sepium_Sturm12.jpg'),(112,4,'drobnokwiatowa','Vicia hirsuta',0,0,'1200px-Vicia_hirsuta_1.jpg'),(113,4,' mijowiec zwyczajny','Echium vulgare',400,70,'87_Echium_vulgare.jpg'),(114,4,' ywokost lekarski','Symphytum officinale',0,0,'1548345594.jpg');
/*!40000 ALTER TABLE `rosliny` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-22 14:28:49