//
//  DriveProposalFactory.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

enum DriveProposalFactory
{
  static func createDriveProposalModule(view: DriveProposalPresenterOutput) -> DriveProposalInteractorInput {
    let adapter = DriveAdapter()
    let presenter = DriveProposalPresenter(view: view)
    return DriveProposalInteractor(adapter: adapter, presenter: presenter)
  }
}
