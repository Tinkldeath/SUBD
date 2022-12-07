USE `musical_player`;
DROP procedure IF EXISTS `willDeleteArtistFromTrack`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willDeleteArtistFromTrack` (idTrack INT, idArtist INT)
BEGIN
	IF EXISTS(SELECT * FROM Track WHERE Track.idTrack = idTrack) AND EXISTS(SELECT * FROM Artist WHERE Artist.idArtist = idArtist) THEN
		IF EXISTS(SELECT * FROM Track_has_Artist WHERE Track_has_Artist.Track_idTrack = idTrack AND Track_has_Artist.Artist_idArtist = idArtist) THEN
			DELETE FROM Track_has_Artist WHERE Track_idTrack = idTrack AND Artist_idArtist = idArtist;
            SELECT 
				Track.idTrack as id, 
                Artist.Name as artist FROM Track 
				INNER JOIN Track_has_Artist ON Track_has_Artist.Track_idTrack = idTrack
                INNER JOIN Artist ON Track_has_Artist.Artist_idArtist = Artist.idArtist;
        END IF;
    END IF;
END$$

DELIMITER ;

