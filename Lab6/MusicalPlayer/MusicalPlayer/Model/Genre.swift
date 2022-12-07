import Foundation


struct Genre: EntityProtocol, Codable {
    var id: Int
    var albums: Int
    var artists: Int
    var title: String
    var tracks: Int
    
    func cellConfiguration() -> (title: String, details: String) {
        return (self.title + ", Tracks: \(self.tracks)", "Artists: \(self.artists), Albums: \(self.albums)")
    }
}
