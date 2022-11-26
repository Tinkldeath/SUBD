use musical_player;

-- FILL GENRES
INSERT INTO Genre (idGenre, Title) VALUES(0, "Rap");
INSERT INTO Genre (idGenre, Title) VALUES(1, "Hip-Hop");
INSERT INTO Genre (idGenre, Title) VALUES(2, "Rock");
INSERT INTO Genre (idGenre, Title) VALUES(3, "Hard-Rock");
INSERT INTO Genre (idGenre, Title) VALUES(4, "Metal");

-- FILL ARTISTS
INSERT INTO Artist (idArtist, Name, ImageUrl) VALUES(0, "NF", "");
INSERT INTO Artist (idArtist, Name, ImageUrl) VALUES(1, "AC/DC", "");
INSERT INTO Artist (idArtist, Name, ImageUrl) VALUES(2, "Metallica", "");

-- FILL ALBUMS
INSERT INTO Album (idAlbum, Title, ImageUrl, Artist_idArtist) VALUES(0, "Therapy session", "", 0);
INSERT INTO Album (idAlbum, Title, ImageUrl, Artist_idArtist) VALUES(1, "Mansion", "", 0);
INSERT INTO Album (idAlbum, Title, ImageUrl, Artist_idArtist) VALUES(2, "Clouds", "", 0);
INSERT INTO Album (idAlbum, Title, ImageUrl, Artist_idArtist) VALUES(3, "Back in black", "", 1);
INSERT INTO Album (idAlbum, Title, ImageUrl, Artist_idArtist) VALUES(4, "Master of puppets", "", 2);

-- FILL TRACKS
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(0, "Intro 2", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(1, "Therapy Session", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(2, "I Just Wanna Know", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(3, "How Could You Leave Us", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(4, "Breathe", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(5, "Real", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(6, "Oh Lord", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(7, "I Can Feel It", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(8, "Got You On My Mind", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(9, "Grindin'", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(10, "Wish You Wouldn't", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(11, "Statement", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(12, "All I Do", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(13, "Lost In The Moment", "", 0);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(14, "Back In Black", "", 3);
INSERT INTO Track (idTrack, Title, AudioUrl, Album_idAlbum) VALUES(15, "Master Of Puppets", "", 4);

-- FILL PERMISSIONS
INSERT INTO Permission (idPermission, Title, IsUser, IsModer, IsAdmin) VALUES(0, "User", 1, 0, 0);
INSERT INTO Permission (idPermission, Title, IsUser, IsModer, IsAdmin) VALUES(1, "Moder", 0, 1, 0);
INSERT INTO Permission (idPermission, Title, IsUser, IsModer, IsAdmin) VALUES(2, "Admin", 0, 0, 1);

-- FILL USERS
INSERT INTO User (idUser, Login, Password, Permission_idPermission) VALUES(0, "User", "user", 0);
INSERT INTO User (idUser, Login, Password, Permission_idPermission) VALUES(1, "Moder", "moder", 1);
INSERT INTO User (idUser, Login, Password, Permission_idPermission) VALUES(2, "Admin", "admin", 2);

-- FILL PLAYLISTS
INSERT INTO Playlist (idPlaylist, Title, ImageUrl, User_idUser) VALUES(0, "Custom playlist 1", "", 0);
INSERT INTO Playlist (idPlaylist, Title, ImageUrl, User_idUser) VALUES(0, "Custom playlist 2", "", 0);

-- SETUP Relationships
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (0, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (0, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (1, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (1, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (2, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (2, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (3, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (3, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (4, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (4, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (5, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (5, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (6, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (6, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (7, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (7, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (8, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (8, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (9, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (9, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (10, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (10, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (11, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (11, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (12, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (12, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (13, 0);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (13, 1);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (14, 2);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (14, 3);
INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (15, 4);

INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(0,0);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(0,1);

INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(1,0);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(1,1);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(1,2);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(1,3);
INSERT INTO Playlist_has_Genre (Playlist_idPlaylist, Genre_idGenre) VALUES(1,4);

INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (0,0);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (0,1);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (1,0);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (1,1);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (2,0);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (2,1);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (3,2);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (3,3);
INSERT INTO Album_has_Genre (Album_idAlbum, Genre_idGenre) VALUES (4,4);

INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (0,0);
INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (0,1);
INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (1,2);
INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (1,3);
INSERT INTO Artist_has_Genre (Artist_idArtist, Genre_idGenre) VALUES (2,4);

INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (0, 0);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (0, 2);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (0, 3);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (0, 5);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (0, 10);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (1, 0);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (1, 14);
INSERT INTO Playlist_has_Track (Playlist_idPlaylist, Track_idTrack) VALUES (1, 15);

INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (0, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (1, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (2, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (3, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (4, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (5, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (6, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (7, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (8, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (9, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (10, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (11, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (12, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (13, 0);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (14, 1);
INSERT INTO Track_has_Artist (Track_idTrack, Artist_idArtist) VALUES (15, 2);
