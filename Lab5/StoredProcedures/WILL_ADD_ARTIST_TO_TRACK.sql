USE `musical_player`;
DROP procedure IF EXISTS `willAddArtistToTrack`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willAddArtistToTrack`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willAddArtistToTrack`(idTrack INT, idArtist INT)
BEGIN
	IF EXISTS(SELECT * FROM Track WHERE Track.idTrack = idTrack) AND EXISTS(SELECT * FROM Artist WHERE Artist.idArtist = idArtist) THEN
		IF NOT EXISTS(SELECT * FROM Track_has_Artist WHERE Track_has_Artist.Track_idTrack = idTrack AND Track_has_Artist.Artist_idArtist = idArtist) THEN
			INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (idTrack, idArtist);
            SELECT 
				Track.idTrack as id, 
                Artist.Name as artist FROM Track 
				INNER JOIN Track_has_Artist ON Track_has_Artist.Track_idTrack = idTrack
                INNER JOIN Artist ON Track_has_Artist.Artist_idArtist = idArtist;
        END IF;
    END IF;
END$$

DELIMITER ;
;

