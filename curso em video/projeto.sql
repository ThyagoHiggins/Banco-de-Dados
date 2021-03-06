-- MySQL Script generated by MySQL Workbench
-- Thu Sep 24 14:11:14 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projeto_
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto_
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto_` DEFAULT CHARACTER SET utf8 ;
USE `projeto_` ;

-- -----------------------------------------------------
-- Table `projeto_`.`Escolaridade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_`.`Escolaridade` (
  `idEscolaridade` INT NOT NULL,
  `nomeescolaridade` VARCHAR(45) NULL,
  PRIMARY KEY (`idEscolaridade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_`.`categoria` (
  `idcategoria` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `valorlimite` DECIMAL(7,2) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_`.`Visitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_`.`Visitante` (
  `idVisitante` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `idade` INT NULL,
  `celular` INT(9) NULL,
  `email` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `Escolaridade_idEscolaridade` INT NOT NULL,
  `categoria_idcategoria` INT NOT NULL,
  PRIMARY KEY (`idVisitante`),
  INDEX `fk_Visitante_Escolaridade_idx` (`Escolaridade_idEscolaridade` ASC) VISIBLE,
  INDEX `fk_Visitante_categoria1_idx` (`categoria_idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Visitante_Escolaridade`
    FOREIGN KEY (`Escolaridade_idEscolaridade`)
    REFERENCES `projeto_`.`Escolaridade` (`idEscolaridade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visitante_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `projeto_`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_`.`Acervo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_`.`Acervo` (
  `idAcervo` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `criador` VARCHAR(45) NULL,
  `localcriacao` VARCHAR(45) NULL,
  `datacriacao` DATE NULL,
  `tecnica` VARCHAR(45) NULL,
  `curiosidade` MEDIUMTEXT NULL,
  PRIMARY KEY (`idAcervo`),
  UNIQUE INDEX `idAcervo_UNIQUE` (`idAcervo` ASC) VISIBLE,
  UNIQUE INDEX `nomeacervo_UNIQUE` (`titulo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_`.`Doa????o`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_`.`Doa????o` (
  `idDoa????o` INT NOT NULL,
  ` valordoado` DECIMAL(7,2) NULL,
  `Acervo_idAcervo` INT NOT NULL,
  PRIMARY KEY (`idDoa????o`),
  INDEX `fk_Doa????o_Acervo1_idx` (`Acervo_idAcervo` ASC) VISIBLE,
  CONSTRAINT `fk_Doa????o_Acervo1`
    FOREIGN KEY (`Acervo_idAcervo`)
    REFERENCES `projeto_`.`Acervo` (`idAcervo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_`.`Visitante_has_Doa????o`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_`.`Visitante_has_Doa????o` (
  `Visitante_idVisitante` INT NOT NULL,
  `Doa????o_idDoa????o` INT NOT NULL,
  PRIMARY KEY (`Visitante_idVisitante`, `Doa????o_idDoa????o`),
  INDEX `fk_Visitante_has_Doa????o_Doa????o1_idx` (`Doa????o_idDoa????o` ASC) VISIBLE,
  INDEX `fk_Visitante_has_Doa????o_Visitante1_idx` (`Visitante_idVisitante` ASC) VISIBLE,
  CONSTRAINT `fk_Visitante_has_Doa????o_Visitante1`
    FOREIGN KEY (`Visitante_idVisitante`)
    REFERENCES `projeto_`.`Visitante` (`idVisitante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visitante_has_Doa????o_Doa????o1`
    FOREIGN KEY (`Doa????o_idDoa????o`)
    REFERENCES `projeto_`.`Doa????o` (`idDoa????o`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
