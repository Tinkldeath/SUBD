USE `musical_player`;
DROP procedure IF EXISTS `willDeleteArtist`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willDeleteArtist`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willDeleteArtist`(idArtist INT)
BEGIN
	DELETE FROM Track_has_Artist WHERE Track_has_Artist.Artist_idArtist = idArtist;
END$$

DELIMITER ;
;

