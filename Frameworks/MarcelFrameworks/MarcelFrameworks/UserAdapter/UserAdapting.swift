//
//  UserAdapting.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public typealias FavoriteAddressResult = (Result<UserAddresses, Error>) -> Void

public protocol UserAdapting
{
  func getUserFavoriteAddresses(completion: @escaping FavoriteAddressResult)
  func fetchUserFavoriteAddresses(completion: @escaping FavoriteAddressResult)
}
