//
//  Network.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import Alamofire

protocol Networkable
{
  func request<T: Decodable>(resource: Resource, decode: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

final class Network
{
  private let baseURL: String
  
  init(baseURL: String) {
    self.baseURL = baseURL
  }
}

extension Network: Networkable
{
  func request<T: Decodable>(resource: Resource, decode: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
    let finalURL = "\(baseURL)\(resource.path)"
    print("Requesting: \(finalURL))")
    
    Alamofire.request(finalURL, method: resource.method).responseJSON { result in
      switch (result.data, result.error) {
      case(let data?, _):
        if let jsonStr = String(data: data, encoding: .utf8) {
          print("Response data: \(String(describing: jsonStr))")

          let decoder = JSONDecoder()
          if let model = try? decoder.decode(decode, from: data) {
            completion(.success(model))
          } else {
            completion(.failure(.parsing))
          }
        } else {
          completion(.failure(.parsing))
        }
      case(_, _):
        completion(.failure(.network))
      }
    }
  }
}


