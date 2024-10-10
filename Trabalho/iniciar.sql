-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Games
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Games
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Games` ;
USE `Games` ;

-- -----------------------------------------------------
-- Table `Games`.`Jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Games`.`Jogo` (
  `idJogos` INT NOT NULL AUTO_INCREMENT,
  `nome_jogo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idJogos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Games`.`Plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Games`.`Plataforma` (
  `idPlataforma` INT NOT NULL AUTO_INCREMENT,
  `nome_plataforma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPlataforma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Games`.`Jogo_Plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Games`.`Jogo_Plataforma` (
  `Jogos_idJogos` INT NOT NULL,
  `Plataforma_idPlataforma` INT NOT NULL,
  `Preco` DOUBLE NOT NULL,
  PRIMARY KEY (`Jogos_idJogos`, `Plataforma_idPlataforma`),
  INDEX `fk_Jogos_has_Plataforma_Plataforma1_idx` (`Plataforma_idPlataforma` ASC) VISIBLE,
  INDEX `fk_Jogos_has_Plataforma_Jogos_idx` (`Jogos_idJogos` ASC) VISIBLE,
  CONSTRAINT `fk_Jogos_has_Plataforma_Jogos`
    FOREIGN KEY (`Jogos_idJogos`)
    REFERENCES `Games`.`Jogo` (`idJogos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogos_has_Plataforma_Plataforma1`
    FOREIGN KEY (`Plataforma_idPlataforma`)
    REFERENCES `Games`.`Plataforma` (`idPlataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
