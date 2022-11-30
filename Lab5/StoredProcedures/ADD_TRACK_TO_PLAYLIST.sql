CREATE DEFINER=`root`@`localhost` PROCEDURE `addTrackToPlaylist`(TRACK_ID INT, PLAYLIST_ID INT)
BEGIN
	INSERT INTO Playlist_has_Track (Track_idTrack, Playlist_idPlaylist) VALUES(TRACK_ID, PLAYLIST_ID);
END