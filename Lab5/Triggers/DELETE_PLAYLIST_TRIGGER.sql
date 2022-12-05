DROP TRIGGER IF EXISTS `musical_player`.`Playlist_BEFORE_DELETE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Playlist_BEFORE_DELETE` BEFORE DELETE ON `Playlist` FOR EACH ROW
BEGIN
	CALL willDeletePlaylist(OLD.idPlaylist);
END$$
DELIMITER ;
