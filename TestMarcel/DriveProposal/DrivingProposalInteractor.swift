//
//  DriveProposalInteractor.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

class DriveProposalInteractor
{
  var output: DriveProposalInteractorOutput
  var adapter: DriveAdapting
  
  let geocode = GoogleGeocodeHelper()
  
  init(adapter: DriveAdapting, presenter: DriveProposalInteractorOutput) {
    self.output = presenter
    self.adapter = adapter
  }
  
  private func handleError(_ error: MarcelFrameworks.Error) {
    output.updateError()
  }
  
  private func handleSuccess(_ drives: [Drive]) {
    output.updateDrives(drives)
  }
  
  private func handleReverseGeocodingSuccess(_ address: GeocodeAddress) {
    output.updateDepartureAddress(address)
  }
}

extension DriveProposalInteractor: DriveProposalInteractorInput
{
  func getDepartureAddress() {
    // user location by default
    let userLoc = LocationManager.shared.getUserLocation()
    
    geocode.reverseGeocode(location: userLoc) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case . failure(let error):
        self.handleError(error)
      case .success(let address):
        self.handleReverseGeocodingSuccess(address)
      }
    }
  }
  
  func getDrives() {
    // user location by default
    let userLoc = LocationManager.shared.getUserLocation()
    let destLoc = Location(latitude: 50.0, longitude: 50.0)
    
    adapter.fetchDrives(for: userLoc, arrival: destLoc) { [weak self] result in
      switch result {
      case .failure(let error):
        self?.handleError(error)
      case .success(let drives):
        self?.handleSuccess(drives)
      }
    }
  }
}
