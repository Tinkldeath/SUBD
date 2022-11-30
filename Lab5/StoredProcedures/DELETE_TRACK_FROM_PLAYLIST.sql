CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTrackFromPlaylist`(TRACK_ID INT)
BEGIN
	DELETE FROM Track WHERE idTrack = TRACK_ID;
    DELETE FROM Playlist_has_Track WHERE Track_idTrack = TRACK_ID;
END