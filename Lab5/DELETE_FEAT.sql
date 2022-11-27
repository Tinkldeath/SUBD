CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteFeat`(TRACK_ID INT, ARTIST_ID INT)
BEGIN
	DELETE FROM Track_has_Artist WHERE Track_idTrack = TRACK_ID AND Artist_idArtist = ARTIST_ID;
END