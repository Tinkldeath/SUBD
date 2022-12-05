DROP TRIGGER IF EXISTS `musical_player`.`User_BEFORE_DELETE`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`User_BEFORE_DELETE` BEFORE DELETE ON `User` FOR EACH ROW
BEGIN
	CALL willDeleteUser(OLD.idUser);
    CALL updatePlaylistsView();
END$$
DELIMITER ;
