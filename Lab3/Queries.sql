use musical_player;

-- CRUD
SELECT * FROM Genre;
INSERT INTO Genre (Title) VALUES("Test Genre");
UPDATE Genre
	SET Title = "Jazz"
    WHERE Title = "Test Genre";
DELETE FROM Genre WHERE Title = "Jazz";

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
