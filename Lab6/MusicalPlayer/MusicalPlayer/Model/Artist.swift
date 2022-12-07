import Foundation


struct Artist: EntityProtocol, Codable {
    var id: Int
    var name: String
    var albums: Int
    var tracks: Int
    
    func cellConfiguration() -> (title: String, details: String) {
        return(self.name, "Albums: \(self.albums), Tracks: \(self.tracks)")
    }
}
