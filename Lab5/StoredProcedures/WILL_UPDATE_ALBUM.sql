USE `musical_player`;
DROP procedure IF EXISTS `willUpdateAlbum`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willUpdateAlbum` (idAlbum INT, Title VARCHAR(45), Artist_idArtist INT)
BEGIN
	IF EXISTS(SELECT * FROM Album WHERE Album.idAlbum = idAlbum) THEN 
		UPDATE Album SET
			Album.Title = Title,
            Album.Artist_idArtist = Artist_idArtist
		WHERE Album.idAlbum = idAlbum;
	END IF;
END$$

DELIMITER ;

