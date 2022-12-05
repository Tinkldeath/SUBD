DROP TRIGGER IF EXISTS `musical_player`.`Album_has_Track_AFTER_DELETE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Album_has_Track_AFTER_DELETE` AFTER DELETE ON `Album_has_Track` FOR EACH ROW
BEGIN
	CALL updateAlbumsView();
    CALL updateTracksView();
END$$
DELIMITER ;
