DROP TRIGGER IF EXISTS `musical_player`.`Artist_AFTER_UPDATE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Artist_AFTER_UPDATE` AFTER UPDATE ON `Artist` FOR EACH ROW
BEGIN
	CALL updateArtistsView();
END$$
DELIMITER ;
