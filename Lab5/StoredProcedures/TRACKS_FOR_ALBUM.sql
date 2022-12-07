USE `musical_player`;
DROP procedure IF EXISTS `tracksForAlbum`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`tracksForAlbum`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tracksForAlbum`(idAlbum INT)
BEGIN
	SELECT 
    Track.idTrack as id,
	Track.Title as title, 
	Album.Title as album, 
	Artist.Name as artist
		FROM Track
		INNER JOIN Album_has_Track
		ON idTrack = Album_has_Track.Track_idTrack
		INNER JOIN Album
		ON idAlbum = Album_has_Track.Album_idAlbum
        INNER JOIN Track_has_Artist ON Track_has_Artist.Track_idTrack = idTrack
		INNER JOIN Artist
		ON Track_has_Artist.Artist_idArtist = Artist.idArtist
	WHERE Album.idAlbum = idAlbum
	ORDER BY Track.idTrack;
END$$

DELIMITER ;
;

