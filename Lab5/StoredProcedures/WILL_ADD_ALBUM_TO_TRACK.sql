USE `musical_player`;
DROP procedure IF EXISTS `willAddAlbumToTrack`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willAddAlbumToTrack` (idTrack INT, idAlbum INT)
BEGIN
	IF EXISTS(SELECT * FROM Track WHERE Track.idTrack = idTrack) AND EXISTS(SELECT * FROM Album WHERE Album.idAlbum = idAlbum) THEN 
		IF NOT EXISTS(SELECT * FROM Album_has_Track WHERE Album_has_Track.Album_idAlbum = idAlbum AND Album_has_Track.Track_idTrack = idTrack) THEN
			INSERT INTO Album_has_Track (Track_idTrack, Album_idAlbum) VALUES (idTrack, idAlbum);
            CALL getTracks();
        END IF;
    END IF;
END$$

DELIMITER ;

