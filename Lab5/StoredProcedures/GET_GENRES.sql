USE `musical_player`;
DROP procedure IF EXISTS `getGenres`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`getGenres`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGenres`()
BEGIN
	SELECT
    Genre.idGenre as id,
	Genre.Title as title,
	(SELECT COUNT(*) FROM Track_has_Genre WHERE Genre_idGenre = idGenre) as tracks,
	(SELECT COUNT(DISTINCT(idAlbum)) FROM Album 
		INNER JOIN Album_has_Track 
		INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = Album_has_Track.Track_idTrack AND Track_has_Genre.Genre_idGenre = idGenre) as albums,
	(SELECT COUNT(DISTINCT(idArtist)) FROM Artist 
		INNER JOIN Track_has_Artist 
		INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = Track_has_Artist.Track_idTrack  AND Track_has_Genre.Genre_idGenre = idGenre) as artists
	FROM Genre
	ORDER BY Genre.idGenre;
END$$

DELIMITER ;
;

