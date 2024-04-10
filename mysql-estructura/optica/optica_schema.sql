-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`direccion` (
  `id_direccion` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(80) NULL,
  `numero` VARCHAR(10) NULL,
  `piso` VARCHAR(45) NULL,
  `puerta` VARCHAR(10) NULL,
  `codigo_postal` VARCHAR(10) NULL,
  `localitad` VARCHAR(80) NULL,
  `provincia` VARCHAR(45) NULL,
  `pais` VARCHAR(80) NULL,
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`provedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`provedor` (
  `id_provedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `telefono` VARCHAR(13) NULL,
  `nif` VARCHAR(20) NULL,
  `fax` VARCHAR(13) NULL,
  `id_direccion` INT NOT NULL,
  PRIMARY KEY (`id_provedor`),
  INDEX `id_direccion` (`id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_provedor_direccion1`
    FOREIGN KEY (`id_direccion`)
    REFERENCES `optica`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `id_provedor` INT NOT NULL,
  PRIMARY KEY (`id_marca`),
  INDEX `id_provedor` (`id_provedor` ASC) VISIBLE,
  CONSTRAINT `fk_marca_provedor`
    FOREIGN KEY (`id_provedor`)
    REFERENCES `optica`.`provedor` (`id_provedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`gafas` (
  `id_gafas` INT NOT NULL AUTO_INCREMENT,
  `graduacion` VARCHAR(45) NULL,
  `montura` ENUM("flotant", "pasta", "metàl·lica") NULL,
  `color_montura` VARCHAR(45) NULL,
  `color_cristal` VARCHAR(45) NULL,
  `precio` DECIMAL(10,2) NULL,
  `id_marca` INT NOT NULL,
  PRIMARY KEY (`id_gafas`),
  INDEX `id_marca` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `fk_gafas_marca1`
    FOREIGN KEY (`id_marca`)
    REFERENCES `optica`.`marca` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `telefono` VARCHAR(13) NULL,
  `email` VARCHAR(60) NULL,
  `fecha_registro` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_direccion` INT NOT NULL,
  `id_cliente_recomendado` INT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `id_direccion` (`id_direccion` ASC) VISIBLE,
  INDEX `id_cliente_recomendado` (`id_cliente_recomendado` ASC) INVISIBLE,
  CONSTRAINT `fk_cliente_direccion1`
    FOREIGN KEY (`id_direccion`)
    REFERENCES `optica`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_cliente1`
    FOREIGN KEY (`id_cliente_recomendado`)
    REFERENCES `optica`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `telefono` VARCHAR(13) NULL,
  `nif` VARCHAR(20) NULL,
  `id_direccion` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `id_direccion` (`id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_direccion1`
    FOREIGN KEY (`id_direccion`)
    REFERENCES `optica`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`venta` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `importe` DECIMAL(10,2) NULL,
  `fecha_registro` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `id_gafas` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `id_cliente` (`id_cliente` ASC) VISIBLE,
  INDEX `id_empleado` (`id_empleado` ASC) VISIBLE,
  INDEX `id_gafas` (`id_gafas` ASC) VISIBLE,
  CONSTRAINT `fk_venta_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `optica`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_empleado1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `optica`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_gafas1`
    FOREIGN KEY (`id_gafas`)
    REFERENCES `optica`.`gafas` (`id_gafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
