USE `musical_player`;
DROP procedure IF EXISTS `getPlaylists`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`getPlaylists`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlaylists`()
BEGIN
	SELECT 
    Playlist.idPlaylist as id,
	Playlist.Title as title,
	User.Login as owner,
	(SELECT COUNT(*) 
		FROM (SELECT * 
			FROM Playlist_has_Track 
			INNER JOIN Track ON Playlist_has_Track.Playlist_idPlaylist = idPlaylist AND Playlist_has_Track.Track_idTrack = idTrack ) as col1) as tracks
	FROM Playlist
	INNER JOIN User ON User.idUser = Playlist.User_idUser
	ORDER BY Playlist.idPlaylist;
END$$

DELIMITER ;
;
