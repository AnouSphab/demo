//
//  UserAdapter.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import Alamofire

public class UserAdapter: BaseAdapter, UserAdapting
{
  enum Request
  {
    case favoriteAddresses
    
    var path: String {
      switch self {
      case .favoriteAddresses: return "/favoriteAddress"
      }
    }
    
    var method: HTTPMethod {
      switch self {
      case .favoriteAddresses: return .get
      }
    }
  }
  
  private var userAddresses: UserAddresses?
  
  public func getUserFavoriteAddresses(completion: @escaping FavoriteAddressResult) {
    // Get data from cache if already exist.
    if let addresses = userAddresses {
      completion(.success(addresses))
      return
    }
    
    fetchUserFavoriteAddresses(completion: completion)
  }
  
  public func fetchUserFavoriteAddresses(completion: @escaping FavoriteAddressResult) {
    let resource = Resource(path: Request.favoriteAddresses.path, method: Request.favoriteAddresses.method)
    
    network.request(resource: resource, decode: UserAddresses.self) { [weak self] result in
      switch result {
      case .failure(let error):
        // STUB: TO BE REMOVED
        let response = UserAddresses()
        completion(.success(response))
//        completion(.failure(error))
      case .success(let response):
        self?.userAddresses = response
        completion(.success(response))
      }
    }
  }
}
