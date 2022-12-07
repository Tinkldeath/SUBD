import Foundation
import UIKit


class UsersGateway {
    
    struct LoginBody: Codable {
        var login: String
        var password: String
    }
    
    private var aliUrl = (UIApplication.shared.delegate as! AppDelegate).apiUrl
    
    func register(_ login: String, _ paswword: String){

    }
    
    func login(_ login: String, _ password: String, _ completionHandler: @escaping (_ user: User?, _ error: Error?) -> Void) {
        let url = URL(string: self.aliUrl + "/user/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(LoginBody(login: login, password: password))
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do{
                    let user = try JSONDecoder().decode(User.self, from: data)
                    completionHandler(user, nil)
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
}
