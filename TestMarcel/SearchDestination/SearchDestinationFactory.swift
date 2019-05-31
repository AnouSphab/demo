//
//  SearchDestinationFactory.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

enum SearchDestinationFactory
{
  static func createSearchModule(view: SearchDestinationPresenterOutput) -> SearchDestinationInteractorInput {
    let adapter = UserAdapter()
    let presenter = SearchDestinationPresenter(view: view)
    return SearchDestinationInteractor(presenter: presenter, adapter: adapter)
  }
}
