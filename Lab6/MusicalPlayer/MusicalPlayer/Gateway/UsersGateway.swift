import Foundation
import UIKit


class UsersGateway {
    
    private static var _instance = UsersGateway()
    public static var shared = {
       return _instance
    }()
    
    private init() {}
    
    struct LoginBody: Codable {
        var login: String
        var password: String
        var permission: Int
    }
    
    private(set) var user: User?
    
    private var aliUrl = (UIApplication.shared.delegate as! AppDelegate).apiUrl
    
    func register(_ login: String, _ paswword: String, _ completionHandler: @escaping (_ registered: Bool, _ error: NSError?) -> Void){
        let url = URL(string: self.aliUrl + "/user/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(LoginBody(login: login, password: paswword, permission: 1))
        let session = URLSession.shared.dataTask(with: request) { _, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 201 {
                    completionHandler(true, error as? NSError)
                }else if httpResponse.statusCode == 400 {
                    completionHandler(false, NSError(domain: "Please select another login", code: 400))
                }
            }
        }
        session.resume()
        completionHandler(false, nil)
    }
    
    func login(_ login: String, _ password: String, _ completionHandler: @escaping (_ user: User?, _ error: Error?) -> Void) {
        let url = URL(string: self.aliUrl + "/user/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(LoginBody(login: login, password: password, permission: 1))
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do{
                    let user = try JSONDecoder().decode(User.self, from: data)
                    self.user = user
                    completionHandler(user, nil)
                }catch {
                    print(String(describing: error))
                }
            }
        }
        session.resume()
    }
}
