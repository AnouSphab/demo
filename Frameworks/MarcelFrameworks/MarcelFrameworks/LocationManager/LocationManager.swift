//
//  LocationManager.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import CoreLocation

public protocol LocationDelegate: class
{
  func didUpdateUserLocation(location: Location)
}

public struct Location
{
  public var latitude: Double
  public var longitude: Double
  
  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}

public protocol Locating
{
  var delegate: LocationDelegate? { get set }
  
  func getUserLocation() -> Location
  func startLocating()
  func stopLocating()
}

public class LocationManager: NSObject, Locating, CLLocationManagerDelegate
{
  public static let shared = LocationManager()
  public weak var delegate: LocationDelegate?
  
  private let locationManager = CLLocationManager()
  private var userLocation = Location(latitude: 0.0, longitude: 0.0)
  
  public override init() {
    super.init()
    locationManager.delegate = self
  }
  
  public func getUserLocation() -> Location {
    return userLocation
  }
  
  public func startLocating() {
    locationManager.requestWhenInUseAuthorization()
  }
  
  public func stopLocating() {
    locationManager.stopUpdatingLocation()
  }
  
  public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedWhenInUse {
      locationManager.startUpdatingLocation()
    }
  }
  
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    locationManager.stopUpdatingLocation()
    let userLoc = Location(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    userLocation = userLoc
    delegate?.didUpdateUserLocation(location: userLoc)
  }
}
