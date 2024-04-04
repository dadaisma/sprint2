-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`province` (
  `idprovince` INT NOT NULL AUTO_INCREMENT,
  `province` VARCHAR(45) NULL,
  PRIMARY KEY (`idprovince`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`city` (
  `idcity` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `province_idprovince` INT NOT NULL,
  PRIMARY KEY (`idcity`, `province_idprovince`),
  INDEX `fk_city_province1_idx` (`province_idprovince` ASC) ,
  CONSTRAINT `fk_city_province1`
    FOREIGN KEY (`province_idprovince`)
    REFERENCES `pizzeria`.`province` (`idprovince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`customer` (
  `idcustomer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `code` INT NOT NULL,
  `phone` INT NOT NULL,
  `city_idcity` INT NOT NULL,
  PRIMARY KEY (`idcustomer`, `city_idcity`),
  INDEX `fk_customer_city1_idx` (`city_idcity` ASC) ,
  CONSTRAINT `fk_customer_city1`
    FOREIGN KEY (`city_idcity`)
    REFERENCES `pizzeria`.`city` (`idcity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`restaurant` (
  `idrestaurant` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `code` INT NULL,
  `phone` INT NULL,
  `city_idcity` INT NOT NULL,
  PRIMARY KEY (`idrestaurant`, `city_idcity`),
  INDEX `fk_restaurant_city1_idx` (`city_idcity` ASC) ,
  CONSTRAINT `fk_restaurant_city1`
    FOREIGN KEY (`city_idcity`)
    REFERENCES `pizzeria`.`city` (`idcity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`order` (
  `idorder` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` DATETIME(2) NOT NULL,
  `tipo` ENUM("internal", "delivery") NOT NULL,
  `total` DECIMAL(2) NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  `restaurant_idrestaurant` INT NOT NULL,
  PRIMARY KEY (`idorder`),
  INDEX `fk_order_customer1_idx` (`customer_idcustomer` ASC) ,
  INDEX `fk_order_restaurant1_idx` (`restaurant_idrestaurant` ASC) ,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `pizzeria`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_restaurant1`
    FOREIGN KEY (`restaurant_idrestaurant`)
    REFERENCES `pizzeria`.`restaurant` (`idrestaurant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`category` (
  `idcategory` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategory`),
  UNIQUE INDEX `description_UNIQUE` (`description` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`foodanddrinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`foodanddrinks` (
  `idfood` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  `price` DECIMAL(2) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `img` BLOB NULL,
  `order_idorder` INT NOT NULL,
  `order_customer_idcustomer` INT NOT NULL,
  `category_idcategory` INT NOT NULL,
  PRIMARY KEY (`idfood`, `order_idorder`, `order_customer_idcustomer`, `category_idcategory`),
  INDEX `fk_foodanddrinks_order1_idx` (`order_idorder` ASC, `order_customer_idcustomer` ASC) ,
  INDEX `fk_foodanddrinks_category1_idx` (`category_idcategory` ASC) ,
  CONSTRAINT `fk_foodanddrinks_order1`
    FOREIGN KEY (`order_idorder` , `order_customer_idcustomer`)
    REFERENCES `pizzeria`.`order` (`idorder` , `customer_idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foodanddrinks_category1`
    FOREIGN KEY (`category_idcategory`)
    REFERENCES `pizzeria`.`category` (`idcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `idemployee` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `nif` VARCHAR(45) NULL,
  `phone` INT NULL,
  `restaurant_idrestaurant` INT NOT NULL,
  `restaurant_city_idcity` INT NOT NULL,
  PRIMARY KEY (`idemployee`, `restaurant_idrestaurant`, `restaurant_city_idcity`),
  INDEX `fk_employee_restaurant1_idx` (`restaurant_idrestaurant` ASC, `restaurant_city_idcity` ASC) ,
  CONSTRAINT `fk_employee_restaurant1`
    FOREIGN KEY (`restaurant_idrestaurant` , `restaurant_city_idcity`)
    REFERENCES `pizzeria`.`restaurant` (`idrestaurant` , `city_idcity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`role` (
  `idrole` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL,
  `employee_idemployee` INT NOT NULL,
  `employee_restaurant_idrestaurant` INT NOT NULL,
  PRIMARY KEY (`idrole`, `employee_idemployee`, `employee_restaurant_idrestaurant`),
  INDEX `fk_role_employee1_idx` (`employee_idemployee` ASC, `employee_restaurant_idrestaurant` ASC) ,
  CONSTRAINT `fk_role_employee1`
    FOREIGN KEY (`employee_idemployee` , `employee_restaurant_idrestaurant`)
    REFERENCES `pizzeria`.`employee` (`idemployee` , `restaurant_idrestaurant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`deliveryschedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`deliveryschedule` (
  `iddeliveryschedule` INT NOT NULL AUTO_INCREMENT,
  `orderreceived` DATETIME NOT NULL,
  `orderdelivered` DATETIME NOT NULL,
  `employee_idemployee` INT NOT NULL,
  `employee_restaurant_idrestaurant` INT NOT NULL,
  `employee_restaurant_city_idcity` INT NOT NULL,
  PRIMARY KEY (`iddeliveryschedule`),
  INDEX `fk_deliveryschedule_employee1_idx` (`employee_idemployee` ASC, `employee_restaurant_idrestaurant` ASC, `employee_restaurant_city_idcity` ASC) ,
  CONSTRAINT `fk_deliveryschedule_employee1`
    FOREIGN KEY (`employee_idemployee` , `employee_restaurant_idrestaurant` , `employee_restaurant_city_idcity`)
    REFERENCES `pizzeria`.`employee` (`idemployee` , `restaurant_idrestaurant` , `restaurant_city_idcity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Data for table `pizzeria`.`province`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzeria`;
INSERT INTO `pizzeria`.`province` (`idprovince`, `province`) VALUES (01, 'bcn');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizzeria`.`city`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzeria`;
INSERT INTO `pizzeria`.`city` (`idcity`, `city`, `province_idprovince`) VALUES (01, 'barcelona', 01);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizzeria`.`customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzeria`;
INSERT INTO `pizzeria`.`customer` (`idcustomer`, `name`, `surname`, `address`, `code`, `phone`, `city_idcity`) VALUES (01, 'antonio', 'capone', 'via porto 6', 31100, 31312121, 01);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizzeria`.`restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzeria`;
INSERT INTO `pizzeria`.`restaurant` (`idrestaurant`, `name`, `address`, `code`, `phone`, `city_idcity`) VALUES (01, 'pizzeria da sogno', 'carrer sagrada', 080844, 34323232, 01);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizzeria`.`order`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzeria`;
INSERT INTO `pizzeria`.`order` (`idorder`, `date`, `time`, `tipo`, `total`, `customer_idcustomer`, `restaurant_idrestaurant`) VALUES (01, '2024-04-01', '2024-04-01 11:01:00', 'internal', 223,50, 01, 01);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizzeria`.`foodanddrinks`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzeria`;
INSERT INTO `pizzeria`.`foodanddrinks` (`idfood`, `description`, `price`, `name`, `img`, `order_idorder`, `order_customer_idcustomer`, `category_idcategory`) VALUES (01, 'pizza', 12, 'pizza ai funghi', NULL, 01, 01, 01);
INSERT INTO `pizzeria`.`foodanddrinks` (`idfood`, `description`, `price`, `name`, `img`, `order_idorder`, `order_customer_idcustomer`, `category_idcategory`) VALUES (02, 'hamurger', 22, 'hamb bau', NULL, DEFAULT, DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizzeria`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzeria`;
INSERT INTO `pizzeria`.`employee` (`idemployee`, `name`, `surname`, `nif`, `phone`, `restaurant_idrestaurant`, `restaurant_city_idcity`) VALUES (DEFAULT, 'gianni', 'pirlo', '43943w', 34343040, 01, barcelona);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizzeria`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzeria`;
INSERT INTO `pizzeria`.`role` (`idrole`, `role`, `employee_idemployee`, `employee_restaurant_idrestaurant`) VALUES (01, 'pizzaiolo', 01, 01);

COMMIT;

