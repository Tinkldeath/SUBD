DROP TRIGGER IF EXISTS `musical_player`.`Track_AFTER_DELETE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Track_AFTER_DELETE` AFTER DELETE ON `Track` FOR EACH ROW
BEGIN
	CALL willDeleteTrack(OLD.idTrack);
    CALL updateTracksView();
END$$
DELIMITER ;
