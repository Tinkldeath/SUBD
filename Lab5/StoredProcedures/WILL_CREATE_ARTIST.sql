USE `musical_player`;
DROP procedure IF EXISTS `willCreateArtist`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willCreateArtist` (Name VARCHAR(45))
BEGIN
	IF NOT EXISTS(SELECT * FROM Artist WHERE Artist.Name = Name) THEN
		INSERT INTO Artist (Name) VALUES (Name);
	END IF;
END$$

DELIMITER ;

