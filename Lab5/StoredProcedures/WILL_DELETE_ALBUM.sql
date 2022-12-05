USE `musical_player`;
DROP procedure IF EXISTS `willDeleteAlbum`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willDeleteAlbum` (idAlbum INT)
BEGIN
	DELETE FROM Album_has_Track WHERE Album_idAlbum = idAlbum;
END$$

DELIMITER ;

