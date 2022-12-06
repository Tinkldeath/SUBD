USE `musical_player`;
DROP procedure IF EXISTS `checkAlbumExists`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `checkAlbumExists` (Title VARCHAR(45), Album_idAlbum INT)
BEGIN
	(SELECT Title FROM Album WHERE Album.Title = Title AND Album.Artist_idArtist = Artist_idArtist);
END$$

DELIMITER ;

