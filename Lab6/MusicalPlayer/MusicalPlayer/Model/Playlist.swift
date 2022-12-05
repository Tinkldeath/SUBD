import Foundation


struct Playlist {
    var id: Int
    var title: String
    var owner: User
    var tracks: [Track]
    var genres: [Genre]
}
