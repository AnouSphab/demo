//
//  UserAdapterMock.swift
//  TestMarcelTests
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

@testable import MarcelFrameworks

final class UserAdapterMock: UserAdapting
{
  var favoritesAddress: UserAddresses?
  
  var getFavAddrError: MarcelFrameworks.Error?
  var fetchFavAddrError: MarcelFrameworks.Error?
  
  func getUserFavoriteAddresses(completion: @escaping FavoriteAddressResult) {
    if let addrs = favoritesAddress {
      completion(.success(addrs))
    } else {
      completion(.failure(getFavAddrError ?? .technical))
    }
  }
  
  func fetchUserFavoriteAddresses(completion: @escaping FavoriteAddressResult) {
    if let addrs = favoritesAddress {
      completion(.success(addrs))
    } else {
      completion(.failure(fetchFavAddrError ?? .technical))
    }
  }
}
