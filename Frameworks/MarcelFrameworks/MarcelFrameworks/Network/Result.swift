//
//  Result.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public enum Result<T, E>
{
  case success(T)
  case failure(E)
}
