//
//  Constants.swift
//  MyCV
//
//  Created by User on 5/25/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

struct Constants {

  // MARK: - Animation enum
  /// The enumeration for animation attributes
  struct Animation {
    static let duration = 1.0
  }

  // MARK: - Request enum
  /// The enumeration for request attributes
  struct Request {
    static let defaultTimeoutInterval = 60.0
    static let baseURL = "https://gist.githubusercontent.com/"
    static let myCVResourceSuccess = "eduardoAD/0ca1558667528ff0c5af3a768ec812cb/raw/488325f0ff3767f0b4a904d6e60da8d6230bc75a/MyCV.json"
    static let myCVResourceFail = "eduardoAD/b0593a6f720885b6b9cb91b88813f8be/raw/38e31c256caba1e26cba9d9e273058228bc6ada9/differentFormat.json"
  }

  // MARK: - CellIdentifier enum
  /// The enumeration for cell identifiers
  enum CellIdentifier: String {
    case information = "information_cell"
  }
}
