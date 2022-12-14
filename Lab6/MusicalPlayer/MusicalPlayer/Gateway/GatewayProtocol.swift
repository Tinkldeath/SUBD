import Foundation
import UIKit


protocol GatewayProtocol {
    var entities: Observable<[EntityProtocol]> { get }
    
    func fetch() async
    func associatedImage() -> UIImage
    func entityForIndexPath(_ indexPath: IndexPath) -> EntityProtocol
    func update(_ id: Int, _ newValue: String) async
    func delete(_ id: Int) async
}
