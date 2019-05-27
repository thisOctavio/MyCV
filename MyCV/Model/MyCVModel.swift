//
//  MyCVModel.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

// MARK: - Section struct
/// The holder from user's information sections
struct Section: Codable {
  var title: String
  var description: String
}

// MARK: - MyCV struct
// Model to hold MyCV response
public struct MyCVModel: Codable {
  var fullName: String
  var photo: String
  var sections: [Section]
}
