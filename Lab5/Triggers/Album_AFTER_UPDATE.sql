DROP TRIGGER IF EXISTS `musical_player`.`Album_AFTER_UPDATE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Album_AFTER_UPDATE` AFTER UPDATE ON `Album` FOR EACH ROW
BEGIN
	INSERT INTO Log (Action) VALUES ("Updated album " + OLD.Title + "TO " + NEW.Title);
END$$
DELIMITER ;
