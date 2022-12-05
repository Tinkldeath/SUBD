DROP TRIGGER IF EXISTS `musical_player`.`Track_has_Artist_AFTER_UPDATE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Track_has_Artist_AFTER_UPDATE` AFTER UPDATE ON `Track_has_Artist` FOR EACH ROW
BEGIN
	CALL updateTracksView();
    CALL updateArtistsView();
END$$
DELIMITER ;
