USE `musical_player`;
DROP procedure IF EXISTS `willDeleteGenre`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willDeleteGenre`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willDeleteGenre`(idGenre INT)
BEGIN
	DELETE FROM Track_has_Genre WHERE Track_has_Genre.Genre_idGenre = idGenre;
    DELETE FROM Genre WHERE Genre.idGenre = idGenre;
    CALL getGenres();
END$$

DELIMITER ;
;

