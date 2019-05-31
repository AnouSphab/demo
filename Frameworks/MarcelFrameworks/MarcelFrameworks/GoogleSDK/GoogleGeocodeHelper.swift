//
//  GoogleGeocodeHelper.swift
//  MarcelFrameworks
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import GoogleMaps

public typealias ReverseGeocodeResult = (Result<GeocodeAddress, Error>) -> Void

public struct GeocodeAddress
{
  public var title: String
  
  public init(_ addr: GMSAddress?) {
    guard let thoroughfare = addr?.thoroughfare, let locality = addr?.locality else {
      self.title = ""
      return
    }
    self.title = thoroughfare + locality
  }
}

public class GoogleGeocodeHelper
{
  private let geocode = GMSGeocoder()
  
  public init() {}
  
  public func reverseGeocode(location: Location, completion: @escaping ReverseGeocodeResult) {
    let coords = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    geocode.reverseGeocodeCoordinate(coords) { (results, error) in
      if error != nil {
        completion(.failure(.technical))
        return
      }
      
      if let addrs = results?.firstResult() {
        let address = GeocodeAddress(addrs)
        completion(.success(address))
      }
    }
  }
}
