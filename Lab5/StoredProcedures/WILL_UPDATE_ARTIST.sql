USE `musical_player`;
DROP procedure IF EXISTS `willUpdateArtist`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willUpdateArtist`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willUpdateArtist`(idArtist INT, Name VARCHAR(45))
BEGIN
	IF EXISTS(SELECT * FROM Artist WHERE Artist.idArtist = idArtist) THEN
		UPDATE Artist SET Artist.Name = Name WHERE Artist.idArtist = idArtist;
        SELECT 
		Artist.idArtist as id,
        Artist.Name as Name
        FROM Artist
        WHERE Artist.idArtist = idArtist;
	END IF;
    CALL getArtists();
END$$

DELIMITER ;
;

