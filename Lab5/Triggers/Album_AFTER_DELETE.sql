DROP TRIGGER IF EXISTS `musical_player`.`Album_AFTER_DELETE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Album_AFTER_DELETE` AFTER DELETE ON `Album` FOR EACH ROW
BEGIN
	INSERT INTO Logs (Action, idRecord, Date) VALUES ("Delete album", OLD.idAlbum, now());
END$$
DELIMITER ;
