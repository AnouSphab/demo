//
//  HomeViewController.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import UIKit
import MarcelFrameworks

class HomeViewController: UIViewController
{
  @IBOutlet private weak var contentView: UIView?
  @IBOutlet private weak var containerView: UIView?
  @IBOutlet private weak var mapView: UIView?
  @IBOutlet private(set) weak var offerImageView: UIImageView?
  
  var interactor: HomeInteractorInput?
  
  private var mapHelper: GoogleMapsHelper?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    interactor = HomeFactory.createHomeModule(self)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
    interactor?.getOfferData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "searchContainer" {
      let destination = segue.destination as? SearchDestinationViewController
      destination?.delegate = self
    } else if segue.identifier == "showSearchController" {
      let destination = segue.destination as? SearchDestinationViewController
      destination?.fullMode = true
    }
  }
  
  private func setupView() {
    contentView?.setShadow()
    containerView?.setRoundedCorners(withRadius: 15)
    
    guard let mapView = mapView else { return }
    
    let frame = CGRect(origin: .zero, size: mapView.frame.size)
    let helper = GoogleMapsHelper(frame)
    mapView.addSubview(helper.view)
    helper.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    mapHelper = helper
    
    LocationManager.shared.delegate = self
    LocationManager.shared.startLocating()
  }
}

extension HomeViewController: LocationDelegate
{
  public func didUpdateUserLocation(location: Location) {
    mapHelper?.setCenter(position: location)
  }
}

extension HomeViewController: HomePresenterOutput
{  
  func showOfferBanner(imageURL: String) {
    offerImageView?.image = UIImage(named: imageURL)
  }
  
  func showError(_ message: String) {
    print(message)
  }
}

extension HomeViewController: SearchDestinationDelegate
{
  func didTapSearch() {
    performSegue(withIdentifier: "showSearchController", sender: nil)
  }
  
  func didTapUserAddresses(index: Int) {
    performSegue(withIdentifier: "showDriveProposal", sender: nil)
  }
}
