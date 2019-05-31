//
//  UITableView+Marcel.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import UIKit

extension UITableView
{
  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
    let identifier = String(describing: T.self)
    return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
  }
  
  func deselectAllItems(animated: Bool) {
    guard let selectedItems = indexPathsForSelectedRows else { return }
    for indexPath in selectedItems { deselectRow(at: indexPath, animated: animated) }
  }
}
