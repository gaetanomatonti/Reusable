#if canImport(UIKit)
import UIKit

extension UICollectionReusableView: Reusable {}

public extension UICollectionView {
  func register(cell: UICollectionViewCell.Type) {
    register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
  }
  
  func register(header: UICollectionReusableView.Type) {
    register(
      header,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: header.reuseIdentifier
    )
  }
  
  func register(footer: UICollectionReusableView.Type) {
    register(
      footer,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: footer.reuseIdentifier
    )
  }

  func dequeue<C: UICollectionViewCell>(cell: C.Type, for indexPath: IndexPath) -> C {
    guard let cell = dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: indexPath) as? C else {
      fatalError("Cell of type " + String(describing: C.self) + " not registered.")
    }
    
    return cell
  }
  
  func dequeue<H: UICollectionReusableView>(header: H.Type, for indexPath: IndexPath) -> H {
    guard
      let header = dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionHeader,
        withReuseIdentifier: header.reuseIdentifier,
        for: indexPath
      ) as? H
    else {
      fatalError("Header of type " + String(describing: H.self) + " not registered.")
    }
    
    return header
  }
  
  func dequeue<F: UICollectionReusableView>(footer: F.Type, for indexPath: IndexPath) -> F {
    guard
      let footer = dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionFooter,
        withReuseIdentifier: footer.reuseIdentifier,
        for: indexPath
      ) as? F
    else {
      fatalError("Footer of type " + String(describing: F.self) + " not registered.")
    }
    
    return footer
  }
}
#endif
