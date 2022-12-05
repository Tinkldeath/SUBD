DROP TRIGGER IF EXISTS `musical_player`.`Track_has_Genre_AFTER_INSERT`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Track_has_Genre_AFTER_INSERT` AFTER INSERT ON `Track_has_Genre` FOR EACH ROW
BEGIN
	CALL updateTracksView();
    CALL updateGenresView();
END$$
DELIMITER ;
