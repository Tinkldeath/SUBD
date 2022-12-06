USE `musical_player`;
DROP procedure IF EXISTS `willCreateUser`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willCreateUser`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willCreateUser`(Login VARCHAR(45), Password VARCHAR(45), Permission INT)
BEGIN
	IF (SELECT NOT EXISTS( SELECT Login FROM User WHERE User.Login = Login)) THEN
		INSERT INTO User (Login, Password, Permission) VALUES (Login, Password, Permission);
	END IF;
END$$

DELIMITER ;
;

