USE `musical_player`;
DROP procedure IF EXISTS `willCreatePlaylist`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willCreatePlaylist` (Title VARCHAR(45), ownerId INT)
BEGIN
	IF EXISTS(SELECT * FROM User WHERE idUser = ownerId) THEN
		INSERT INTO Playlist (Title, User_idUser) VALUES (Title, ownerId);
        CALL getPlaylists();
    END IF;
END$$

DELIMITER ;

