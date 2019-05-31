//
//  GoogleMapsHelper.swift
//  MarcelFrameworks
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import GoogleMaps

public class GoogleMapsHelper: NSObject
{
  public var view: UIView {
    return mapView
  }
  
  private let mapView: GMSMapView
  
  public init(_ frame: CGRect) {
    mapView = GMSMapView(frame: frame)
    super.init()
    mapView.isMyLocationEnabled = true
    mapView.settings.myLocationButton = true
  }
  
  public func setCenter(position: Location) {
    let coords = CLLocationCoordinate2D(latitude: position.latitude, longitude: position.longitude)
    let camera = GMSCameraPosition(target: coords, zoom: 15, bearing: 0, viewingAngle: 0)
    mapView.camera = camera
  }
}
