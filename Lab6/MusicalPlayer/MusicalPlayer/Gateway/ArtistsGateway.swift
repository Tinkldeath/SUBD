import Foundation


class ArtistsGateway: GatewayProtocol {
    
    private(set) var entities: Observable<[EntityProtocol]> = Observable<[EntityProtocol]>(value: [])
    
    func fetch() {
        // TODO: Send http request
    }
    
}
