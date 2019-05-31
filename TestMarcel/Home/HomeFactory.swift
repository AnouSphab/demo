//
//  HomeFactory.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

enum HomeFactory
{
  static func createHomeModule(_ view: HomePresenterOutput) -> HomeInteractorInput {
    let adapter = OfferAdapter()
    let presenter = HomePresenter(view: view)
    return HomeInteractor(adapter: adapter, presenter: presenter)
  }
}
