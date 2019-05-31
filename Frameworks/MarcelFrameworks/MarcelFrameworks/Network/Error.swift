//
//  Error.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public enum Error: Swift.Error
{
  case technical
  case network
  case parsing
  case database
  
  var description: String {
    switch self {
    case .technical: return "Technical error"
    case .network: return "Network error"
    case .parsing: return "Parsing error"
    case .database: return "Database error"
    }
  }
}
