USE `musical_player`;
DROP procedure IF EXISTS `willUpdateAlbum`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willUpdateAlbum`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willUpdateAlbum`(idAlbum INT, Title VARCHAR(45))
BEGIN
	IF EXISTS(SELECT * FROM Album WHERE Album.idAlbum = idAlbum) THEN 
		UPDATE Album SET
			Album.Title = Title
		WHERE Album.idAlbum = idAlbum;
	END IF;
END$$

DELIMITER ;
;

