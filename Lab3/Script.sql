-- MySQL Workbench Synchronization
-- Generated: 2022-12-03 17:52
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Dima

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `musical_player` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `musical_player`.`Genre` (
  `idGenre` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`Artist` (
  `idArtist` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idArtist`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`Album` (
  `idAlbum` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `Artist_idArtist` INT(11) NOT NULL,
  PRIMARY KEY (`idAlbum`),
  INDEX `fk_Album_Artist_idx` (`Artist_idArtist` ASC) VISIBLE,
  CONSTRAINT `fk_Album_Artist`
    FOREIGN KEY (`Artist_idArtist`)
    REFERENCES `musical_player`.`Artist` (`idArtist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`Track` (
  `idTrack` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTrack`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`Track_has_Artist` (
  `Track_idTrack` INT(11) NOT NULL,
  `Artist_idArtist` INT(11) NOT NULL,
  PRIMARY KEY (`Track_idTrack`, `Artist_idArtist`),
  INDEX `fk_Track_has_Artist_Artist1_idx` (`Artist_idArtist` ASC) VISIBLE,
  INDEX `fk_Track_has_Artist_Track1_idx` (`Track_idTrack` ASC) VISIBLE,
  CONSTRAINT `fk_Track_has_Artist_Track1`
    FOREIGN KEY (`Track_idTrack`)
    REFERENCES `musical_player`.`Track` (`idTrack`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Track_has_Artist_Artist1`
    FOREIGN KEY (`Artist_idArtist`)
    REFERENCES `musical_player`.`Artist` (`idArtist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`Album_has_Track` (
  `Album_idAlbum` INT(11) NOT NULL,
  `Track_idTrack` INT(11) NOT NULL,
  PRIMARY KEY (`Album_idAlbum`, `Track_idTrack`),
  INDEX `fk_Album_has_Track_Track1_idx` (`Track_idTrack` ASC) VISIBLE,
  INDEX `fk_Album_has_Track_Album1_idx` (`Album_idAlbum` ASC) VISIBLE,
  CONSTRAINT `fk_Album_has_Track_Album1`
    FOREIGN KEY (`Album_idAlbum`)
    REFERENCES `musical_player`.`Album` (`idAlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_has_Track_Track1`
    FOREIGN KEY (`Track_idTrack`)
    REFERENCES `musical_player`.`Track` (`idTrack`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`Track_has_Genre` (
  `Track_idTrack` INT(11) NOT NULL,
  `Genre_idGenre` INT(11) NOT NULL,
  PRIMARY KEY (`Track_idTrack`, `Genre_idGenre`),
  INDEX `fk_Track_has_Genre_Genre1_idx` (`Genre_idGenre` ASC) VISIBLE,
  INDEX `fk_Track_has_Genre_Track1_idx` (`Track_idTrack` ASC) VISIBLE,
  CONSTRAINT `fk_Track_has_Genre_Track1`
    FOREIGN KEY (`Track_idTrack`)
    REFERENCES `musical_player`.`Track` (`idTrack`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Track_has_Genre_Genre1`
    FOREIGN KEY (`Genre_idGenre`)
    REFERENCES `musical_player`.`Genre` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`User` (
  `idUser` INT(11) NOT NULL AUTO_INCREMENT,
  `Login` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Permission` INT(11) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`Playlist` (
  `idPlaylist` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `User_idUser` INT(11) NOT NULL,
  PRIMARY KEY (`idPlaylist`),
  INDEX `fk_Playlist_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Playlist_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `musical_player`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musical_player`.`Playlist_has_Track` (
  `Playlist_idPlaylist` INT(11) NOT NULL,
  `Track_idTrack` INT(11) NOT NULL,
  PRIMARY KEY (`Playlist_idPlaylist`, `Track_idTrack`),
  INDEX `fk_Playlist_has_Track_Track1_idx` (`Track_idTrack` ASC) VISIBLE,
  INDEX `fk_Playlist_has_Track_Playlist1_idx` (`Playlist_idPlaylist` ASC) VISIBLE,
  CONSTRAINT `fk_Playlist_has_Track_Playlist1`
    FOREIGN KEY (`Playlist_idPlaylist`)
    REFERENCES `musical_player`.`Playlist` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Playlist_has_Track_Track1`
    FOREIGN KEY (`Track_idTrack`)
    REFERENCES `musical_player`.`Track` (`idTrack`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
