USE `musical_player`;
DROP procedure IF EXISTS `willCreateAlbum`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willCreateAlbum` (Title VARCHAR(45), Artist_idArtist INT)
BEGIN
	IF (SELECT NOT EXISTS( SELECT Title FROM Album WHERE Album.Title = Title AND Album.Artist_idArtist = Artist_idArtist)) THEN
		INSERT INTO Album (Title, Artist_idArtist) VALUES (Title, Artist_idArtist);
	END IF;
END$$

DELIMITER ;

