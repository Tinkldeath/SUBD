USE `musical_player`;
DROP procedure IF EXISTS `willDeleteGenreFromTrack`;

DELIMITER $$
USE `musical_player`$$
CREATE PROCEDURE `willDeleteGenreFromTrack` (idTrack INT, idGenre INT)
BEGIN
	IF EXISTS(SELECT * FROM Track WHERE Track.idTrack = idTrack) AND EXISTS(SELECT * FROM Genre WHERE Genre.idGenre = idGenre) THEN
		IF EXISTS(SELECT * FROM Track_has_Genre WHERE Track_has_Genre.Track_idTrack = idTrack AND Track_has_Genre.Genre_idGenre = idGenre) THEN
			DELETE FROM Track_has_Genre WHERE Track_idTrack = idTrack AND Genre_idGenre = idGenre;
            SELECT
				Track.idTrack as id,
                Track.Title as title,
                Genre.Title as genre
			FROM Track
				INNER JOIN Track_has_Genre ON Track_has_Genre.Genre_idGenre = idGenre AND Track_has_Genre.Track_idTrack = idTrack
                INNER JOIN Genre ON Track_has_Genre.Genre_idGenre = Genre.idGenre;
        END IF;
    END IF;
END$$

DELIMITER ;

