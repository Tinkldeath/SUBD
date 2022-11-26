-- CREATE DATABASE musical_player;

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
	
	CONSTRAINT Artist_idArtist FOREIGN KEY(idArtist)
		REFERENCES Artist(idArtist)
);

CREATE TABLE IF NOT EXISTS Track(
	idTrack INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Title VARCHAR(45),
	AudioUrl VARCHAR(200),
	
	CONSTRAINT Album_idAlbum FOREIGN KEY(idAlbum)
		REFERENCES Album(idAlbum)
);

CREATE TABLE IF NOT EXISTS Permission(
	idPermission INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Title VARCHAR(45),
	IsUser INT(1),
    IsModer INT(1),
    IsAdmin INT(1)
);

CREATE TABLE IF NOT EXISTS User(
	idUser INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Login VARCHAR(45),
	Password VARCHAR(45),
	
    CONSTRAINT Permission_idPermission FOREIGN KEY (idPermission)
    REFERENCES Permission(idPermission)
);	

CREATE TABLE IF NOT EXISTS Playlist(
	idPlaylist INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Title VARCHAR(45),
	ImageUrl VARCHAR(200),
	
    CONSTRAINT User_idUser FOREIGN KEY (idUser)
    REFERENCES User(idUser)
);

CREATE TABLE IF NOT EXISTS Track_has_Genre(
	idTrack_has_Genre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Track_idTrack INT,
	Genre_idGenre INT,
	
    CONSTRAINT Track_idTrack FOREIGN KEY (idTrack)
    REFERENCES Track(idTrack),
    
    CONSTRAINT Genre_idGenre FOREIGN KEY (idGenre)
    REFERENCES Genre(idGenre)
);

CREATE TABLE IF NOT EXISTS Playlist_has_Genre(
	idPlaylist_has_Genre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Playlist_idPlaylist INT,
	Genre_idGenre INT,
	
    CONSTRAINT Playlist_idPlaylist FOREIGN KEY (idPlaylist)
    REFERENCES Playlist(idPlaylist),
    
    CONSTRAINT Genre_idGenre FOREIGN KEY (idGenre)
    REFERENCES Genre(idGenre)
);

CREATE TABLE IF NOT EXISTS Album_has_Genre(
	idAlbum_has_Genre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Album_idAlbum INT,
	Genre_idGenre INT,
	
    CONSTRAINT Album_idAlbum FOREIGN KEY (idAlbum)
    REFERENCES Album(idAlbum),
    
    CONSTRAINT Genre_idGenre FOREIGN KEY (idGenre)
    REFERENCES Genre(idGenre)
);

CREATE TABLE IF NOT EXISTS Artist_has_Genre(
	idArtist_has_Genre INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Artist_idArtist INT,
	Genre_idGenre INT,
	
    CONSTRAINT Artist_idArtist FOREIGN KEY (idArtist)
    REFERENCES Artist(idArtist),
    
    CONSTRAINT Genre_idGenre FOREIGN KEY (idGenre)
    REFERENCES Genre(idGenre)
);

CREATE TABLE IF NOT EXISTS Playlist_has_Track(
	idPlaylist_has_Track INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Playlist_idPlaylist INT,
	Track_idTrack INT,
	
    CONSTRAINT Playlist_idPlaylist FOREIGN KEY (idPlaylist)
    REFERENCES Playlist(idPlaylist),
    
    CONSTRAINT Track_idTrack FOREIGN KEY (idTrack)
    REFERENCES Track(idTrack)
);

CREATE TABLE IF NOT EXISTS Track_has_Artist(
	idTrack_has_Artist INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
	Track_idTrack INT,
	Artist_idArtist INT,
	
    CONSTRAINT Track_idTrack FOREIGN KEY (idTrack)
    REFERENCES Track(idTrack),
    
    CONSTRAINT Artist_idArtist FOREIGN KEY (idArtist)
    REFERENCES Artist(idArtist)
);