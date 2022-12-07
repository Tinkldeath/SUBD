USE `musical_player`;
DROP procedure IF EXISTS `willDeleteTrackFromPlaylist`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willDeleteTrackFromPlaylist` (idPlaylist INT, idTrack INT)
BEGIN
	IF EXISTS (SELECT * FROM Playlist WHERE Playlist.idPlaylist = idPlaylist) AND EXISTS (SELECT * FROM Track WHERE Track.idTrack = idTrack) THEN
		IF EXISTS (SELECT * FROM Playlist_has_Track WHERE Playlist_has_Track.Track_idTrack = idTrack AND Playlist_has_Track.Playlist_idPlaylist = idPlaylist) THEN 
			DELETE FROM Playlist_has_Track WHERE Track_idTrack = idTrack AND Playlist_idPlaylist = idPlaylist;
        END IF;
    END IF;
END$$

DELIMITER ;

