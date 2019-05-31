//
//  Drive.swift
//  MarcelFrameworks
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public enum RangeType: String, Decodable
{
  case eco
  case business
  case travel
}

public struct Drive: Decodable
{
  public var range: RangeType
  public var price: Double
  public var time: Int
}

public struct DriveData: Decodable
{
  public var proposals: [Drive]
  
  // mock
  public init() {
    proposals = [Drive(range: .eco, price: 8.5, time: 170),
                 Drive(range: .business, price: 15, time: 240),
                 Drive(range: .travel, price: 15, time: 340)]
  }
}
