USE `musical_player`;
DROP procedure IF EXISTS `willAddTrackToPlaylist`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willAddTrackToPlaylist` (idPlaylist INT, idTrack INT)
BEGIN
	IF EXISTS (SELECT * FROM Playlist WHERE Playlist.idPlaylist = idPlaylist) AND EXISTS (SELECT * FROM Track WHERE Track.idTrack = idTrack) THEN
		IF NOT EXISTS (SELECT * FROM Playlist_has_Track WHERE Playlist_has_Track.Track_idTrack = idTrack AND Playlist_has_Track.Playlist_idPlaylist = idPlaylist) THEN 
			INSERT INTO Playlist_has_Track (Track_idTrack, Playlist_idPlaylist) VALUES (idTrack, idPlaylist);
        END IF;
    END IF;
END$$

DELIMITER ;

