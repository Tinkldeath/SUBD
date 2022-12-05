USE `musical_player`;
DROP procedure IF EXISTS `willDeleteGenre`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willDeleteGenre` (idGenre INT)
BEGIN
	DELETE FROM Track_has_Genre WHERE Genre_idGenre = idGenre;
END$$

DELIMITER ;

