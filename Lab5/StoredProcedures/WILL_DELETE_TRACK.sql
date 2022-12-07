USE `musical_player`;
DROP procedure IF EXISTS `willDeleteTrack`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willDeleteTrack`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willDeleteTrack`(idTrack INT)
BEGIN
	DELETE FROM Album_has_Track WHERE Track_idTrack = idTrack;
    DELETE FROM Playlist_has_Track WHERE Track_idTrack = idTrack;
    DELETE FROM Track_has_Artist WHERE Track_idTrack = idTrack;
    DELETE FROM Track_has_Genre WHERE Track_idTrack = idTrack;
    DELETE FROM Track WHERE Track.idTrack = idTrack;
    CALL getTracks();
END$$

DELIMITER ;
;

