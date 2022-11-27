-- NF TRACKS 
SELECT 
Track.Title as Track, 
Artist.Name as Artist
  FROM Track
  INNER JOIN Track_has_Artist
  ON Track.idTrack = Track_has_Artist.Track_idTrack
  INNER JOIN Artist
  ON Artist.idArtist = Track_has_Artist.Artist_idArtist
WHERE Artist.idArtist = 1;

-- NF ALBUMS
SELECT 
Album.Title as Album, 
(SELECT COUNT(*) FROM Track WHERE Track.Album_idAlbum = Album.idAlbum) as Tracks,
Artist.Name as Artist
	FROM Album
	INNER JOIN Artist
    ON Artist.idArtist = Album.Artist_idArtist
WHERE Album.Artist_idArtist = 1
HAVING Tracks > 0;

-- NF GENRES
SELECT
Artist.Name as Artist,
Genre.Title as Genre
FROM Artist
	INNER JOIN Artist_has_Genre
	ON Artist.idArtist = Artist_has_Genre.Artist_idArtist
    INNER JOIN Genre
    ON Genre.idGenre = Artist_has_Genre.Genre_idGenre
WHERE Artist.idArtist = 1;

-- NF PAGE
SELECT
Artist.Name as Artist,
(SELECT COUNT(*) FROM Genre INNER JOIN Artist_has_Genre ON Genre.idGenre = Artist_has_Genre.Genre_idGenre AND Artist.idArtist = Artist_has_Genre.Artist_idArtist ) as Genres,
(SELECT COUNT(*) FROM Album WHERE Album.Artist_idArtist = Artist.idArtist) as Albums,
(SELECT COUNT(*) FROM Track INNER JOIN Track_has_Artist ON Track.idTrack = Track_has_Artist.Artist_idArtist WHERE Track_has_Artist.Artist_idArtist = 1) as Tracks
FROM Artist
WHERE Artist.idArtist = 1;


-- All TRACKS BY ARTIST
SELECT 
Track.Title as Track, 
Artist.Name as Artist
  FROM Track
  INNER JOIN Track_has_Artist
  ON Track.idTrack = Track_has_Artist.Track_idTrack
  INNER JOIN Artist
  ON Artist.idArtist = Track_has_Artist.Artist_idArtist;

  
-- All TRACKS BY GENRE
SELECT
Track.Title as Track, 
Genre.Title as Genere
	FROM Track
    INNER JOIN Track_has_Genre
    ON Track.idTrack = Track_has_Genre.Track_idTrack
    INNER JOIN Genre
    ON Genre.idGenre = Track_has_Genre.Genre_idGenre
ORDER BY Genre.idGenre;


-- All PLAYLISTS BY GENRE
SELECT
Playlist.Title as Playlist, 
Genre.Title as Genere
	FROM Playlist
    INNER JOIN Playlist_has_Genre
    ON Playlist.idPlaylist = Playlist_has_Genre.Playlist_idPlaylist
    INNER JOIN Genre
    ON Genre.idGenre = Playlist_has_Genre.Genre_idGenre
ORDER BY Playlist.idPlaylist;


-- All TACKS BY PLAYLIST
SELECT
Playlist.Title as Playlist, 
Track.Title as Track, 
Album.Title as Album, 
Users.Login as Owner
	FROM Playlist
    INNER JOIN Playlist_has_Track
    ON Playlist.idPlaylist = Playlist_has_Track.Playlist_idPlaylist
    INNER JOIN Track
    ON Track.idTrack = Playlist_has_Track.Track_idTrack
    INNER JOIN Track_has_Artist
	ON Track.idTrack = Track_has_Artist.Track_idTrack
    INNER JOIN Album
    ON Album.idAlbum = Track.Album_idAlbum
    INNER JOIN Users
    ON Users.idUser = Playlist.User_idUser
ORDER BY Playlist.idPlaylist;

-- FIND TRACKS BY GENRE AND SEARCH WORD
SELECT
Genre.Title as Genre,
Track.Title as Track
FROM Track
	INNER JOIN Track_has_Genre
    ON Track.idTrack = Track_has_Genre.Track_idTrack
    INNER JOIN Genre
    ON Track_has_Genre.Genre_idGenre = Genre.idGenre
WHERE Genre.idGenre = 1 AND Track.Title LIKE "%al"

