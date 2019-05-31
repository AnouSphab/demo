//
//  HomeBoundaries.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

protocol HomeInteractorInput
{
  func getOfferData()
}

protocol HomeInteractorOutput
{
  func updateOfferData(offer: OfferData)
  func updateError()
}

protocol HomePresenterOutput
{
  func showOfferBanner(imageURL: String)
  func showError(_ message: String)
}
