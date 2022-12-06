USE `musical_player`;
DROP procedure IF EXISTS `albumsForArtist`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`albumsForArtist`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `albumsForArtist`(idArtist INT)
BEGIN
	SELECT
    Album.idAlbum as id,
	Album.Title as title,
	(SELECT Artist.Name FROM Artist WHERE Artist.idArtist = Album.Artist_idArtist) as artist,
	(SELECT COUNT(*) FROM Album_has_Track WHERE Album_idAlbum = idAlbum) as tracks
	FROM Album WHERE Album.Artist_idArtist = idArtist
	ORDER BY Album.idAlbum;
END$$

DELIMITER ;
;

