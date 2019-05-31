//
//  HomePresenterTests.swift
//  TestMarcelTests
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Quick
import Nimble

import MarcelFrameworks

@testable import TestMarcel

final class HomePresenterTests: QuickSpec
{
  override func spec() {
    var viewMock: ViewMock!
    var presenter: HomePresenter!
    
    beforeEach {
      viewMock = ViewMock()
      presenter = HomePresenter(view: viewMock)
    }
    
    describe("Home Presenter") {
      describe("receives offer image URL") {
        it("updates banner view") {
          // Act
          presenter.updateOfferData(offer: OfferData())
          // Assert
          expect(viewMock.imgURL) == "offer"
        }
      }
    }
  }
  
  final class ViewMock: HomePresenterOutput
  {
    var imgURL: String?
    var errorMsg: String?
    
    func showOfferBanner(imageURL: String) {
      imgURL = imageURL
    }
    
    func showError(_ message: String) {
      errorMsg = message
    }
  }
}
