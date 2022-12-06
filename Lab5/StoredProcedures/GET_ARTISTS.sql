USE `musical_player`;
DROP procedure IF EXISTS `getArtists`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`getArtists`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getArtists`()
BEGIN
	SELECT 
    Artist.idArtist as id,
	Artist.Name as name,
	(SELECT COUNT(*) FROM Album WHERE Album.Artist_idArtist = Artist.idArtist) as albums,
	(SELECT COUNT(*) FROM Track_has_Artist WHERE Track_has_Artist.Artist_idArtist = Artist.idArtist) as tracks
	FROM Artist
	ORDER BY Artist.idArtist;
END$$

DELIMITER ;
;

