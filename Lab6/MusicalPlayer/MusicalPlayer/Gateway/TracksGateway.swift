import Foundation
import UIKit


class TracksGateway: GatewayProtocol {
    
    struct CodableTrack: Codable {
        var id: Int
        var title: String
        var album: String
        var artist: String
    }
    
    private(set) var entities: Observable<[EntityProtocol]> = Observable<[EntityProtocol]>(value: [])
    private var aliUrl = (UIApplication.shared.delegate as! AppDelegate).apiUrl
    
    
    func fetch() async {
        let url = URL(string: self.aliUrl + "/track")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([CodableTrack].self, from: data)
                    var tracks = [Track]()
                    for item in list {
                        if tracks.contains(where: { $0.id == item.id }) {
                            if let index = tracks.firstIndex(where: { $0.id == item.id }) {
                                tracks[index].artists.append(item.artist)
                            }
                        }else {
                            tracks.append(Track(id: item.id, title: item.title, album: item.album, artists: [item.artist]))
                        }
                    }
                    self.entities.value = tracks
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
    
}
