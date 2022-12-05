USE `musical_player`;
DROP procedure IF EXISTS `willDeleteTrack`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willDeleteTrack` (idTrack INT)
BEGIN
	DELETE FROM Album_has_Track WHERE Track_idTrack = idTrack;
    DELETE FROM Playlist_has_Track WHERE Track_idTrack = idTrack;
    DELETE FROM Track_has_Artist WHERE Track_idTrack = idTrack;
    DELETE FROM Track_has_Genre WHERE Track_idTrack = idTrack;
END$$

DELIMITER ;

