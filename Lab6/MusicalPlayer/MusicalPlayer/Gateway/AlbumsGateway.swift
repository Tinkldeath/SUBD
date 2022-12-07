import Foundation


class AlbumsGateway: GatewayProtocol {
    
    private(set) var entities: Observable<[EntityProtocol]> = Observable<[EntityProtocol]>(value: [])
    
    func fetch() {
        // TODO: Send http request
    }
    
}
