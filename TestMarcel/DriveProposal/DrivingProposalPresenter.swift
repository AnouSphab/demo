//
//  DriveProposalPresenter.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

class DriveProposalPresenter
{
  var view: DriveProposalPresenterOutput
  
  enum Error
  {
    static let `default` = "An error occured."
  }
  
  init(view: DriveProposalPresenterOutput) {
    self.view = view
  }
}

extension DriveProposalPresenter: DriveProposalInteractorOutput
{
  func updateError() {
    view.showError(Error.default)
  }
  
  func updateDrives(_ drives: [Drive]) {
    let driveModels = drives.map(DriveViewModel.init)
    view.showDrives(driveModels)
  }
  
  func updateDepartureAddress(_ address: GeocodeAddress) {
    view.showDepartureAddress(address.title)
  }
}
