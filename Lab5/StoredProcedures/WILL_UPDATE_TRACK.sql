USE `musical_player`;
DROP procedure IF EXISTS `willUpdateTrack`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willUpdateTrack`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willUpdateTrack`(idTrack INT, Title VARCHAR(45))
BEGIN
	UPDATE Track SET 
		Track.Title = Title
	WHERE Track.idTrack = idTrack;
	CALL getTracks();
END$$

DELIMITER ;
;
