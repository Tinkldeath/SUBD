CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePlaylist`(PLAYLIST_ID INT)
BEGIN
	DELETE FROM Playlist WHERE idPlaylist = PLAYLIST_ID;
    DELETE FROM Playlist_has_Track WHERE Playlist_idPLaylist = PLAYLIST_ID;
	DELETE FROM Playlist_has_Genre WHERE Playlist_idPLaylist = PLAYLIST_ID;
END