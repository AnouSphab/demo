//
//  DriveAdapter.swift
//  MarcelFrameworks
//
//  Created by Anou on 31/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import Alamofire

public class DriveAdapter: BaseAdapter, DriveAdapting
{
  enum Request
  {
    case drives
    
    var path: String {
      switch self {
      case .drives: return "/drives"
      }
    }
    
    var method: HTTPMethod {
      switch self {
      case .drives: return .get
      }
    }
  }
  
  public func fetchDrives(for location: Location, arrival: Location, completion: @escaping DrivesResult) {
    
    // TODO: pass locations to url
    let resource = Resource(path: Request.drives.path, method: Request.drives.method)
    
    network.request(resource: resource, decode: DriveData.self) { result in
      switch result {
      case .failure(let error):
        
        // STUB:
        let data = DriveData()
        completion(.success(data.proposals))
        //completion(.failure(error))
      case .success(let data):
        completion(.success(data.proposals))
      }
    }
  }
}
