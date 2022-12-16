DROP TRIGGER IF EXISTS `musical_player`.`Playlist_BEFORE_INSERT`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER = CURRENT_USER TRIGGER `musical_player`.`Playlist_BEFORE_INSERT` BEFORE INSERT ON `Playlist` FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Playlist WHERE Playlist.Title = NEW.Title AND Playlist.User_idUser = NEW.User_idUser) THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Plyalist already exists';
    END IF;
END$$
DELIMITER ;
