USE musical_player;

-- ALL TRACKS
CREATE VIEW AllTracksView AS
SELECT 
Track.Title as Track, 
Album.Title as Album, 
Artist.Name as Artist
	FROM Track
    INNER JOIN Album
    ON Track.Album_idAlbum = Album.idAlbum
    INNER JOIN Artist
    ON Album.Artist_idArtist = Artist.idArtist
ORDER BY Track.idTrack;

-- ALL GENRES
CREATE VIEW AllGenresView AS
SELECT
Genre.Title as Genre,
(SELECT COUNT(*) FROM Track INNER JOIN Track_has_Genre ON Track.idTrack = Track_has_Genre.Track_idTrack AND Genre.idGenre = Track_has_Genre.Genre_idGenre ) as Tracks,
(SELECT COUNT(*) FROM Playlist INNER JOIN Playlist_has_Genre ON Playlist.idPlaylist = Playlist_has_Genre.Playlist_idPlaylist AND Genre.idGenre = Playlist_has_Genre.Genre_idGenre ) as Playlists,
(SELECT COUNT(*) FROM Artist INNER JOIN Artist_has_Genre ON Artist.idArtist = Artist_has_Genre.Artist_idArtist AND Genre.idGenre = Artist_has_Genre.Genre_idGenre) as Artists,
(SELECT COUNT(*) FROM Album INNER JOIN Album_has_Genre ON Album.idAlbum = Album_has_Genre.Album_idAlbum AND Genre.idGenre = Album_has_Genre.Genre_idGenre) as Albums
FROM Genre
ORDER BY Genre.idGenre;

-- ALL ARTISTS
CREATE VIEW AllArtistsView AS
SELECT 
Artist.Name as Artist,
(SELECT COUNT(*) FROM Genre INNER JOIN Artist_has_Genre ON Genre.idGenre = Artist_has_Genre.Genre_idGenre AND Artist.idArtist = Artist_has_Genre.Artist_idArtist ) as Genres,
(SELECT COUNT(*) FROM Album WHERE Album.Artist_idArtist = Artist.idArtist) as Albums,
(SELECT COUNT(*) FROM Track_has_Artist WHERE Track_has_Artist.Artist_idArtist = Artist.idArtist) as Tracks
FROM Artist
ORDER BY Artist.idArtist;

-- ALL ALBUMS
CREATE VIEW AllAlbumsView AS
SELECT
Album.Title as Album,
(SELECT Artist.Name FROM Artist WHERE Artist.idArtist = Album.Artist_idArtist) as Artist,
(SELECT COUNT(*) FROM Track WHERE Track.Album_idAlbum = Album.idAlbum) as Tracks
FROM Album 
ORDER BY Album.idAlbum;
