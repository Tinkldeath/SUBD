import Foundation


struct Track: EntityProtocol {
    
    var id: Int
    var title: String
    var album: String
    var artists: [String]
    
    func cellConfiguration() -> (title: String, details: String) {
        var details = ""
        for artist in self.artists {
            details += artist + ", "
        }
        details = String(details.dropLast(2))
        return (self.title, details)
    }
    
}
