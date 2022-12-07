USE `musical_player`;
DROP procedure IF EXISTS `willUpdateGenre`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willUpdateGenre`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willUpdateGenre`(idGenre INT, Title VARCHAR(45))
BEGIN
	IF EXISTS(SELECT * FROM Genre WHERE Genre.idGenre = idGenre) THEN
		UPDATE Genre SET Genre.Title = Title WHERE Genre.idGenre = idGenre;
        CALL getGenres();
	END IF;
END$$

DELIMITER ;
;

