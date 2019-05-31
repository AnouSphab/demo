//
//  HomeInteractorTests.swift
//  TestMarcelTests
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Quick
import Nimble

@testable import TestMarcel
@testable import MarcelFrameworks

final class HomeInteractorTests: QuickSpec
{
  override func spec() {
    var offerAdapterMock: OfferAdapterMock!
    var interactor: HomeInteractor!
    var presenterMock: PresenterMock!
    
    beforeEach {
      offerAdapterMock = OfferAdapterMock()
      presenterMock = PresenterMock()
      interactor = HomeInteractor(adapter: offerAdapterMock, presenter: presenterMock)
    }
    
    describe("Home Interactor") {
      describe("fetches data") {
        
        it("should return data") {
          // Arrange
          offerAdapterMock.offerData = OfferData()
          // Act
          interactor.getOfferData()
          // Assert
          expect(presenterMock.offerData?.imageURL) == "offer"
          expect(presenterMock.dataError).to(beNil())
        }
        
        context("with error") {
          it("should return error") {
            // Arrange
            offerAdapterMock.getOfferError = .technical
            // Act
            interactor.getOfferData()
            // Assert
            expect(presenterMock.offerData).to(beNil())
            expect(presenterMock.dataError).to(matchError(MarcelFrameworks.Error.technical))
          }
        }
      }
    }
    
  }
  
  final class PresenterMock: HomeInteractorOutput
  {
    var dataError: MarcelFrameworks.Error?
    var didFinish: Bool?
    var offerData: OfferData?
    
    func updateOfferData(offer: OfferData) {
      offerData = offer
    }
    
    func updateError() {
      dataError = .technical
    }
  }
}
