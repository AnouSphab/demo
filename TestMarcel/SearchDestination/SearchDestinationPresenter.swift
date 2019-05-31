//
//  SearchDestinationPresenter.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

class SearchDestinationPresenter
{
  var view: SearchDestinationPresenterOutput
  
  enum Error
  {
    static let `default` = "An error occured."
  }
  
  init(view: SearchDestinationPresenterOutput) {
    self.view = view
  }
}

extension SearchDestinationPresenter: SearchDestinationInteractorOutput
{
  func updateUserLocation(_ address: GeocodeAddress) {
    view.showUserLocation(location: address.title)
  }
  
  func updateFavoritesAddresses(_ addresses: [Address]) {
    let viewModels = addresses.map(DestinationViewModel.init)
    view.showFavoritesAddresses(viewModels)
  }
  
  func updateError() {
    view.showError(Error.default)
  }
}
