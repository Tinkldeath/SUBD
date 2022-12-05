USE `musical_player`;
DROP procedure IF EXISTS `updateGenresView`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `updateGenresView` ()
BEGIN
	CREATE OR REPLACE VIEW AllGenresView AS
	SELECT
	Genre.Title as Genre,
	(SELECT COUNT(*) FROM Track_has_Genre WHERE Genre_idGenre = idGenre) as Tracks,
	(SELECT COUNT(DISTINCT(idAlbum)) FROM Album 
		INNER JOIN Album_has_Track 
		INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = Album_has_Track.Track_idTrack AND Track_has_Genre.Genre_idGenre = idGenre) as Albums,
	(SELECT COUNT(DISTINCT(idArtist)) FROM Artist 
		INNER JOIN Track_has_Artist 
		INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = Track_has_Artist.Track_idTrack  AND Track_has_Genre.Genre_idGenre = idGenre) as Artists
	FROM Genre
	ORDER BY Genre.idGenre;
END$$

DELIMITER ;

