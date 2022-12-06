# REST Python API (Musical player)

## Track URLs:
* GET (All tracks from db): http://localhost/musical-player/track/
* GET (Single track from db): http://localhost/musical-player/track/{id}
* PUT (Update single track): http://localhost/musical-player/track/{id}
* POST (Add track to db): http://localhost/musical-player/track/add
* DELETE (Delete track): http://localhost/musical-player/track/{id}

## Album URLs:
* GET (All albums from db): http://localhost/musical-player/album/
* GET (Single album from db): http://localhost/musical-player/album/{id}
* POST (Add album to db): http://localhost/musical-player/album/add
* PUT (Update single album): http://localhost/musical-player/album/{id}
* DELETE (Delete album): http://localhost/musical-player/album/{id}

## Artist URLs:
* GET (All artists from db): http://localhost/musical-player/artist/
* GET (Single artist tracks from db): http://localhost/musical-player/artist/tracks/{id}
* GET (Single artist albums from db): http://localhost/musical-player/artist/albums/{id}
* PUT (Update single artist): http://localhost/musical-player/artist/{id}
* POST (Add artist to db): http://localhost/musical-player/artist/add
* DELETE (Delete artist): http://localhost/musical-player/artist/{id}

## Playlist URLs:
* GET (All playlists from db): http://localhost/musical-player/playlist/
* GET (Single playlist from db): http://localhost/musical-player/playlist/{id}
* PUT (Update single playlist): http://localhost/musical-player/playlist/{id}
* POST (Add playlist to db): http://localhost/musical-player/playlist/add
* DELETE (Delete playlist): http://localhost/musical-player/playlist/{id}

## User URLs:
* GET (All users from db): http://localhost/musical-player/user/
* GET (Single user from db): http://localhost/musical-player/user/{id}
* PUT (Update single user): http://localhost/musical-player/user/{id}
* POST (Add user to db): http://localhost/musical-player/user/add
* DELETE (Delete user): http://localhost/musical-player/user/{id}

## Genre URLs:
* GET (All genres from db): http://localhost/musical-player/genre/
* GET (Tracks by genre from db): http://localhost/musical-player/genre/tracks/{id}
* GET (Artists by genre from db): http://localhost/musical-player/genre/artists/{id}
* GET (Albums by genre from db): http://localhost/musical-player/genre/albums/{id}
* PUT (Update single genre): http://localhost/musical-player/genre/{id}
* POST (Add genre to db): http://localhost/musical-player/genre/add
* DELETE (Delete genre): http://localhost/musical-player/genre/{id}
