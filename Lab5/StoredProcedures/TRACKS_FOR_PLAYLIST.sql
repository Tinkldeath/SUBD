USE `musical_player`;
DROP procedure IF EXISTS `tracksForPlaylist`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `tracksForPlaylist` (idPlaylist INT)
BEGIN
	SELECT
    Track.Title as Track,
    Artist.Name as Artist
    FROM Track
		INNER JOIN Playlist_has_Track ON Playlist_has_Track.Track_idTrack = idTrack AND Playlist_has_Track.Playlist_idPlaylist = idPlaylist
        INNER JOIN Track_has_Artist ON Track_has_Artist.Track_idTrack = idTrack
        INNER JOIN Artist ON Track_has_Artist.Artist_idArtist = idArtist
	ORDER BY idTrack;
END$$

DELIMITER ;

