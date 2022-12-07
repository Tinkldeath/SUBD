USE `musical_player`;
DROP procedure IF EXISTS `willUpdatePlaylist`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willUpdatePlaylist` (idPlaylist INT, Title VARCHAR(45))
BEGIN
	IF EXISTS (SELECT * FROM Playlist WHERE Playlist.idPlaylist = idPlaylist) THEN
		UPDATE Playlist SET
			Playlist.Title = Title
		WHERE Playlist.idPlaylist = idPlaylist;
        CALL getPlaylists();
    END IF;
END$$

DELIMITER ;

