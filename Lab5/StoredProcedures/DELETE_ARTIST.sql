CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteArtist`(ARTIST_ID INT)
BEGIN
	DELETE FROM Artist WHERE idArtist = ARTIST_ID;
    DELETE FROM Artist_has_Genre WHERE Artist_idArtist = ARTIST_ID;
    DELETE FROM Track_has_Artist WHERE Atrist_idArtist = ARTIST_ID;
END