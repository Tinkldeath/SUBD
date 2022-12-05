USE `musical_player`;
DROP procedure IF EXISTS `tracksForArtist`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`tracksForArtist`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tracksForArtist`(idArtist INT)
BEGIN
	SELECT 
    Track.Title as Track,
    Artist.Name as Artist
    FROM Artist
        INNER JOIN Track_has_Artist ON Track_has_Artist.Artist_idArtist = idArtist
        INNER JOIN Track ON Track_has_Artist.Track_idTrack = idTrack
	WHERE Artist.idArtist = idArtist
	ORDER BY Track.idTrack;
END$$

DELIMITER ;
;
