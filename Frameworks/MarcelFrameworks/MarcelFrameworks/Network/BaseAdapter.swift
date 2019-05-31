//
//  BaseAdapter.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public class BaseAdapter
{
  var network: Networkable
  let baseURL = "BASE_URL"
  
  public init() {
    self.network = Network(baseURL: baseURL)
  }
}
