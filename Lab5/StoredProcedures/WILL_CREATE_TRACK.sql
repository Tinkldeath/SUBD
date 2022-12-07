USE `musical_player`;
DROP procedure IF EXISTS `willCreateTrack`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willCreateTrack`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willCreateTrack`(Title VARCHAR(45))
BEGIN
	INSERT INTO Track (Title) VALUES (Title);
	SELECT idTrack FROM Track ORDER BY idTrack DESC LIMIT 1;
END$$

DELIMITER ;
;

