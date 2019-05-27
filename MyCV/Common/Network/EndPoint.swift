//
//  EndPoint.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

protocol Endpoint {
  var path: String { get }
  var url: String { get }
}

// MARK: - Endpoints enum
/// The enumeration for different services
enum Endpoints {
  enum MyCV: Endpoint {
    case fetchSuccess
    case fetchFail

    public var path: String {
      switch self {
      case .fetchSuccess:
        return "\(Constants.Request.myCVResourceSuccess)"
      case .fetchFail:
        return "\(Constants.Request.myCVResourceFail)"
      }
    }

    public var url: String {
      return "\(Constants.Request.baseURL)\(path)"
    }
  }
}
