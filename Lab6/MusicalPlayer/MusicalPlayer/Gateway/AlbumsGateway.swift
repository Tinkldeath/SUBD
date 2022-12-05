import Foundation


struct AlbumsGateway {
    
    var albums: [Album]
    
    mutating func fetch() {
        // TODO: Send http request
    }
    
    func album(_ id: Int) -> Album? {
        return self.albums.first(where: { $0.id == id })
    }
    
    mutating func addAlbum(_ title: String, _ artist: Artist) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func updateAlbum(_ id: Int, _ title: String, _ artist: Artist, _ tracks: [Track]) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func removeAlbum(_ id: Int) {
        // TODO: Send http request
        self.fetch()
    }
    
    func albumsByGenre(_ genre: Genre) -> [Album] {
        return self.albums.filter({ $0.genres.contains(where: { $0.id == genre.id }) })
    }
    
}
