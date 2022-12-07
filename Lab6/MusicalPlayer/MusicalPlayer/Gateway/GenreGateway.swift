import Foundation


class GenresGateway: GatewayProtocol {
    
    private(set) var entities: Observable<[EntityProtocol]> = Observable<[EntityProtocol]>(value: [])
    
    func fetch() {
        // TODO: Send http request
    }
    
}
