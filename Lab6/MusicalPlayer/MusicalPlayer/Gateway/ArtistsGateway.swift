import Foundation
import UIKit


class ArtistsGateway: GatewayProtocol {
    
    private(set) var entities: Observable<[EntityProtocol]> = Observable<[EntityProtocol]>(value: [])
    private var aliUrl = (UIApplication.shared.delegate as! AppDelegate).apiUrl
    
    func fetch() async {
        let url = URL(string: self.aliUrl + "/artist")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([Artist].self, from: data)
                    self.entities.value = list.map({ $0 })
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
    
    func fetchArtistTracks(_ id: Int, _ completionHandler: @escaping (_ tracks: [Track]) -> Void) async {
        let url = URL(string: self.aliUrl + "/artist/tracks/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
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
    
    func fetchArtistAlbums(_ id: Int, _ completionHandler: @escaping (_ albums: [Album]) -> Void) async {
        let url = URL(string: self.aliUrl + "/artist/albums/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([Album].self, from: data)
                    completionHandler(list.map({ $0 }))
                    return
                }catch {
                    print(String(describing: error))
                }
            }
            completionHandler([])
        }
        session.resume()
    }
    
    func addArtist(_ name: String) {
        struct Body: Encodable {
            var name: String
        }
        let url = URL(string: self.aliUrl + "/artist/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(Body(name: name))
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([Artist].self, from: data)
                    self.entities.value = list.map({ $0 })
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
    
    func update(_ id: Int, _ newValue: String) async {
        struct Body: Encodable {
            var name: String
        }
        let url = URL(string: self.aliUrl + "/artist/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try! JSONEncoder().encode(Body(name: newValue))
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([Artist].self, from: data)
                    self.entities.value = list.map({ $0 })
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
    
    func delete(_ id: Int) async {
        let url = URL(string: self.aliUrl + "/artist/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.allowsCellularAccess = true
        request.allowsExpensiveNetworkAccess = true
        request.allowsConstrainedNetworkAccess = true
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([Artist].self, from: data)
                    self.entities.value = list.map({ $0 })
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
    
    func associatedImage() -> UIImage {
        return UIImage(systemName: "music.mic")!
    }
    
    func entityForIndexPath(_ indexPath: IndexPath) -> EntityProtocol {
        return self.entities.value[indexPath.row]
    }
    
}
