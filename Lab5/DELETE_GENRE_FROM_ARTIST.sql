CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGenreFromArtist`(ARTIST_ID INT, GENRE_ID INT)
BEGIN
	DELETE FROM Artist_has_Genre WHERE Artist_idArtist = ARTIST_ID AND Genre_idGenre = GENRE_ID;
END