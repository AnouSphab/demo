//
//  UIView+Marcel.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
  func setRoundedCorners(withRadius radius: CGFloat = 15) {
    layer.cornerRadius = radius
    clipsToBounds = true
  }
  
  func setShadow(radius: CGFloat = 15,
                 shadowRadius: CGFloat = 10,
                 opacity: Float = 0.6,
                 color: UIColor = .darkGray,
                 offset: CGSize = CGSize(width: 5, height: 5))
  {
    layer.cornerRadius = radius
    layer.shadowColor = color.cgColor
    layer.shadowOffset = offset
    layer.shadowRadius = shadowRadius
    layer.shadowOpacity = opacity
  }
}
