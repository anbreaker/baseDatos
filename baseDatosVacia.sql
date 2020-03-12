-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: mydb, platziBlog
-- Source Schemata: , platziBlog
-- Created: Thu Mar 12 20:54:42 2020
-- Workbench Version: 6.3.8
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema mydb
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

-- ----------------------------------------------------------------------------
-- Schema platziBlog
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `platziBlog` ;
CREATE SCHEMA IF NOT EXISTS `platziBlog` DEFAULT CHARACTER SET utf8 ;

-- ----------------------------------------------------------------------------
-- Table platziBlog.categorias
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziBlog`.`categorias` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table platziBlog.comentarios
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziBlog`.`comentarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `comentarioscol` TEXT NOT NULL,
  `usuario_id` INT(11) NOT NULL,
  `post_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `comentarios_usuarios_idx` (`usuario_id` ASC),
  INDEX `comentarios_post_idx` (`post_id` ASC),
  CONSTRAINT `comentarios_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `platziBlog`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comentarios_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `platziBlog`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table platziBlog.etiquetas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziBlog`.`etiquetas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_etiquetas` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table platziBlog.post
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziBlog`.`post` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(150) NOT NULL,
  `fecha_publicacion` TIMESTAMP NULL DEFAULT NULL,
  `contenido` TEXT NOT NULL,
  `estatus` CHAR(8) NULL DEFAULT 'activo',
  `usuario_id` INT(11) NOT NULL,
  `categoria_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `post_usuarios_idx` (`usuario_id` ASC),
  INDEX `post_categorias_idx` (`categoria_id` ASC),
  CONSTRAINT `post_categorias`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `platziBlog`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `post_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `platziBlog`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table platziBlog.post_etiquetas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziBlog`.`post_etiquetas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `post_id` INT(11) NOT NULL,
  `etiqueta_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `postetiquetas_post_idx` (`post_id` ASC),
  INDEX `postetiquetas_etiquetas_idx` (`etiqueta_id` ASC),
  CONSTRAINT `postetiquetas_etiquetas`
    FOREIGN KEY (`etiqueta_id`)
    REFERENCES `platziBlog`.`etiquetas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `postetiquetas_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `platziBlog`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table platziBlog.usuarios
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `platziBlog`.`usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(30) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(40) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
SET FOREIGN_KEY_CHECKS = 1;
