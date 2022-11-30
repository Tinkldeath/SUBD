CREATE DEFINER=`root`@`localhost` PROCEDURE `addTrack`(TITLE VARCHAR(45), AURIO_URL VARCHAR(200), ARTIST_ID INT, ALBUM_ID INT, ARTISTID INT, GENRE_ID INT)
BEGIN
	INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES(TITLE, AUDIO_URL, ALBUM_ID);
    SELECT idTrack FROM Track WHERE Title = TITLE AND AudioUrl = AUDIO_URL and Album_idAlbum = ALBUM_ID;
    INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES(idTrack, GENRE_ID);
END