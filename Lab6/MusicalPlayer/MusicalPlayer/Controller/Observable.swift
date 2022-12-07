import Foundation


class Observable<T> {
    var value: T {
        didSet {
            self.listener?(self.value)
        }
    }
    private var listener: ((T) -> Void)?
    
    func bind(_ listener: @escaping (T) -> Void) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(value: T) {
        self.value = value
    }
    
}
