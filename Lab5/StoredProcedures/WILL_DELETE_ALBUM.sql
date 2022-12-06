USE `musical_player`;
DROP procedure IF EXISTS `willDeleteAlbum`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willDeleteAlbum`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willDeleteAlbum`(idAlbum INT)
BEGIN
	DELETE FROM Album_has_Track WHERE Album_idAlbum = idAlbum;
    DELETE FROM Album WHERE Album.idAlbum = idAlbum;
END$$

DELIMITER ;
;

