//
//  UserAddresses.swift
//  MarcelFrameworks
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public struct Address: Codable
{
  public var number: String
  public var street: String
  public var city: String
  public var type: AddressType
}

public enum AddressType: String, Codable
{
  case home
  case work
}

public protocol UserAddressesModel: Codable
{
  var addresses: [Address] { get set }
}

public struct UserAddresses: UserAddressesModel
{
  public var addresses: [Address]
  
  // Mock
  public init() {
    let home = Address(number: "100", street: "Quai de Jemmapes", city: "Paris", type: .home)
    let work = Address(number: "17-21", street: "rue de Saint Fiacre", city: "Paris", type: .work)
    self.addresses = [home, work]
  }
}
