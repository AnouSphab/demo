//
//  SearchPresenterTests.swift
//  TestMarcelTests
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Quick
import Nimble

import MarcelFrameworks

@testable import TestMarcel

final class SearchPresenterTests: QuickSpec
{
  override func spec() {
    var viewMock: ViewMock!
    var presenter: SearchDestinationPresenter!
    
    beforeEach {
      viewMock = ViewMock()
      presenter = SearchDestinationPresenter(view: viewMock)
    }
    
    describe("Search destination Presenter") {
      describe("receives favorites user addresses") {
        it("updates view") {
          // Act
          let addrs = UserAddresses()
          presenter.updateFavoritesAddresses(addrs.addresses)
          // Assert
          expect(viewMock.addrs).toNot(beNil())
        }
      }
    }
  }
  
  final class ViewMock: SearchDestinationPresenterOutput
  {
    var userLoc: String?
    var addrs: [DestinationViewModel]?
    
    var errorMsg: String?
    
    func showError(_ message: String) {
      errorMsg = message
    }
    
    func showUserLocation(location: String) {
      userLoc = location
    }
    
    func showFavoritesAddresses(_ addresses: [DestinationViewModel]) {
      addrs = addresses
    }
  }
}
