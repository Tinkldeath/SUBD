CREATE DEFINER=`root`@`localhost` PROCEDURE `addArtist`(ARTIST_NAME VARCHAR(45), IMAGE_URL VARCHAR(200))
BEGIN
	INSERT INTO Artist (Name, ImageUrl) VALUES(ARTIST_NAME, IMAGE_URL);
END