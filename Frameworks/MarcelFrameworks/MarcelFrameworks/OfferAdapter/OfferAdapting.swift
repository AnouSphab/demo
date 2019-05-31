//
//  OfferAdapting.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public typealias OfferResult = (Result<OfferData, Error>) -> Void

public protocol OfferAdapting
{
  func fetchOfferData(completion: @escaping OfferResult)
  func getOfferData(completion: @escaping OfferResult)
}
