-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria4` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria4` ;

-- -----------------------------------------------------
-- Table `pizzeria4`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`provincia` (
  `id_provincia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria4`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`localidad` (
  `id_localidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_localidad`),
  INDEX `id_provincia` (`id_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_id_provincia`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `pizzeria4`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria4`.`pizzeria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`pizzeria` (
  `id_pizzeria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `telefono` VARCHAR(13) NULL,
  `direccion` VARCHAR(100) NULL,
  `codigo_postal` VARCHAR(10) NULL,
  `pizzeriacol` VARCHAR(45) NULL,
  `id_localidad` INT NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_pizzeria`),
  INDEX `id_localitad` (`id_localidad` ASC) VISIBLE,
  INDEX `id_provincia` (`id_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_id_localidad`
    FOREIGN KEY (`id_localidad`)
    REFERENCES `pizzeria4`.`localidad` (`id_localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk1_id_provincia`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `pizzeria4`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria4`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(100) NULL,
  `direccion` VARCHAR(100) NULL,
  `codigo_postal` VARCHAR(10) NULL,
  `telefono` VARCHAR(13) NULL,
  `id_provincia` INT NOT NULL,
  `id_localidad` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `id_provincia` (`id_provincia` ASC) VISIBLE,
  INDEX `id_localidad` (`id_localidad` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_provincia1`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `pizzeria4`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_localidad1`
    FOREIGN KEY (`id_localidad`)
    REFERENCES `pizzeria4`.`localidad` (`id_localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria4`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(100) NULL,
  `nif` VARCHAR(12) NULL,
  `telefono` VARCHAR(13) NULL,
  `puesto` ENUM("cocinero", "repartidor") NULL,
  `id_pizzeria` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `id_pizzeria` (`id_pizzeria` ASC) VISIBLE,
  CONSTRAINT `fk_id_pizzeria`
    FOREIGN KEY (`id_pizzeria`)
    REFERENCES `pizzeria4`.`pizzeria` (`id_pizzeria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria4`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_entrega` TIMESTAMP NULL DEFAULT NULL,
  `entrega` ENUM('tienda', 'domicilio') NULL DEFAULT 'tienda',
  `total` DECIMAL(8,2) NULL,
  `id_empleado` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `id_empleado` (`id_empleado` ASC) VISIBLE,
  INDEX `id_cliente` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `pizzeria4`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `pizzeria4`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria4`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria4`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(250) NULL,
  `imagen` VARCHAR(45) NULL,
  `precio` DECIMAL(8,2) NULL,
  `tipo` ENUM('pizza', 'hamburguesa', 'bebida') NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `id_categoria` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `pizzeria4`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria4`.`detalle_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria4`.`detalle_pedido` (
  `id_detalle` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT(20) NULL,
  `id_pedido` INT NOT NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_detalle`),
  INDEX `id_pedido` (`id_pedido` ASC) VISIBLE,
  INDEX `id_producto` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_id_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `pizzeria4`.`pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `pizzeria4`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
