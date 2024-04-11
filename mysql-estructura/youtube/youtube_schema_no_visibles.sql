-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(60) NULL,
  `password` VARCHAR(60) NULL,
  `username` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  `sexo` ENUM("male", "female") NULL,
  `pais` VARCHAR(45) NULL,
  `codigo_postal` VARCHAR(10) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL,
  `fecha_creacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `state` ENUM("publico", "privado") NULL DEFAULT 'publico',
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `fk_playlist_usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `youtube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`canal` (
  `id_canal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL,
  `description` VARCHAR(100) NULL,
  `fecha_creacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_canal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `id_video` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(80) NULL,
  `descripcion` VARCHAR(100) NULL,
  `size` VARCHAR(20) NULL,
  `nombre_archivo_video` VARCHAR(100) NULL,
  `thumbnail` BLOB NULL,
  `reproducciones` INT NULL,
  `state` ENUM("publico", "oculto", "privado") NULL DEFAULT 'publico',
  `fecha_publicacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_playlist` INT NOT NULL,
  `id_canal` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_video`),
  INDEX `fk_video_playlist1_idx` (`id_playlist` ASC) ,
  INDEX `fk_video_canal1_idx` (`id_canal` ASC) ,
  INDEX `fk_video_usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_video_playlist1`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `youtube`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_canal1`
    FOREIGN KEY (`id_canal`)
    REFERENCES `youtube`.`canal` (`id_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `youtube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`tag` (
  `id_tag` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NULL,
  `id_video` INT NOT NULL,
  PRIMARY KEY (`id_tag`),
  INDEX `fk_tag_video1_idx` (`id_video` ASC) ,
  CONSTRAINT `fk_tag_video1`
    FOREIGN KEY (`id_video`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comentario` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `texto` TEXT(1000) NULL,
  `fecha_creacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_video` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_comentario`),
  INDEX `fk_comentario_video1_idx` (`id_video` ASC) ,
  INDEX `fk_comentario_usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_comentario_video1`
    FOREIGN KEY (`id_video`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentario_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `youtube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`like` (
  `id_like` INT NOT NULL AUTO_INCREMENT,
  `fecha` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_video` INT NOT NULL,
  `id_comentario` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_like`),
  INDEX `fk_like_video1_idx` (`id_video` ASC) ,
  INDEX `fk_like_comentario1_idx` (`id_comentario` ASC) ,
  INDEX `fk_like_usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_like_video1`
    FOREIGN KEY (`id_video`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_comentario1`
    FOREIGN KEY (`id_comentario`)
    REFERENCES `youtube`.`comentario` (`id_comentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `youtube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`dislike`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`dislike` (
  `id_dislike` INT NOT NULL AUTO_INCREMENT,
  `fecha` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_video` INT NOT NULL,
  `id_comentario` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_dislike`),
  INDEX `fk_dislike_video_idx` (`id_video` ASC) ,
  INDEX `fk_dislike_comentario1_idx` (`id_comentario` ASC) ,
  INDEX `fk_dislike_usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_dislike_video`
    FOREIGN KEY (`id_video`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dislike_comentario1`
    FOREIGN KEY (`id_comentario`)
    REFERENCES `youtube`.`comentario` (`id_comentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dislike_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `youtube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`subscription` (
  `id_subscription` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `canal_id_canal` INT NOT NULL,
  PRIMARY KEY (`id_subscription`),
  INDEX `fk_subscription_usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_subscription_canal1_idx` (`canal_id_canal` ASC) ,
  CONSTRAINT `fk_subscription_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `youtube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription_canal1`
    FOREIGN KEY (`canal_id_canal`)
    REFERENCES `youtube`.`canal` (`id_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


