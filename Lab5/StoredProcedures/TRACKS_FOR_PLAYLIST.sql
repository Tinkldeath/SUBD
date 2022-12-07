USE `musical_player`;
DROP procedure IF EXISTS `tracksForPlaylist`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`tracksForPlaylist`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tracksForPlaylist`(idPlaylist INT)
BEGIN
	SELECT
    Track.idTrack as id,
	Track.Title as title, 
	Album.Title as album, 
	Artist.Name as artist
    FROM Track
		INNER JOIN Playlist_has_Track ON Playlist_has_Track.Track_idTrack = idTrack AND Playlist_has_Track.Playlist_idPlaylist = idPlaylist
        INNER JOIN Track_has_Artist ON Track_has_Artist.Track_idTrack = idTrack
        INNER JOIN Artist ON Track_has_Artist.Artist_idArtist = idArtist
		INNER JOIN Album_has_Track ON idTrack = Album_has_Track.Track_idTrack
		INNER JOIN Album ON idAlbum = Album_has_Track.Album_idAlbum
	ORDER BY idTrack;
END$$

DELIMITER ;
;

