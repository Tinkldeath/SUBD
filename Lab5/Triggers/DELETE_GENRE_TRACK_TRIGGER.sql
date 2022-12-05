DROP TRIGGER IF EXISTS `musical_player`.`Track_has_Genre_AFTER_DELETE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Track_has_Genre_AFTER_DELETE` AFTER DELETE ON `Track_has_Genre` FOR EACH ROW
BEGIN
	CALL updateGenresView();
    CALL updateTracksView();
END$$
DELIMITER ;
