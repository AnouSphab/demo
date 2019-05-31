//
//  MapPresenter.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

final class HomePresenter
{
  var view: HomePresenterOutput
  
  enum Error
  {
    static let `default` = "An error occured."
  }
  
  init(view: HomePresenterOutput) {
    self.view = view
  }
}

extension HomePresenter: HomeInteractorOutput
{
  func updateOfferData(offer: OfferData) {
    view.showOfferBanner(imageURL: offer.imageURL)
  }
  
  func updateError() {
    view.showError(Error.default)
  }
}
