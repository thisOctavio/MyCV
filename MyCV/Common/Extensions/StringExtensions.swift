//
//  StringExtensions.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

var tableName = "CommonLocalizables"

extension String {

  // MARK: - Public methods
  /**
   Returns a localized string, using the main bundle and CommonLocalizables file.
   */
  var localized: String {
    return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
  }
}
