USE `musical_player`;
DROP procedure IF EXISTS `willUpdateTrack`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willUpdateTrack` (idTrack INT, Title VARCHAR(45))
BEGIN
	IF EXISTS(SELECT * FROM Track WHERE Track.idTrack = idTrack) THEN 
		UPDATE Track SET 
			Track.Title = Title
		WHERE Track.idTrack = idTrack;
        CALL getTracks();
    END IF;
END$$

DELIMITER ;

