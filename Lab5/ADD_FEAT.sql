CREATE DEFINER=`root`@`localhost` PROCEDURE `addFeat`(TRACK_ID INT, ARTIST_ID INT)
BEGIN
	INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES(TRACK_ID, ARTIST_ID);
END