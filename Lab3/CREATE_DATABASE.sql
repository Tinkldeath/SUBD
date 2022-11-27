CREATE DATABASE musical_player;

CREATE TABLE IF NOT EXISTS Genre (
	idGenre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
    Title VARCHAR(45)
);
   
CREATE TABLE IF NOT EXISTS Artist (
	idArtist INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
    Name VARCHAR(45),
    ImageUrl VARCHAR(200)
);
CREATE TABLE IF NOT EXISTS Album(
	idAlbum INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Title VARCHAR(45),
	ImageUrl VARCHAR(200),
    Artist_idArtist INT,
	
	CONSTRAINT albumArtist FOREIGN KEY(Artist_idArtist)
		REFERENCES Artist(idArtist)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Track(
	idTrack INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Title VARCHAR(45),
	AudioUrl VARCHAR(200),
    Album_idAlbum INT,
	
	CONSTRAINT trackAlbum FOREIGN KEY(Album_idAlbum)
		REFERENCES Album(idAlbum)
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Permission(
	idPermission INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Title VARCHAR(45),
	IsUser INT(1),
    IsModer INT(1),
    IsAdmin INT(1)
);

CREATE TABLE IF NOT EXISTS Users(
	idUser INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Login VARCHAR(45),
	PasswordValue VARCHAR(45),
    permission INT,
	
    CONSTRAINT permission FOREIGN KEY (permission)
    REFERENCES Permission(idPermission)
    ON DELETE SET NULL
);	

CREATE TABLE IF NOT EXISTS Playlist(
	idPlaylist INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Title VARCHAR(45),
	ImageUrl VARCHAR(200),
    User_idUser INT,
	
    CONSTRAINT idUser FOREIGN KEY (User_idUser)
    REFERENCES Users(idUser)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Track_has_Genre(
	idTrack_has_Genre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Track_idTrack INT,
	Genre_idGenre INT,
	
    CONSTRAINT genreTrack FOREIGN KEY (Track_idTrack)
    REFERENCES Track(idTrack)
    ON DELETE SET NULL,
    
    
    CONSTRAINT trackGenre FOREIGN KEY (Genre_idGenre)
    REFERENCES Genre(idGenre)
    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Playlist_has_Genre(
	idPlaylist_has_Genre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Playlist_idPlaylist INT,
	Genre_idGenre INT,
	
    CONSTRAINT genrePlaylist FOREIGN KEY (Playlist_idPlaylist)
    REFERENCES Playlist(idPlaylist)
    ON DELETE SET NULL,
    
    CONSTRAINT playlistGenre FOREIGN KEY (Genre_idGenre)
    REFERENCES Genre(idGenre)
    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Album_has_Genre(
	idAlbum_has_Genre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Album_idAlbum INT,
	Genre_idGenre INT,
	
    CONSTRAINT genreAlbum FOREIGN KEY (Album_idAlbum)
    REFERENCES Album(idAlbum)
    ON DELETE SET NULL,
    
    CONSTRAINT albumGenre FOREIGN KEY (Genre_idGenre)
    REFERENCES Genre(idGenre)
    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Artist_has_Genre(
	idArtist_has_Genre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Artist_idArtist INT,
	Genre_idGenre INT,
	
    CONSTRAINT genreArtist FOREIGN KEY (Artist_idArtist)
    REFERENCES Artist(idArtist)
    ON DELETE SET NULL,
    
    CONSTRAINT artistGenre FOREIGN KEY (Genre_idGenre)
    REFERENCES Genre(idGenre)
    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Playlist_has_Track(
	idPlaylist_has_Track INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Playlist_idPlaylist INT,
	Track_idTrack INT,
	
    CONSTRAINT trackPlaylist FOREIGN KEY (Playlist_idPlaylist)
    REFERENCES Playlist(idPlaylist)
    ON DELETE SET NULL,
    
    CONSTRAINT playlistTrack FOREIGN KEY (Track_idTrack)
    REFERENCES Track(idTrack)
    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Track_has_Artist(
	idTrack_has_Artist INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Track_idTrack INT,
	Artist_idArtist INT,
	
    CONSTRAINT trackArtist FOREIGN KEY (Track_idTrack)
    REFERENCES Track(idTrack)
    ON DELETE SET NULL,
    
    CONSTRAINT artistTrack FOREIGN KEY (Artist_idArtist)
    REFERENCES Artist(idArtist)
    ON DELETE SET NULL
);