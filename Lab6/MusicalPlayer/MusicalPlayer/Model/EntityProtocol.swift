import Foundation


protocol EntityProtocol {
    var id: Int { get }
    func cellConfiguration() -> (title: String, details: String)
}
