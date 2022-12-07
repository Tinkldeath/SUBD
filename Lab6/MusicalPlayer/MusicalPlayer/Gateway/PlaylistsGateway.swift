import Foundation
import UIKit


class PlaylistsGateway: GatewayProtocol {
    
    private(set) var entities: Observable<[EntityProtocol]> = Observable<[EntityProtocol]>(value: [])
    
    func fetch() {
        // TODO: Send http request
    }
    
    func associatedImage() -> UIImage {
        return UIImage(systemName: "music.note.list")!
    }
    
}
