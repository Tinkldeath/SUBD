USE `musical_player`;
DROP procedure IF EXISTS `willDeleteUser`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willDeleteUser` (idUser INT)
BEGIN
	DELETE FROM Playlist WHERE User_idUser = idUser;
END$$

DELIMITER ;

