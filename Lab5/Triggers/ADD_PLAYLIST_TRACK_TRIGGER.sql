DROP TRIGGER IF EXISTS `musical_player`.`Playlist_has_Track_AFTER_INSERT`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Playlist_has_Track_AFTER_INSERT` AFTER INSERT ON `Playlist_has_Track` FOR EACH ROW
BEGIN
	CALL updatePlaylistsView();
END$$
DELIMITER ;
