USE `musical_player`;
DROP procedure IF EXISTS `updateTracksView`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `updateTracksView` ()
BEGIN
	CREATE OR REPLACE VIEW AllTracksView AS
	SELECT 
	Track.Title as Track, 
	Album.Title as Album, 
	Artist.Name as Artist
		FROM Track
		INNER JOIN Album_has_Track
		ON idTrack = Album_has_Track.Track_idTrack
		INNER JOIN Album
		ON idAlbum = Album_has_Track.Album_idAlbum
		INNER JOIN Artist
		ON Album.Artist_idArtist = Artist.idArtist
	ORDER BY Track.idTrack;
END$$

DELIMITER ;

