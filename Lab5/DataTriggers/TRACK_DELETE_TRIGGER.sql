use musical_player;

CREATE TRIGGER TrackDeleteTrigger
AFTER DELETE
ON Track
FOR EACH ROW
UPDATE VIEW AllTracksView
SET 
Track = (SELECT Title FROM Track), 
Album = (SELECT Title FROM ALbum),
Artist = (SELECT Name FROM Artist INNER JOIN Track_has_Artist ON Artist.idArtist = Track.idTrack);
