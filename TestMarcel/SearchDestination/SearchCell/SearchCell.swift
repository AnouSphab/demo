//
//  SearchCell.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import UIKit

class SearchCell: UITableViewCell
{
  @IBOutlet private weak var leftImageView: UIImageView?
  @IBOutlet private weak var titleLabel: UILabel?
  @IBOutlet private weak var descriptionLabel: UILabel?
  
  func setup(viewModel: DestinationViewModel?) {
    guard let model = viewModel else { return }
    leftImageView?.image = UIImage(named: model.image)
    titleLabel?.text = model.title
    
    descriptionLabel?.isHidden = model.description == nil
    descriptionLabel?.text = model.description
  }
}

