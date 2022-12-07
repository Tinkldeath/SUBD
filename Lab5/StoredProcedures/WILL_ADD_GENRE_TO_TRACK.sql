USE `musical_player`;
DROP procedure IF EXISTS `willAddGenreToTrack`;

USE `musical_player`;
DROP procedure IF EXISTS `musical_player`.`willAddGenreToTrack`;
;

DELIMITER $$
USE `musical_player`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `willAddGenreToTrack`(idTrack INT, idGenre INT)
BEGIN
	IF EXISTS(SELECT * FROM Track WHERE Track.idTrack = idTrack) AND EXISTS(SELECT * FROM Genre WHERE Genre.idGenre = idGenre) THEN
		IF NOT EXISTS(SELECT * FROM Track_has_Genre WHERE Track_has_Genre.Track_idTrack = idTrack AND Track_has_Genre.Genre_idGenre = idGenre) THEN
			INSERT INTO Track_has_Genre (Track_idTrack, Genre_idGenre) VALUES (idTrack, idGenre);
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
;

