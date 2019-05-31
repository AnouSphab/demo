//
//  OfferData.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public protocol OfferModel: Codable
{
  var imageURL: String { get set }
}

public struct OfferData: OfferModel
{
  public var imageURL: String
  
  // Mock
  public init() {
    self.imageURL = "offer"
  }
}
