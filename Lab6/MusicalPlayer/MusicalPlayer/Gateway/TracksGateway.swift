import Foundation


struct TracksGateway {
    var tracks: [Track]
    
    mutating func fetch() {
        // TODO: Send http request
    }
    
    func track(_ id: Int) -> Track? {
        return self.tracks.first(where: { $0.id == id })
    }
    
    mutating func addTrack(_ title: String, _ album: Album, _ artists: [Artist], _ genres: [Genre]) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func updateTrack(_ id: Int, _ title: String, _ album: Album, _ artists: [Artist], _ genres: [Genre]) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func removeTrack(_ id: Int) {
        // TODO: Send http request
        self.fetch()
    }
    
    func tracksByGenre(_ genre: Genre) -> [Track] {
        return self.tracks.filter { $0.genres.contains(where: { genre.id == $0.id }) }
    }
    
}
