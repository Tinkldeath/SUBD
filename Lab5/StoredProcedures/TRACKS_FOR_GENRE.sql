USE `musical_player`;
DROP procedure IF EXISTS `tracksForGenre`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `tracksForGenre` (idGenre INT)
BEGIN
	SELECT
    Track.Title as Track,
    Artist.Name as Artist
    FROM Track
		INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = idTrack AND Track_has_Genre.Genre_idGenre = idGenre
		INNER JOIN Track_has_Artist ON Track_has_Artist.Track_idTrack = idTrack
		INNER JOIN Artist ON Track_has_Artist.Artist_idArtist = idArtist
	ORDER BY idTrack;
END$$

DELIMITER ;
