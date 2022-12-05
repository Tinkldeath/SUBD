USE `musical_player`;
DROP procedure IF EXISTS `willDeletePlaylist`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willDeletePlaylist` (idPlaylist INT)
BEGIN
	DELETE FROM Playlist_has_Track WHERE Playlist_idPlaylist = idPlaylist;
END$$

DELIMITER ;

