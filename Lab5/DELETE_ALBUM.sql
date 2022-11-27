CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAlbum`(ALBUM_ID INT)
BEGIN
	DELETE FROM Album WHERE idAlbum = ALBUM_ID;
	DELETE FROM Album_has_Genre WHERE Album_idAlbum = ALBUM_ID;
    DELETE FROM Album_has_Genre WHERE Album_idAlbum = ALBUM_ID;
END