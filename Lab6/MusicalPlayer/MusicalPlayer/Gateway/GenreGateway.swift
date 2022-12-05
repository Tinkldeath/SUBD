import Foundation


struct GenresGateway {
    
    var genres: [Genre]
    
    mutating func fetch() {
        // TODO: Send http request
    }
    
    func genre(_ id: Int) -> Genre? {
        return self.genres.first(where: { $0.id == id })
    }
    
    mutating func addGenre(_ title: String) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func updateGenre(_ id: Int, _ title: String) {
        // TODO: Send http request
        self.fetch()
    }
    
    mutating func removeGenre(_ id: Int) {
        // TODO: Send http request
        self.fetch()
    }
    
}
