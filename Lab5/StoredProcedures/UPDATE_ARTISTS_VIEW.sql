USE `musical_player`;
DROP procedure IF EXISTS `updateAritstsView`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `updateAritstsView` ()
BEGIN
	CREATE OR REPLACE VIEW AllArtistsView AS
	SELECT 
	Artist.Name as Artist,
	(SELECT COUNT(*) FROM Album WHERE Album.Artist_idArtist = Artist.idArtist) as Albums,
	(SELECT COUNT(*) FROM Track_has_Artist WHERE Track_has_Artist.Artist_idArtist = Artist.idArtist) as Tracks
	FROM Artist
	ORDER BY Artist.idArtist;
END$$

DELIMITER ;

