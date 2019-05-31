//
//  SearchDestinationBoundaries.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

protocol SearchDestinationInteractorInput
{
  func getUserLocation()
  func getFavoritesAddresses()
}

protocol SearchDestinationInteractorOutput
{
  func updateUserLocation(_ address: GeocodeAddress)
  func updateFavoritesAddresses(_ addresses: [Address])
  func updateError()
}

protocol SearchDestinationPresenterOutput
{
  func showUserLocation(location: String)
  func showFavoritesAddresses(_ addresses: [DestinationViewModel])
  func showError(_ message: String)
}

private extension Address
{
  var title: String {
    switch self.type {
    case .home: return "Domicile"
    case .work: return "Travail"
    }
  }
  
  var image: String {
    switch self.type {
    case .home: return "house"
    case .work: return "work"
    }
  }
}

private extension Prediction
{
  var image: String {
    return "destination"
  }
}

struct DestinationViewModel
{
  var title: String
  var description: String?
  var image: String
  
  init(_ address: Address) {
    self.title = address.title
    self.description = "\(address.number) \(address.street), \(address.city)"
    self.image = address.image
  }
  
  init(_ prediction: Prediction) {
    self.title = prediction.title.string
    self.image = prediction.image
  }
}
