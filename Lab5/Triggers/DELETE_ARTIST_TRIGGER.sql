DROP TRIGGER IF EXISTS `musical_player`.`Artist_AFTER_DELETE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Artist_AFTER_DELETE` AFTER DELETE ON `Artist` FOR EACH ROW
BEGIN
	CALL willDeleteArtist(OLD.idArtist);
    CALL updateArtistsView();
END$$
DELIMITER ;
