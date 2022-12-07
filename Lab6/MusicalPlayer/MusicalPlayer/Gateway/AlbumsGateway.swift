import Foundation
import UIKit


class AlbumsGateway: GatewayProtocol {
    
    private(set) var entities: Observable<[EntityProtocol]> = Observable<[EntityProtocol]>(value: [])
    private var aliUrl = (UIApplication.shared.delegate as! AppDelegate).apiUrl
    
    func fetch() async {
        let url = URL(string: self.aliUrl + "/album")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([Album].self, from: data)
                    self.entities.value = list.map({ $0 })
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
    
    func fetchTracksForAlbum(_ id: Int, _ completionHandler: @escaping (_ tracks: [Track]) -> Void) async {
        let url = URL(string: self.aliUrl + "/album/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, _ in
            var tracks = [Track]()
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([TracksGateway.CodableTrack].self, from: data)
                    for item in list {
                        if tracks.contains(where: { $0.id == item.id }) {
                            if let index = tracks.firstIndex(where: { $0.id == item.id }) {
                                tracks[index].artists.append(item.artist)
                            }
                        }else {
                            tracks.append(Track(id: item.id, title: item.title, album: item.album, artists: [item.artist]))
                        }
                    }
                    completionHandler(tracks)
                }catch {
                    print(String(describing: error))
                }
            }
            completionHandler(tracks)
        }
        session.resume()
    }
    
    func associatedImage() -> UIImage {
        return UIImage(systemName: "music.note.list")!
    }
    
    func entityForIndexPath(_ indexPath: IndexPath) -> EntityProtocol {
        return self.entities.value[indexPath.row]
    }
    
}
