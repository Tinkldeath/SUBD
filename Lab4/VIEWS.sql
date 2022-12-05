USE musical_player;

-- ALL TRACKS
CREATE OR REPLACE VIEW AllTracksView AS
SELECT 
Track.Title as Track, 
Album.Title as Album, 
Artist.Name as Artist
	FROM Track
    INNER JOIN Album_has_Track
    ON idTrack = Album_has_Track.Track_idTrack
    INNER JOIN Album
    ON idAlbum = Album_has_Track.Album_idAlbum
    INNER JOIN Artist
    ON Album.Artist_idArtist = Artist.idArtist
ORDER BY Track.idTrack;

-- ALL ARTISTS
CREATE OR REPLACE VIEW AllArtistsView AS
SELECT 
Artist.Name as Artist,
(SELECT COUNT(*) FROM Album WHERE Album.Artist_idArtist = Artist.idArtist) as Albums,
(SELECT COUNT(*) FROM Track_has_Artist WHERE Track_has_Artist.Artist_idArtist = Artist.idArtist) as Tracks
FROM Artist
ORDER BY Artist.idArtist;

-- ALL ALBUMS
CREATE OR REPLACE VIEW AllAlbumsView AS
SELECT
Album.Title as Album,
(SELECT Artist.Name FROM Artist WHERE Artist.idArtist = Album.Artist_idArtist) as Artist,
(SELECT COUNT(*) FROM Album_has_Track WHERE Album_idAlbum = idAlbum) as Tracks
FROM Album 
ORDER BY Album.idAlbum;

-- ALL GENRES
CREATE OR REPLACE VIEW AllGenresView AS
SELECT
Genre.Title as Genre,
(SELECT COUNT(*) FROM Track_has_Genre WHERE Genre_idGenre = idGenre) as Tracks,
(SELECT COUNT(DISTINCT(idAlbum)) FROM Album 
	INNER JOIN Album_has_Track 
    INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = Album_has_Track.Track_idTrack AND Track_has_Genre.Genre_idGenre = idGenre) as Albums,
(SELECT COUNT(DISTINCT(idArtist)) FROM Artist 
	INNER JOIN Track_has_Artist 
    INNER JOIN Track_has_Genre ON Track_has_Genre.Track_idTrack = Track_has_Artist.Track_idTrack  AND Track_has_Genre.Genre_idGenre = idGenre) as Artists
FROM Genre
ORDER BY Genre.idGenre;

-- ALL PLAYLISTS
CREATE OR REPLACE VIEW AllPlaylistsView AS
SELECT 
Playlist.Title as Playlist,
User.Login as Owner,
(SELECT COUNT(*) 
	FROM (SELECT * 
		FROM Playlist_has_Track 
        INNER JOIN Track ON Playlist_has_Track.Playlist_idPlaylist = idPlaylist AND Playlist_has_Track.Track_idTrack = idTrack ) as col1) as Tracks
FROM Playlist
INNER JOIN User ON User.idUser = Playlist.User_idUser
ORDER BY Playlist.idPlaylist;