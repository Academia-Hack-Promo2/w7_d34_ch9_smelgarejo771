-- MySQL Script generated by MySQL Workbench
-- sáb 04 abr 2015 20:28:10 VET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema facturas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema facturas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `facturas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `facturas` ;

-- -----------------------------------------------------
-- Table `facturas`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturas`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cedula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `cedula`),
  UNIQUE INDEX `cedula_UNIQUE` (`cedula` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturas`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturas`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `existencias` INT NOT NULL,
  `precio` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturas`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturas`.`facturas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `date` DATE NOT NULL,
  `nombre_cliente` VARCHAR(45) NULL,
  `clientes_id` INT NOT NULL,
  `clientes_cedula` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_facturas_clientes1_idx` (`clientes_id` ASC, `clientes_cedula` ASC),
  CONSTRAINT `fk_facturas_clientes1`
    FOREIGN KEY (`clientes_id` , `clientes_cedula`)
    REFERENCES `facturas`.`clientes` (`id` , `cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturas`.`detalles_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturas`.`detalles_factura` (
  `facturas_id` INT NOT NULL,
  `productos_id` INT NOT NULL,
  `cantidad ordenada` INT NOT NULL,
  `precio_unidad` INT NOT NULL,
  INDEX `fk_detalles_factura_facturas1_idx` (`facturas_id` ASC),
  INDEX `fk_detalles_factura_productos1_idx` (`productos_id` ASC),
  PRIMARY KEY (`facturas_id`, `productos_id`),
  CONSTRAINT `fk_detalles_factura_facturas1`
    FOREIGN KEY (`facturas_id`)
    REFERENCES `facturas`.`facturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_factura_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `facturas`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
