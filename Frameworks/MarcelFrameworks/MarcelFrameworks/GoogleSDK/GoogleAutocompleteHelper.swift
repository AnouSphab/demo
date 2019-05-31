//
//  GoogleAutocompleteHelper.swift
//  MarcelFrameworks
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import GooglePlaces

public struct Prediction
{
  public var id: String
  public var title: NSAttributedString
  
  public init(prediction: GMSAutocompletePrediction) {
    self.id = prediction.placeID
    self.title = prediction.attributedFullText
  }
}

public typealias AutocompleteResult = (Result<[Prediction], Error>) -> Void

public class GoogleAutocompleteHelper
{
  private let places = GMSPlacesClient()
  private let filter = GMSAutocompleteFilter()
  
  public init() {}
  
  public func findAutocompletePredictions(from query: String, completion: @escaping AutocompleteResult) {
    filter.type = .establishment
    
    places.autocompleteQuery(query, bounds: nil, boundsMode: .bias, filter: filter) { (results, error) in
      if let _ = error {
        completion(.failure(.technical))
        return
      }
      
      if let predictions = results {
        let predictions = predictions.map(Prediction.init)
        completion(.success(predictions))
      }
    }
  }
}
