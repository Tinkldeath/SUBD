DROP TRIGGER IF EXISTS `musical_player`.`Playlist_AFTER_INSERT`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Playlist_AFTER_INSERT` AFTER INSERT ON `Playlist` FOR EACH ROW
BEGIN
	CALL updateGenresView();
END$$
DELIMITER ;
