import Foundation


protocol GatewayProtocol {
    
    var entities: Observable<[EntityProtocol]> { get }
    func fetch() async
}
