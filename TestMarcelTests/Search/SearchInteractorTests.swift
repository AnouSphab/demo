//
//  SearchInteractorTests.swift
//  TestMarcelTests
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Quick
import Nimble

@testable import TestMarcel
@testable import MarcelFrameworks

final class SearchInteractorTests: QuickSpec
{
  override func spec() {
    var userAdapterMock: UserAdapterMock!
    var interactor: SearchDestinationInteractor!
    var presenterMock: PresenterMock!
    
    beforeEach {
      userAdapterMock = UserAdapterMock()
      presenterMock = PresenterMock()
      interactor = SearchDestinationInteractor(presenter: presenterMock, adapter: userAdapterMock)
    }
    
    describe("Search Destination Interactor") {
      describe("fetches user addresses data") {
        
        it("should return data") {
          userAdapterMock.favoritesAddress = UserAddresses()
          // Act
          interactor.getFavoritesAddresses()
          // Assert
          expect(presenterMock.addrData?.first?.number) == "100"
          expect(presenterMock.addrData?.first?.street) == "Quai de Jemmapes"
          expect(presenterMock.addrData?.first?.city) == "Paris"
          expect(presenterMock.addrData?.first?.type) == .home
          expect(presenterMock.dataError).to(beNil())
        }
        
        context("with error") {
          it("should return error") {
            // Arrange
            userAdapterMock.getFavAddrError = .technical
            // Act
            interactor.getFavoritesAddresses()
            // Assert
            expect(presenterMock.addrData).to(beNil())
            expect(presenterMock.dataError).to(matchError(MarcelFrameworks.Error.technical))
          }
        }
      }
    }
    
  }
  
  final class PresenterMock: SearchDestinationInteractorOutput
  {
    var dataError: MarcelFrameworks.Error?
    var didFinish: Bool?
    var addrData: [Address]?
    var usrLoc: GeocodeAddress?
    
    func updateError() {
      dataError = .technical
    }
    
    func updateUserLocation(_ address: GeocodeAddress) {
      usrLoc = address
    }
    
    func updateFavoritesAddresses(_ addresses: [Address]) {
      addrData = addresses
    }
  }
}
