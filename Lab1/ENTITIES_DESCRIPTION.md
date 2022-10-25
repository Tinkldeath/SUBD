| Entitiy name  | Entity Description | Field | Field Description | Type | Relation |
| ------------- |:------------------:|:-----:|:-----------------:|:----:|:--------:|
|Genre|Describes a musical genre|id|unique identifier|serial||
|||title|genre's title|varchar(30)||
|GenreToPlaylists|Connector between genre and playlist|id|unique identifier|serial||
|||genreId|genre's id|integer|many to one (genre)|
|||playlistId|playlist's id|integer|many to one (playlist)|
|GenreToTracks|Connector between genre and track|id|unique identifier|serial||
|||genreId|genre's id|integer|many to one (genre)|
|||trackId|track's id|integer|many to one (track)|
|GenreToArtists|Connector between genre and artist|id|unique identifier|serial||
|||genreId|genre's id|integer|many to one (genre)|
|||artistId|artist's id|integer|many to one (artist)|
|Playlist|Describes a musical playlist|id|unique identifier|serial||
|||ownerId|playlist's owner id (user)|integer|many to one (user)|
|||title|playlist's title|varchar(30)||
|PlaylistToTracks|Connector between playlist and tracks|id|unique identifier|serial||
|||playlistId|playlist's id|integer|many to one (playlist)|
|||trackId|track's id|integer|many to one (track)|
|Track|Describes a musical track|id|unique identifier|serial||
|||adbumId|album's id|integer|one to one (album)|
|||artistId|artist's id|integer|one to one (artist)|
|||title|track's title|varchar(30)||
|||audioPath|track's audio path on server|varchar(100)||
|Artist|Describes a musical artist|id|unique identifier|serial||
|||name|artist's name|varchar(30)||
|||imageUrl|artist's image path on server|varchar(100)||
|Album|Describes a musical album|id|unique identifier|serial||
|||artistId|artist's id|integer|one to one (artist)|
|||title|playlist's title|varchar(30)||
|||imageUrl|album's image path on server|varchar(100)||
|User|Describes a registered user|id|unique identifier|serial||
|||permissionId|user's permission|integer|one to one (permission)|
|||login|user's unique login|varchar(100)||
|||password|user's encrypted password|varchar(100)||
|Permission|Describes a permissions of user|id|unique identifier|serial||
|||canEdit|user can edit anything(1 or 0)|number(1)||
|||canAdd|user can add anything(1 or 0)|number(1)||
|||canDelet|user can delete anything(1 or 0)|number(1)||