use musical_player;

CREATE TRIGGER GenreUpdateTrigger
AFTER UPDATE
ON Genre
FOR EACH ROW
UPDATE VIEW AllGenresView
SET 
Genre = (SELECT Title FROM Genre),
Tracks = (SELECT COUNT(*) FROM Track INNER JOIN Track_has_Genre ON Track.idTrack = Track_has_Genre.Track_idTrack AND Genre.idGenre = Track_has_Genre.Genre_idGenre ),
Playlists = (SELECT COUNT(*) FROM Playlist INNER JOIN Playlist_has_Genre ON Playlist.idPlaylist = Playlist_has_Genre.Playlist_idPlaylist AND Genre.idGenre = Playlist_has_Genre.Genre_idGenre ),
Artists = (SELECT COUNT(*) FROM Artist INNER JOIN Artist_has_Genre ON Artist.idArtist = Artist_has_Genre.Artist_idArtist AND Genre.idGenre = Artist_has_Genre.Genre_idGenre),
Albums = (SELECT COUNT(*) FROM Album INNER JOIN Album_has_Genre ON Album.idAlbum = Album_has_Genre.Album_idAlbum AND Genre.idGenre = Album_has_Genre.Genre_idGenre);