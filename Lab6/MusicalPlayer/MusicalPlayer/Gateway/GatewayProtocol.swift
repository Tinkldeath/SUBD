import Foundation
import UIKit


protocol GatewayProtocol {
    var entities: Observable<[EntityProtocol]> { get }
    
    func fetch() async
    func associatedImage() -> UIImage
    func entityForIndexPath(_ indexPath: IndexPath) -> EntityProtocol
}
