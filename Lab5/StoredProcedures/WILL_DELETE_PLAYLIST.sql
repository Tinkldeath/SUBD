USE `musical_player`;
DROP procedure IF EXISTS `willDeletePlaylist`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willDeletePlaylist`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willDeletePlaylist`(idPlaylist INT)
BEGIN
	IF EXISTS (SELECT * FROM Playlist WHERE Playlist.idPlaylist = idPlaylist) THEN
		DELETE FROM Playlist_has_Track WHERE Playlist_has_Track.Playlist_idPlaylist = idPlaylist;
        DELETE FROM Playlist WHERE Playlist.idPlaylist = idPlaylist;
    END IF;
END$$

DELIMITER ;
;

