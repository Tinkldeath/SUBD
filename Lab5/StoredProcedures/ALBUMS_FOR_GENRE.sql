USE `musical_player`;
DROP procedure IF EXISTS `albumsForGenre`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`albumsForGenre`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `albumsForGenre`(idGenre INT)
BEGIN
	SELECT 
    Album.idAlbum as id,
    Album.Title as title,
    Artist.Name as artist,
    (SELECT COUNT(*) FROM Track 
		INNER JOIN Album_has_Track ON Album_has_Track.Album_idAlbum = Album.idAlbum AND Album_has_Track.Track_idTrack = Track.idTrack
		INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = Album_has_Track.Track_idTrack AND Track_has_Genre.Genre_idGenre = idGenre
	) as tracks
    FROM Album 
	INNER JOIN Artist ON Album.Artist_idArtist = Artist.idArtist
	ORDER BY Album.idAlbum;
END$$

DELIMITER ;
;
