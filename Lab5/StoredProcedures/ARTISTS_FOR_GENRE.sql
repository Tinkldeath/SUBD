USE `musical_player`;
DROP procedure IF EXISTS `artistsForGenre`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`artistsForGenre`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `artistsForGenre`(idGenre INT)
BEGIN
	SELECT 
    Artist.idArtist as id,
	Artist.Name as name,
	(SELECT COUNT(DISTINCT(idTrack)) FROM Track 
		INNER JOIN Track_has_Genre ON Track.idTrack = Track_has_Genre.Track_idTrack AND Track_has_Genre.Genre_idGenre = idGenre 
		INNER JOIN Track_has_Artist ON Track_has_Artist.Artist_idArtist = Artist.idArtist AND Track_has_Artist.Track_idTrack = Track.idTrack) as tracks,
	(SELECT COUNT(DISTINCT(idAlbum)) FROM Album 
		INNER JOIN Album_has_Track 
		INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = Album_has_Track.Track_idTrack AND Track_has_Genre.Genre_idGenre = idGenre
        WHERE Album.Artist_idArtist = idArtist) as albums
	FROM Artist
	ORDER BY Artist.idArtist;
END$$

DELIMITER ;
;

