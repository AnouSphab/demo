//
//  DriveAdapting.swift
//  MarcelFrameworks
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation

public typealias DrivesResult = (Result<[Drive], Error>) -> Void

public protocol DriveAdapting
{
  func fetchDrives(for location: Location, arrival: Location, completion: @escaping DrivesResult)
}
