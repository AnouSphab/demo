//
//  MapInteractor.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import MarcelFrameworks

final class HomeInteractor
{
  var output: HomeInteractorOutput
  var adapter: OfferAdapting
  
  init(adapter: OfferAdapting, presenter: HomeInteractorOutput) {
    self.adapter = adapter
    self.output = presenter
  }
  
  private func handleError(_ error: MarcelFrameworks.Error) {
    output.updateError()
  }
  
  private func handleOfferDataSuccess(_ response: OfferData) {
    output.updateOfferData(offer: response)
  }
}

extension HomeInteractor: HomeInteractorInput
{  
  func getOfferData() {
    adapter.fetchOfferData() { [weak self] result in
      switch result {
      case .failure(let error):
        self?.handleError(error)
      case .success(let offer):
        self?.handleOfferDataSuccess(offer)
      }
    }
  }
}
