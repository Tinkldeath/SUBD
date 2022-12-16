import Foundation
import UIKit


class LogsGateway {
    
    private(set) var entities: Observable<[Log]> = Observable<[Log]>(value: [])
    private var aliUrl = (UIApplication.shared.delegate as! AppDelegate).apiUrl
    
    func fetch() async {
        let url = URL(string: self.aliUrl + "/logs/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let list = try JSONDecoder().decode([Log].self, from: data)
                    self.entities.value = list
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
}
