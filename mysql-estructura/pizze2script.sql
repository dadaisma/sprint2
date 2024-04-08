-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema pizze2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizze2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizze2` DEFAULT CHARACTER SET utf8 ;
USE `pizze2` ;

-- -----------------------------------------------------
-- Table `pizze2`.`Provinces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Provinces` (
  `id_provincia` INT NOT NULL,
  `nom` VARCHAR(255) NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`Localitads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Localitads` (
  `id_localitads` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `Provinces_id_provincia` INT NULL,
  PRIMARY KEY (`id_localitads`),
  INDEX `fk_Localitads_Provinces1_idx` (`Provinces_id_provincia` ASC) ,
  CONSTRAINT `fk_Localitads_Provinces1`
    FOREIGN KEY (`Provinces_id_provincia`)
    REFERENCES `pizze2`.`Provinces` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Clients` (
  `id_client` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `postal code` VARCHAR(5) NULL,
  `phone` VARCHAR(15) NULL,
  `Localitads_id_localitads` INT NOT NULL,
  PRIMARY KEY (`Localitads_id_localitads`, `id_client`),
  CONSTRAINT `fk_id_localitads`
    FOREIGN KEY (`Localitads_id_localitads`)
    REFERENCES `pizze2`.`Localitads` (`id_localitads`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_provincia`
    FOREIGN KEY (`Localitads_id_localitads`)
    REFERENCES `pizze2`.`Provinces` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clients_Localitads1`
    FOREIGN KEY (`Localitads_id_localitads`)
    REFERENCES `pizze2`.`Localitads` (`id_localitads`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`Botigues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Botigues` (
  `id_botiga` INT NOT NULL AUTO_INCREMENT,  -- Add AUTO_INCREMENT for auto-generating IDs
  `address` VARCHAR(255) NULL,
  `postal code` VARCHAR(5) NULL,
  `id_localitat` INT NOT NULL,
  FOREIGN KEY (`id_localitat`) REFERENCES `pizze2`.`Localitads` (`id_localitat`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  `id_provincia` INT NOT NULL,
  FOREIGN KEY (`id_provincia`) REFERENCES `pizze2`.`Provinces` (`id_provincia`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  PRIMARY KEY (`id_botiga`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`Comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Comandes` (
  `id_comanda` INT NOT NULL,
  `data_hora` DATETIME NULL,
  `tipus_entrega` ENUM("domicili", "botiga") NULL,
  `Comandes_id_comanda` INT NOT NULL,
  PRIMARY KEY (`id_comanda`, `Comandes_id_comanda`),
  CONSTRAINT `fk_id_client`
    FOREIGN KEY (`id_comanda`)
    REFERENCES `pizze2`.`Clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_bodiga`
    FOREIGN KEY (`id_comanda`)
    REFERENCES `pizze2`.`Botigues` (`id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Categories` (
  `id_categoria` INT NOT NULL,
  `nom` VARCHAR(255) NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`Productes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Productes` (
  `id_producte` INT NOT NULL,
  `tipus` ENUM('pizza', 'hamburguesa', 'beguda') NULL,
  `nom` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `image` BLOB NULL,
  `preu` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_producte`),
  CONSTRAINT `fk_id_categoria`
    FOREIGN KEY (`id_producte`)
    REFERENCES `pizze2`.`Categories` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`DettalsComanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`DettalsComanda` (
  `quantitat` INT NOT NULL,
  `Comandes_id_comanda` INT NOT NULL,
  `Comandes_Comandes_id_comanda` INT NOT NULL,
  PRIMARY KEY (`Comandes_id_comanda`, `Comandes_Comandes_id_comanda`),
  CONSTRAINT `fk_id_comanda`
    FOREIGN KEY (`Comandes_id_comanda`)
    REFERENCES `pizze2`.`Comandes` (`id_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_producte`
    FOREIGN KEY (`Comandes_id_comanda`)
    REFERENCES `pizze2`.`Productes` (`id_producte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DettalsComanda_Comandes1`
    FOREIGN KEY (`Comandes_id_comanda` , `Comandes_Comandes_id_comanda`)
    REFERENCES `pizze2`.`Comandes` (`id_comanda` , `Comandes_id_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`Empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Empleats` (
  `id_empleat` INT NOT NULL,
  `nom` VARCHAR(255) NULL,
  `cognoms` VARCHAR(255) NULL,
  `nif` VARCHAR(9) NULL,
  `telefon` VARCHAR(15) NULL,
  `tipus_treballador` ENUM('cuiner', 'repartidor') NULL,
  PRIMARY KEY (`id_empleat`),
  CONSTRAINT `id_botiga`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `pizze2`.`Botigues` (`id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizze2`.`Repartiments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizze2`.`Repartiments` (
  `data_hora_entrega` DATETIME NULL,
  CONSTRAINT `id_comanda`
    FOREIGN KEY ()
    REFERENCES `pizze2`.`Comandes` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_empleat`
    FOREIGN KEY ()
    REFERENCES `pizze2`.`Empleats` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


