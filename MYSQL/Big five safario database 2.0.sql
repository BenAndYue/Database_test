-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema big_five_safari
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema big_five_safari
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `big_five_safari` DEFAULT CHARACTER SET utf8 ;
USE `big_five_safari` ;

-- -----------------------------------------------------
-- Table `big_five_safari`.`Accomodatie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `big_five_safari`.`Accomodatie` ;

CREATE TABLE IF NOT EXISTS `big_five_safari`.`Accomodatie` (
  `accomodatieCode` VARCHAR(45) NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `stad` VARCHAR(45) NOT NULL,
  `land` VARCHAR(45) NOT NULL,
  `kamer` VARCHAR(255) NOT NULL,
  `personen` INT NOT NULL,
  `soort` ENUM('hotel', 'lodge') NOT NULL,
  PRIMARY KEY (`accomodatieCode`),
  UNIQUE INDEX `AccomodatieCode_UNIQUE` (`accomodatieCode` ASC) VISIBLE)

ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `big_five_safari`.`Hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `big_five_safari`.`Hotel` ;

CREATE TABLE IF NOT EXISTS `big_five_safari`.`Hotel` (
  `accomodatieCode` VARCHAR(45) NOT NULL,
  `prijs_per_nacht` DOUBLE NOT NULL,
  `ontbijt` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`accomodatieCode`),
  INDEX `fk_verzinzelf_idx` (`accomodatieCode` ASC) VISIBLE,
  UNIQUE INDEX `accomodatieCode_UNIQUE` (`accomodatieCode` ASC) VISIBLE,
  CONSTRAINT `fk_verzinzelf`
    FOREIGN KEY (`accomodatieCode`)
    REFERENCES `big_five_safari`.`Accomodatie` (`accomodatieCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `big_five_safari`.`Lodge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `big_five_safari`.`Lodge` ;

CREATE TABLE IF NOT EXISTS `big_five_safari`.`Lodge` (
  `accomodatieCode` VARCHAR(45) NOT NULL,
  `prijs_per_week` DOUBLE NOT NULL,
  `auto_huur` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`accomodatieCode`),
  UNIQUE INDEX `accomodatieCode_UNIQUE` (`accomodatieCode` ASC) VISIBLE,
  CONSTRAINT `fk_verzinzelf1`
    FOREIGN KEY (`accomodatieCode`)
    REFERENCES `big_five_safari`.`Accomodatie` (`accomodatieCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `big_five_safari`.`Reiziger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `big_five_safari`.`Reiziger` ;

CREATE TABLE IF NOT EXISTS `big_five_safari`.`Reiziger` (
  `reizigersCode` VARCHAR(45) NOT NULL,
  `voornaam` VARCHAR(45) NOT NULL,
  `achternaam` VARCHAR(45) NOT NULL,
  `adres` VARCHAR(255) NOT NULL,
  `postcode` VARCHAR(10) NOT NULL,
  `plaats` VARCHAR(45) NOT NULL,
  `land` VARCHAR(45) NOT NULL,
  `hoofdReiziger` VARCHAR(45) NULL,
  PRIMARY KEY (`reizigersCode`),
  INDEX `fk_verzinzelf2_idx` (`hoofdReiziger` ASC) VISIBLE,
  CONSTRAINT `fk_verzinzelf2`
    FOREIGN KEY (`hoofdReiziger`)
    REFERENCES `big_five_safari`.`Reiziger` (`reizigersCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `big_five_safari`.`Reservering`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `big_five_safari`.`Reservering` ;

CREATE TABLE IF NOT EXISTS `big_five_safari`.`Reservering` (
  `idReservering` INT NOT NULL,
  `aankomstDatum` DATE NOT NULL,
  `vertrekDatum` DATE NOT NULL,
  `betaald` TINYINT(1) NOT NULL DEFAULT 0,
  `reizigersCode` VARCHAR(45) NOT NULL,
  `accomodatieCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idReservering`),
  INDEX `fk_verzinzelf3_idx` (`reizigersCode` ASC) VISIBLE,
  INDEX `fk_verzinzelf4_idx` (`accomodatieCode` ASC) VISIBLE,
  CONSTRAINT `fk_verzinzelf3`
    FOREIGN KEY (`reizigersCode`)
    REFERENCES `big_five_safari`.`Reiziger` (`reizigersCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_verzinzelf4`
    FOREIGN KEY (`accomodatieCode`)
    REFERENCES `big_five_safari`.`Accomodatie` (`accomodatieCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `big_five_safari`.`Accomodatie`
-- -----------------------------------------------------
START TRANSACTION;
USE `big_five_safari`;
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HIBZ1', 'Indigo Beach', 'Zanzibar', 'Tanzania', 'Swahili-stijl budget tweepersoonskamer', 2, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HIBZ2', 'Indigo Beach', 'Zanzibar', 'Tanzania', 'Bungalow met uitzicht op de tuin', 8, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HZBK1', 'Zanbluu Beach Hotel', 'Kiwengwa', 'Tanzania', 'Superior Suite met uitzicht op zee en eigen zwembad', 2, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HEVO1', 'Etosha Village', 'Okaukuejo', 'Namibië', 'Standaard kamer met 2 Bedden', 2, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HSCW1', 'Safari Court Hotel', 'Windhoek', 'Namibië', 'Classic tweepersoonskamer met 2 aparte bedden', 2, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HPHC1', 'Premier Hotel Cape Town', 'Kaapstad', 'Zuid-Afrika', 'Familie loft met queensize bed en 2 aparte bedden', 4, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HRMS1', 'River Manor Boutique Hotel', 'Stellen Bosch', 'Zuid-Afrika', 'Loft studio kamer', 2, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HRMS2', 'River Manor Boutique Hotel', 'Stellen Bosch', 'Zuid-Afrika', 'Superior tweepersoonskamer', 2, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HHIH1', 'Holiday Inn', 'Harare', 'Zimbabwe', 'Standaard kamer', 3, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('HRHB1', 'Bulawayo Rainbow Hotel', 'Bulawayo', 'Zimbabwe', 'Deluxe tweepersoonskamer', 2, 'hotel');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('LAAC1', 'Sasa Safari Camp', 'Outjo', 'Namibië', 'Tweepersoonskamer met Uitzicht', 2, 'lodge');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('LASL1', 'Africa Safari Lodge', 'Mariental', 'Namibië', 'Familiekamer', 4, 'lodge');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('LIML1', 'Immanuel Wilderness Lodge', 'Windhoek', 'Namibië', 'Tweepersoonskamer met Uitzicht op de Tuin', 2, 'lodge');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('LBBL1', 'Baby Bush Lodge', 'Kiwengwa', 'Tanzania', 'Bruidssuite met Balkon', 2, 'lodge');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('LNZL1', 'Ngoma Zanga Lodge', 'Livingstone', 'Zambia', 'Deluxe kamer met kingsize bed', 3, 'lodge');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('LML1', 'Mika Lodge', 'Lusaka', 'Zambia', 'Executive Suite', 2, 'lodge');
INSERT INTO `big_five_safari`.`Accomodatie` (`accomodatieCode`, `naam`, `stad`, `land`, `kamer`, `personen`, `soort`) VALUES ('LIE1', 'Impala Ecolodge', 'Kisumu', 'Kenia', 'Luxe suite', 2, 'lodge');

COMMIT;


-- -----------------------------------------------------
-- Data for table `big_five_safari`.`Hotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `big_five_safari`;
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HIBZ1', 75, 1);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HIBZ2', 243, 0);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HZBK1', 369, 1);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HEVO1', 191, 1);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HSCW1', 105, 0);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HPHC1', 127, 0);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HRMS1', 99, 1);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HRMS2', 166, 1);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HHIH1', 64, 0);
INSERT INTO `big_five_safari`.`Hotel` (`accomodatieCode`, `prijs_per_nacht`, `ontbijt`) VALUES ('HRHB1', 90, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `big_five_safari`.`Lodge`
-- -----------------------------------------------------
START TRANSACTION;
USE `big_five_safari`;
INSERT INTO `big_five_safari`.`Lodge` (`accomodatieCode`, `prijs_per_week`, `auto_huur`) VALUES ('LAAC1', 447, 0);
INSERT INTO `big_five_safari`.`Lodge` (`accomodatieCode`, `prijs_per_week`, `auto_huur`) VALUES ('LASL1', 946, 1);
INSERT INTO `big_five_safari`.`Lodge` (`accomodatieCode`, `prijs_per_week`, `auto_huur`) VALUES ('LIML1', 788, 1);
INSERT INTO `big_five_safari`.`Lodge` (`accomodatieCode`, `prijs_per_week`, `auto_huur`) VALUES ('LBBL1', 939, 1);
INSERT INTO `big_five_safari`.`Lodge` (`accomodatieCode`, `prijs_per_week`, `auto_huur`) VALUES ('LNZL1', 899, 1);
INSERT INTO `big_five_safari`.`Lodge` (`accomodatieCode`, `prijs_per_week`, `auto_huur`) VALUES ('LML1', 1091, 1);
INSERT INTO `big_five_safari`.`Lodge` (`accomodatieCode`, `prijs_per_week`, `auto_huur`) VALUES ('LIE1', 1182, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `big_five_safari`.`Reiziger`
-- -----------------------------------------------------
START TRANSACTION;
USE `big_five_safari`;
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('MeijerP', 'Pieter', 'Meijer', 'Expeditiestraat 2', '1135 GB', 'Edam', 'Nederland', NULL);
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('FonteijnC', 'Claar', 'Fonteijn', 'Castricummerwerf 70', '1901 RF', 'Castricum', 'Nederland', 'MeijerP');
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('NazariM', 'Moustafa', 'Nazari', 'Vlakdissen 12', '1648 HJ', 'Den Goorn', 'Nederland', NULL);
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('FadilT', 'Tahera', 'Fadil', 'Houtsberg 16', '6091 NA', 'Leveroy', 'Nederland', NULL);
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('FadilO', 'Omar', 'Fadil', 'Houtsberg 16', '6091 NA', 'Leveroy', 'Nederland', 'FadilT');
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('NguyenR', 'Roy', 'Nguyen', 'Bukkemweg 1', '5081 CT', 'Hilvarenbeek', 'Nederland', NULL);
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('JeremyD', 'Demitri', 'Jeremy', 'Rijksstraatweg 289', '3956 CP', 'Leersum', 'Nederland', NULL);
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('JeremyB', 'Bram', 'Jeremy', 'Rijksstraatweg 289', '3956 CP', 'Leersum', 'Nederland', 'JeremyD');
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('JeremyD1', 'Devid', 'Jeremy', 'De Kronkels 25', '3752 LM', 'Bunschoten', 'Nederland', 'JeremyD');
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('WongH', 'Hu', 'Wong', 'Rembrandtstraat 7', '3662 HN', 'Oud-Bijerland', 'Nederland', NULL);
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('MulderF', 'Frank', 'Mulder', 'Lakenblekerstraat 49A', '1431 GE', 'Aalsmeer', 'Nederland', NULL);
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('RijenF', 'Fred', 'van Rijen', 'Einsteinstraat 10', '1446 VG', 'Purmerend', 'Nederland', 'MulderF');
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('MulderD', 'Derek', 'Mulder', 'Lakenblekerstraat 49A', '1431 GE', 'Aalsmeer', 'Nederland', 'MulderF');
INSERT INTO `big_five_safari`.`Reiziger` (`reizigersCode`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `land`, `hoofdReiziger`) VALUES ('MulderS', 'Sophie', 'Mulder', 'Lakenblekerstraat 49A', '1431 GE', 'Aalsmeer', 'Nederland', 'MulderF');

COMMIT;


-- -----------------------------------------------------
-- Data for table `big_five_safari`.`Reservering`
-- -----------------------------------------------------
START TRANSACTION;
USE `big_five_safari`;
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (1, '2020-07-12', '2020-07-19', 0, 'FadilT', 'HIBZ2');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (2, '2020-07-10', '2020-07-19', 1, 'JeremyD', 'HSCW1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (3, '2020-07-31', '2020-08-05', 0, 'WongH', 'HPHC1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (4, '2020-07-19', '2020-07-23', 0, 'FadilT', 'LBBL1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (5, '2020-07-12', '2020-08-14', 1, 'MulderF', 'LNZL1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (6, '2020-07-01', '2020-07-05', 0, 'NazariM', 'HRHB1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (7, '2020-07-05', '2020-07-08', 0, 'NazariM', 'LNZL1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (8, '2020-07-24', '2020-07-26', 1, 'NguyenR', 'HRMS1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (9, '2020-07-26', '2020-07-31', 1, 'NguyenR', 'HPHC1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (10, '2020-07-01', '2020-08-06', 1, 'NguyenR', 'LIE1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (11, '2020-08-19', '2020-08-27', 0, 'MeijerP', 'LAAC1');
INSERT INTO `big_five_safari`.`Reservering` (`idReservering`, `aankomstDatum`, `vertrekDatum`, `betaald`, `reizigersCode`, `accomodatieCode`) VALUES (12, '2020-08-27', '2020-08-31', 0, 'MeijerP', 'LIML1');

COMMIT;

  Alter Table Reservering 
	Add constraint Constraint_reservering_datums
	check(vertrekDatum > aankomstDatum);
    
   ALTER TABLE accomodatie
ADD CONSTRAINT CHK_accommodatie_code 
CHECK(accomodatieCode RLIKE '([[:alpha:]]{3}[[:digit:]]{1})'); 




Use big_five_safari;
Create View Boekingsoverzicht2 AS
select Accomodatie.naam, Accomodatie.stad, Accomodatie.land, Accomodatie.kamer, concat(Reiziger.voornaam," ",Reiziger.achternaam) as reiziger , res.aankomstDatum,
datediff(res.vertrekDatum, res.aankomstDatum) As aantalDagen, res.betaald  
From Accomodatie
INNER JOIN Reservering res On res.accomodatieCode = Accomodatie.accomodatieCode
INNER JOIN Reiziger On Reiziger.reizigersCode = res.reizigersCode
order by res.aankomstDatum;

Use big_five_safari;
Create View Boekingsoverzicht AS
select Accomodatie.naam, Accomodatie.stad, Accomodatie.kamer, Reiziger.hoofdreiziger, Accomodatie.soort, Reiziger.adres, Accomodatie.land , Reiziger.postcode, Reiziger.voornaam, Reiziger.achternaam, Reiziger.plaats, res.aankomstDatum, res.vertrekDatum, res.idReservering, res.betaald, res.reizigersCode, res.accomodatieCode
From Accomodatie
INNER JOIN Reservering res On res.accomodatieCode = Accomodatie.accomodatieCode
INNER JOIN Reiziger On Reiziger.reizigersCode = res.reizigersCode
order by res.aankomstDatum;

Create index idx_reizigerCode1 On Reservering(reizigersCode);
Create index idx_accomodatieCode1 On Reservering(accomodatieCode);
  


