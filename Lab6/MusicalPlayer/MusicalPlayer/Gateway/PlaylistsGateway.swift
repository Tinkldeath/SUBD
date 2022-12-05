import Foundation


struct PlaylistsGateway {
    
    var playlists: [Playlist]
    
    mutating func fetch() {
        // TODO: Send http request
    }
    
    func playlist(_ id: Int) -> Playlist? {
        return self.playlists.first(where: { $0.id == id })
    }
    
    func addPlaylist(_ title: String, _ owner: User) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func updatePlaylist(_ id: Int, _ title: String, _ tracks: [Track]) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func removeAlbum(_ id: Int) {
        // TODO: Send http request
        self.fetch()
    }
    
    func playlistsByGenre(_ genre: Genre) -> [Playlist] {
        return self.playlists.filter({ $0.genres.contains(where: { $0.id == genre.id }) })
    }
    
}
