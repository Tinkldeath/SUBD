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
    
    func addTrack(_ title: String, _ genres: [Int], _ artists: [Int], _ album: Int) async {
        struct Body: Encodable {
            var title: String
            var genres: [Int]
            var artists: [Int]
            var album: Int
        }
        let body = Body(title: title, genres: genres, artists: artists, album: album)
        let url = URL(string: self.aliUrl + "/track/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
    
    func associatedImage() -> UIImage {
        return UIImage(systemName: "music.note")!
    }
    
    func entityForIndexPath(_ indexPath: IndexPath) -> EntityProtocol {
        return self.entities.value[indexPath.row]
    }
    
    func update(_ id: Int, _ newValue: String) async {
        struct Body: Encodable {
            var title: String
        }
        let body = Body(title: newValue)
        let url = URL(string: self.aliUrl + "/track/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try! JSONEncoder().encode(body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
    
    func delete(_ id: Int) async {
        let url = URL(string: self.aliUrl + "/track/delete/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.allowsCellularAccess = true
        request.allowsExpensiveNetworkAccess = true
        request.allowsConstrainedNetworkAccess = true
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
