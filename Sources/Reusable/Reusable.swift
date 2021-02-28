public protocol Reusable {
  static var reuseIdentifier: String { get }
  
  var reuseIdentifier: String { get }
}

public extension Reusable {
  static var reuseIdentifier: String {
    String(describing: self) + ".reuseIdentifier"
  }
  
  var reuseIdentifier: String {
    String(describing: type(of: self)) + ".reuseIdentifier"
  }
}
