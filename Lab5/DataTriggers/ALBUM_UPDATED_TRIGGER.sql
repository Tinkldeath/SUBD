use musical_player;

CREATE TRIGGER AlbumUpdateTrigger
AFTER UPDATE
ON Album
FOR EACH ROW
UPDATE VIEW AllAlbumsView SET
Album = (SELECT Title FROM Album),
Artist = (SELECT Artist.Name FROM Artist WHERE Artist.idArtist = Album.Artist_idArtist),
Tracks = (SELECT COUNT(*) FROM Track WHERE Track.Album_idAlbum = Album.idAlbum)
ORDER BY Album.idAlbum;
