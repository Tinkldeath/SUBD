import Foundation


struct Playlist: Codable, EntityProtocol {
    var id: Int
    var title: String
    var owner: String
    var tracks: Int
    
    func cellConfiguration() -> (title: String, details: String) {
        return (self.title + "(\(self.owner))", "Tracks: \(self.tracks)")
    }
}
