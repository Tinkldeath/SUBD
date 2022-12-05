import Foundation


struct ArtistsGateway {
    
    var artists: [Artist]
    
    mutating func fetch() {
        // TODO: Send http request
    }
    
    func artist(_ id: Int) -> Artist? {
        return self.artists.first(where: { $0.id == id })
    }
    
    mutating func addArtist(_ name: String) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func updateArtist(_ id: Int, _ name: String, _ albums: [Album], _ tracks: [Track]) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func removeArtist(_ id: Int) {
        // TODO: Send http request
        self.fetch()
    }
    
    func artistsByGenre(_ genre: Genre) -> [Artist] {
        return self.artists.filter({ $0.genres.contains(where: { $0.id == genre.id }) })
    }
    
    
}
