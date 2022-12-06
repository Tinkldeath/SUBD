USE `musical_player`;
DROP procedure IF EXISTS `getAlbums`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`getAlbums`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAlbums`()
BEGIN
	SELECT
    idAlbum as id,
	Album.Title as title,
	(SELECT Artist.Name FROM Artist WHERE Artist.idArtist = Album.Artist_idArtist) as artist,
	(SELECT COUNT(*) FROM Album_has_Track WHERE Album_idAlbum = idAlbum) as tracks
	FROM Album 
	ORDER BY Album.idAlbum;
END$$

DELIMITER ;
;
