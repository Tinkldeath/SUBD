CREATE DEFINER=`root`@`localhost` PROCEDURE `addGenre`(TITLE VARCHAR(45))
BEGIN
	INSERT INTO Genre (Title) VALUES(TITLE);
END