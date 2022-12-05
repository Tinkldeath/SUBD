USE `musical_player`;
DROP procedure IF EXISTS `updatePlaylistsView`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `updatePlaylistsView` ()
BEGIN
	CREATE OR REPLACE VIEW AllPlaylistsView AS
	SELECT 
	Playlist.Title as Playlist,
	User.Login as Owner,
	(SELECT COUNT(*) 
		FROM (SELECT * 
			FROM Playlist_has_Track 
			INNER JOIN Track ON Playlist_has_Track.Playlist_idPlaylist = idPlaylist AND Playlist_has_Track.Track_idTrack = idTrack ) as col1 
		) 
		as Tracks
	FROM Playlist
	INNER JOIN User ON User.idUser = Playlist.User_idUser
	ORDER BY Playlist.idPlaylist;
END$$

DELIMITER ;

