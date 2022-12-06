USE `musical_player`;
DROP procedure IF EXISTS `tracksForAlbum`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`tracksForAlbum`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tracksForAlbum`(idAlbum INT)
BEGIN
	SELECT 
    Track.Title as title,
    Artist.Name as artist
    FROM Track 
		INNER JOIN Album_has_Track ON Album_has_Track.Track_idTrack = idTrack AND Album_has_Track.Album_idAlbum = idAlbum
        INNER JOIN Track_has_Artist ON Album_has_Track.Track_idTrack = Track_has_Artist.Track_idTrack
        INNER JOIN Artist ON Track_has_Artist.Artist_idArtist = Artist.idArtist
	ORDER BY Track.idTrack;
END$$

DELIMITER ;
;
