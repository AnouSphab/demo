//
//  DriveProposalBoundaries.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

protocol DriveProposalInteractorInput
{
  func getDepartureAddress()
  func getDrives()
}

protocol DriveProposalInteractorOutput
{
  func updateDepartureAddress(_ address: GeocodeAddress)
  func updateDrives(_ drives: [Drive])
  func updateError()
}

protocol DriveProposalPresenterOutput
{
  func showDepartureAddress(_ departure: String)
  func showDrives(_ driveModels: [DriveViewModel])
  func showError(_ message: String)
}

struct DriveViewModel
{
  var range: RangeType
  var title: String
  var estimatedTime: String
  
  init(_ drive: Drive) {
    self.title = "\(drive.price) €"
    self.estimatedTime = "Temps d'attente éstimé à \(drive.time) min"
    self.range = drive.range
  }
}
