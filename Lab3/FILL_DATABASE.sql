use musical_player;

-- FILL GENRES
INSERT INTO Genre (idGenre, Title) VALUES(0, "Rap");
INSERT INTO Genre (Title) VALUES("Hip-Hop");
INSERT INTO Genre (Title) VALUES("Rock");
INSERT INTO Genre (Title) VALUES("Hard-Rock");
INSERT INTO Genre (Title) VALUES("Metal");

-- FILL ARTISTS
INSERT INTO Artist (idArtist, Name, ImageUrl) VALUES(0, "NF", "");
INSERT INTO Artist (Name, ImageUrl) VALUES("AC/DC", "");
INSERT INTO Artist (Name, ImageUrl) VALUES("Metallica", "");

-- FILL ALBUMS
INSERT INTO Album (idAlbum, Title, ImageUrl, Artist_idArtist) VALUES(0, "Therapy session", "", 1);
INSERT INTO Album (Title, ImageUrl, Artist_idArtist) VALUES("Mansion", "", 1);
INSERT INTO Album (Title, ImageUrl, Artist_idArtist) VALUES("Clouds", "", 1);
INSERT INTO Album (Title, ImageUrl, Artist_idArtist) VALUES("Back in black", "", 2);
INSERT INTO Album (Title, ImageUrl, Artist_idArtist) VALUES("Master of puppets", "", 3);

-- FILL TRACKS
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(0, "Intro 2", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Therapy Session", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("I Just Wanna Know", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("How Could You Leave Us", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Breathe", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Real", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Oh Lord", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("I Can Feel It", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Got You On My Mind", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Grindin'", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Wish You Wouldn't", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Statement", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("All I Do", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Lost In The Moment", "", 1);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Back In Black", "", 4);
INSERT INTO Track (Title, AudioUrl, Album_idAlbum) VALUES("Master Of Puppets", "", 5);

-- FILL PERMISSIONS
INSERT INTO Permission (idPermission, Title, IsUser, IsModer, IsAdmin) VALUES(0, "User", 1, 0, 0);
INSERT INTO Permission (Title, IsUser, IsModer, IsAdmin) VALUES("Moder", 0, 1, 0);
INSERT INTO Permission (Title, IsUser, IsModer, IsAdmin) VALUES("Admin", 0, 0, 1);

-- FILL USERS
INSERT INTO Users (idUser, Login, PasswordValue, permission) VALUES(0, "User", "user", 1);
INSERT INTO Users (Login, PasswordValue, permission) VALUES("Moder", "moder", 2);
INSERT INTO Users (Login, PasswordValue, permission) VALUES("Admin", "admin", 3);

-- FILL PLAYLISTS
INSERT INTO Playlist (idPlaylist, Title, ImageUrl, User_idUser) VALUES(0, "Custom playlist 1", "", 1);
INSERT INTO Playlist (idPlaylist, Title, ImageUrl, User_idUser) VALUES("Custom playlist 2", "", 1);

-- SETUP Relationships
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (1, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (1, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (2, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (2, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (3, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (3, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (4, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (4, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (5, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (5, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (6, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (6, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (7, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (7, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (8, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (8, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (9, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (9, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (10, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (10, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (11, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (11, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (12, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (12, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (13, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (13, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (14, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (14, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (15, 3);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (15, 4);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (16, 5);

INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(1,1);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(1,2);

INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(2,1);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(2,2);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(2,3);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(2,4);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(2,5);

INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (1,1);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (1,2);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (2,1);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (2,2);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (3,1);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (3,2);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (4,3);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (4,4);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (5,5);

INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (1,1);
INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (1,2);
INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (2,3);
INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (2,4);
INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (3,5);

INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (1, 1);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (1, 3);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (1, 4);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (1, 6);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (1, 11);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (2, 1);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (2, 15);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (2, 16);

INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (1, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (2, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (3, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (4, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (5, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (6, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (7, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (8, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (9, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (10, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (11, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (12, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (13, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (14, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (15, 2);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (16, 3);
