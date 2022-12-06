USE `musical_player`;
DROP procedure IF EXISTS `checkUserExists`;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkUserExists`(Login VARCHAR(45))
BEGIN
	SELECT EXISTS( SELECT Login FROM User WHERE User.Login = Login) as Exist;
END$$

DELIMITER ;
;

