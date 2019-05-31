//
//  DriveProposalViewController.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import UIKit
import Foundation
import MarcelFrameworks

class DriveProposalViewController: UIViewController
{
  @IBOutlet private weak var mapView: UIView?
  @IBOutlet private weak var timeLabel: UILabel?
  @IBOutlet private weak var ecoPriceLabel: UILabel?
  @IBOutlet private weak var businessPriceLabel: UILabel?
  @IBOutlet private weak var travelPriceLabel: UILabel?
  @IBOutlet private weak var locationTextfield: UITextField?
  @IBOutlet private weak var destinationTextfield: UITextField?
  @IBOutlet private weak var locationView: UIStackView?
  
  var interactor: DriveProposalInteractorInput?
  
  var mapHelper: GoogleMapsHelper?
  
  var drives: [DriveViewModel]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
    interactor = DriveProposalFactory.createDriveProposalModule(view: self)
    interactor?.getDrives()
    interactor?.getDepartureAddress()
  }
  
  private func setupView() {
    locationView?.setShadow()
    
    guard let mapView = mapView else { return }
    
    let frame = CGRect(origin: .zero, size: mapView.frame.size)
    let helper = GoogleMapsHelper(frame)
    mapView.addSubview(helper.view)
    helper.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    mapHelper = helper
    
    mapHelper?.setCenter(position: LocationManager.shared.getUserLocation())
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  @IBAction func ecoButtonTapped(_ sender: Any) {
    guard let drives = self.drives else { return }
    timeLabel?.text = drives[0].estimatedTime
  }
  
  @IBAction func businessButtonTapped(_ sender: Any) {
    guard let drives = self.drives else { return }
    timeLabel?.text = drives[1].estimatedTime
  }
  
  @IBAction func travelButtonTapped(_ sender: Any) {
    guard let drives = self.drives else { return }
    timeLabel?.text = drives[2].estimatedTime
  }
}

extension DriveProposalViewController: DriveProposalPresenterOutput
{
  func showDepartureAddress(_ departure: String) {
    locationTextfield?.text = departure
  }
  
  func showError(_ message: String) {
    print(message)
  }
  
  func showDrives(_ driveModels: [DriveViewModel]) {
    drives = driveModels
    
    driveModels.forEach() { model in
      switch model.range {
      case .eco:
        ecoPriceLabel?.text = model.title
      case .business:
        businessPriceLabel?.text = model.title
      case .travel:
        travelPriceLabel?.text = model.title
      }
    }
  }
}
