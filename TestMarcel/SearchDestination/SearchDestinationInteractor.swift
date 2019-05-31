//
//  SearchDestinationInteractor.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

class SearchDestinationInteractor
{
  var adapter: UserAdapting
  var output: SearchDestinationInteractorOutput
  
  let geocodeHelper = GoogleGeocodeHelper()
  
  init(presenter: SearchDestinationInteractorOutput, adapter: UserAdapting) {
    self.output = presenter
    self.adapter = adapter
  }
  
  private func handleError(_ error: MarcelFrameworks.Error) {
    output.updateError()
  }
  
  private func handleFavoriteAddressesSuccess(_ response: UserAddresses) {
    output.updateFavoritesAddresses(response.addresses)
  }
  
  private func handleReverseGeocodingSuccess(_ address: GeocodeAddress) {
    output.updateUserLocation(address)
  }
}

extension SearchDestinationInteractor: SearchDestinationInteractorInput
{
  func getUserLocation() {
    let location = LocationManager.shared.getUserLocation()
    geocodeHelper.reverseGeocode(location: location) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case . failure(let error):
        self.handleError(error)
      case .success(let address):
        self.handleReverseGeocodingSuccess(address)
      }
    }
  }
  
  func getFavoritesAddresses() {
    adapter.fetchUserFavoriteAddresses() { [weak self] result in
      switch result {
      case .failure(let error):
        self?.handleError(error)
      case .success(let addresses):
        self?.handleFavoriteAddressesSuccess(addresses)
      }
    }
  }
}
