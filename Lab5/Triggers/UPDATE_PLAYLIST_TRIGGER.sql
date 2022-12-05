DROP TRIGGER IF EXISTS `musical_player`.`Playlist_AFTER_UPDATE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Playlist_AFTER_UPDATE` AFTER UPDATE ON `Playlist` FOR EACH ROW
BEGIN
	CALL updatePlaylistsView();
END$$
DELIMITER ;
