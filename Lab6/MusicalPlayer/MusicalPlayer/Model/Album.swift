import Foundation


struct Album: EntityProtocol {
    var id: Int
    var title: String
    var artist: String
    var tracks: Int
    
    func cellConfiguration() -> (title: String, details: String) {
        return (self.title + " (\(self.artist))", "Tracks: \(self.tracks)")
    }
}
