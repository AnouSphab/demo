//
//  OfferAdapterMock.swift
//  TestMarcelTests
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

@testable import MarcelFrameworks

final class OfferAdapterMock: OfferAdapting
{
  var offerData: OfferData?
  
  var fetchOfferError: MarcelFrameworks.Error?
  var getOfferError: MarcelFrameworks.Error?
  
  func fetchOfferData(completion: @escaping OfferResult) {
    if let offer = offerData {
      completion(.success(offer))
    } else {
      completion(.failure(fetchOfferError ?? .technical))
    }
  }
  
  func getOfferData(completion: @escaping OfferResult) {
    if let offer = offerData {
      completion(.success(offer))
    } else {
      completion(.failure(getOfferError ?? .technical))
    }
  }
  
  struct Data: OfferModel, Equatable
  {
    var imageURL: String = "offer"
  }
}
