use musical_player;

CREATE TRIGGER ArtistAddTrigger
AFTER INSERT
ON Artist
FOR EACH ROW
UPDATE VIEW AllArtistsView
SET 
Artist = (SELECT Name FROM Artist),
Genres = (SELECT COUNT(*) FROM Genre INNER JOIN Artist_has_Genre ON Genre.idGenre = Artist_has_Genre.Genre_idGenre AND Artist.idArtist = Artist_has_Genre.Artist_idArtist ),
Albums = (SELECT COUNT(*) FROM Album WHERE Album.Artist_idArtist = Artist.idArtist),
Tracks = (SELECT COUNT(*) FROM Track_has_Artist WHERE Track_has_Artist.Artist_idArtist = Artist.idArtist);