use musical_player;

-- CRUD GENRE
SELECT * FROM Genre;
INSERT INTO Genre (Title) VALUES("Test Genre");
UPDATE Genre
	SET Title = "Jazz"
    WHERE Title = "Test Genre";
DELETE FROM Genre WHERE Title = "Jazz";

-- CRUD ARTIST
SELECT * FROM Artist;
INSERT INTO Artist (Name, ImageUrl) VALUES("Judas Priest", "");
UPDATE Artist
	SET Name = "Black Sabbath"
    WHERE idArtist = 7;
DELETE FROM Artist WHERE idArtist = 7;

-- CRUD ALBUM
SELECT * FROM Album;
INSERT INTO Album (Title, ImageUrl, Artist_idArtist) VALUES("Kill 'em All", "", 2);
UPDATE Album
	SET Title = "Black Album"
    WHERE idAlbum = 5;
DELETE FROM Album WHERE idAlbum = 5;

-- CRUD TRACK
SELECT * FROM Track;
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Orion", "", 4);
UPDATE Track
	SET Title = "Nothing Else Matters"
    WHERE Title = "Orion";
DELETE FROM Track WHERE Title = "Orion";

-- CRUD USER
SELECT * FROM User;
INSERT INTO User (Login, Password, Permission_idPermission) VALUES("Login", "Password", 2);
UPDATE User 
	SET Password = "New Password"
    WHERE Login = "Login" AND Password = "Password";
DELETE FROM User WHERE Login = "Login";

-- CRUD PLAYLIST
SELECT * FROM Playlist;
INSERT INTO Playlist (Title, ImageUrl, User_idUser) VALUES("Custom playlist 4", "", 0);
UPDATE Playlist
	SET Title = "NEW CUSTOM PLAYLIST"
    WHERE Title = "Custom playlist 4";
DELETE FROM Playlist WHERE idPlaylist = 1;

-- ORDER BY
SELECT Login FROM User ORDER BY Permission_idPermission desc;

-- MIN/MAX
SELECT MIN(User_idUser) FROM Playlist;
SELECT MAX(User_idUser) FROM Playlist;
	
-- COUNT
SELECT COUNT(Title) 
	FROM Track_has_Genre
	WHERE Genre_idGenre = 0;

-- LIKE
SELECT COUNT(Title)
	FROM Track
    WHERE Title like "%o";
