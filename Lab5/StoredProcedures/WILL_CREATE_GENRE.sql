USE `musical_player`;
DROP procedure IF EXISTS `willCreateGenre`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willCreateGenre` (Title VARCHAR(45))
BEGIN
	IF NOT EXISTS(SELECT * FROM Genre WHERE Genre.Title = Title) THEN 
		INSERT INTO Genre (Title) VALUES (Title);
        CALL getGenres();
	END IF;
END$$

DELIMITER ;

