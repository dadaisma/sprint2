-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`address` (
  `address_id` INT NOT NULL,
  `carrer` INT NULL,
  `numero` INT NULL,
  `piso` VARCHAR(10) NULL,
  `porta` INT NULL,
  `ciudad` VARCHAR(45) NULL,
  `codigopostal` INT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`provedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`provedor` (
  `provedor_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  `fax` INT NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `address_address_id` INT NOT NULL,
  PRIMARY KEY (`provedor_id`, `address_address_id`),
  INDEX `fk_provedor_address1_idx` (`address_address_id` ASC) ,
  CONSTRAINT `fk_provedor_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `optica`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `phone` INT NULL,
  `email` VARCHAR(45) NULL,
  `fecharegistracion` DATE NULL,
  `ulleres_ulleres_id` INT NOT NULL,
  `cliente_cliente_id2` INT NOT NULL,
  `cliente_ulleres_ulleres_id` INT NOT NULL,
  `address_address_id` INT NOT NULL,
  PRIMARY KEY (`cliente_id`, `ulleres_ulleres_id`, `address_address_id`),
  INDEX `fk_cliente_cliente1_idx` (`cliente_cliente_id2` ASC, `cliente_ulleres_ulleres_id` ASC) ,
  INDEX `fk_cliente_address1_idx` (`address_address_id` ASC) ,
  CONSTRAINT `fk_cliente_cliente1`
    FOREIGN KEY (`cliente_cliente_id2` , `cliente_ulleres_ulleres_id`)
    REFERENCES `optica`.`cliente` (`cliente_id` , `ulleres_ulleres_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `optica`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleado` (
  `empleado_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`empleado_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `marca_id` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `provedor_provedor_id` INT NOT NULL,
  PRIMARY KEY (`marca_id`),
  INDEX `fk_marca_provedor1_idx` (`provedor_provedor_id` ASC) ,
  CONSTRAINT `fk_marca_provedor1`
    FOREIGN KEY (`provedor_provedor_id`)
    REFERENCES `optica`.`provedor` (`provedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `ulleres_id` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `graduacio` VARCHAR(45) NULL,
  `montura` ENUM("flotant", "pasta", "metalica") NULL,
  `color montura` VARCHAR(45) NULL,
  `color vidre` VARCHAR(45) NULL,
  `preu` DECIMAL(2) NULL,
  `cliente_cliente_id` INT NOT NULL,
  `cliente_ulleres_ulleres_id` INT NOT NULL,
  `empleado_empleado_id` INT NOT NULL,
  `marca_marca_id` INT NOT NULL,
  PRIMARY KEY (`ulleres_id`, `cliente_cliente_id`, `cliente_ulleres_ulleres_id`, `empleado_empleado_id`, `marca_marca_id`),
  INDEX `fk_ulleres_cliente1_idx` (`cliente_cliente_id` ASC, `cliente_ulleres_ulleres_id` ASC) ,
  INDEX `fk_ulleres_empleado1_idx` (`empleado_empleado_id` ASC) ,
  INDEX `fk_ulleres_marca1_idx` (`marca_marca_id` ASC) ,
  CONSTRAINT `fk_ulleres_cliente1`
    FOREIGN KEY (`cliente_cliente_id` , `cliente_ulleres_ulleres_id`)
    REFERENCES `optica`.`cliente` (`cliente_id` , `ulleres_ulleres_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_empleado1`
    FOREIGN KEY (`empleado_empleado_id`)
    REFERENCES `optica`.`empleado` (`empleado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_marca1`
    FOREIGN KEY (`marca_marca_id`)
    REFERENCES `optica`.`marca` (`marca_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`colores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`colores` (
  `color_id` INT NOT NULL,
  `rojo` VARCHAR(45) NULL,
  `verde` VARCHAR(45) NULL,
  `amarillo` VARCHAR(45) NULL,
  `blanco` VARCHAR(45) NULL,
  `negro` VARCHAR(45) NULL,
  `naranja` VARCHAR(45) NULL,
  `violeta` VARCHAR(45) NULL,
  `marron` VARCHAR(45) NULL,
  `azul` VARCHAR(45) NULL,
  `blu` VARCHAR(45) NULL,
  `rosa` VARCHAR(45) NULL,
  `gris` VARCHAR(45) NULL,
  `plata` VARCHAR(45) NULL,
  `oro` VARCHAR(45) NULL,
  `transparente` VARCHAR(45) NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ulleres_has_colores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres_has_colores` (
  `ulleres_ulleres_id` INT NOT NULL,
  `colores_color_id` INT NOT NULL,
  PRIMARY KEY (`ulleres_ulleres_id`, `colores_color_id`),
  INDEX `fk_ulleres_has_colores_colores1_idx` (`colores_color_id` ASC) ,
  INDEX `fk_ulleres_has_colores_ulleres1_idx` (`ulleres_ulleres_id` ASC) ,
  CONSTRAINT `fk_ulleres_has_colores_ulleres1`
    FOREIGN KEY (`ulleres_ulleres_id`)
    REFERENCES `optica`.`ulleres` (`ulleres_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_has_colores_colores1`
    FOREIGN KEY (`colores_color_id`)
    REFERENCES `optica`.`colores` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


