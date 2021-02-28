#if canImport(UIKit)
import UIKit

extension UITableViewCell: Reusable {}

extension UITableViewHeaderFooterView: Reusable {}

extension UITableView {
  func register(_ cell: UITableViewCell.Type) {
    register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
  }
  
  func register(_ view: UITableViewHeaderFooterView.Type) {
    register(view, forHeaderFooterViewReuseIdentifier: view.reuseIdentifier)
  }
  
  func dequeue<C: UITableViewCell>(_ cell: C.Type, for indexPath: IndexPath) -> C {
    guard let cell = dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: indexPath) as? C else {
      fatalError("Cell of type " + String(describing: C.self) + " not registered.")
    }
    
    return cell
  }
  
  func dequeue<V: UITableViewHeaderFooterView>(_ view: V.Type) -> V {
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: view.reuseIdentifier) as? V else {
      fatalError("Reusable view of type " + String(describing: V.self) + " not registered.")
    }
    
    return view
  }
}
#endif
