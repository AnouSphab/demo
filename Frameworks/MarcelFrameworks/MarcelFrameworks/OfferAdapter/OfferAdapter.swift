//
//  OfferAdapter.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import Alamofire

public class OfferAdapter: BaseAdapter, OfferAdapting
{
  enum Request
  {
    case offer
    
    var path: String {
      switch self {
      case .offer: return "/offer"
      }
    }
    
    var method: Alamofire.HTTPMethod {
      switch self {
      case .offer: return .get
      }
    }
  }
  
  var offerData: OfferData?
  
  public func getOfferData(completion: @escaping OfferResult) {
    // Get data from cache if already exist.
    if let offer = self.offerData {
      completion(.success(offer))
      return
    }
    
    fetchOfferData(completion: completion)
  }
  
  public func fetchOfferData(completion: @escaping OfferResult) {
    let resource = Resource(path: Request.offer.path, method: Request.offer.method)
    
    network.request(resource: resource, decode: OfferData.self) { [weak self] result in
      switch result {
      case .failure(let error):
        // STUB: TO BE REMOVED
        let offerData = OfferData()
        completion(.success(offerData))
//        completion(.failure(error))
      case .success(let response):
        self?.offerData = response
        completion(.success(response))
      }
    }
  }
}
