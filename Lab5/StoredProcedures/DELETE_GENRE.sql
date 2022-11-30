CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGenre`(GENRE_ID INT)
BEGIN
	DELETE FROM Genre WHERE idGenre = GENRE_ID;
    DELETE FROM Track_has_Genre WHERE Genre_idGenre = GENRE_ID;
    DELETE FROM Artist_has_Genre WHERE Genre_idGenre = GENRE_ID;
    DELETE FROM Album_has_Genre WHERE Genre_idGenre = GENRE_ID;
    DELETE FROM Playlist_has_Genre WHERE Genre_idGenre = GENRE_ID;
END