//
//  LoadableViewController.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import UIKit

protocol LoadableViewController: class {
  static var storyboardFileName: String { get }
  static var storyboardID: String { get }
}

extension LoadableViewController {
  static var storyboardID: String {
    return String(describing: self)
  }
}

extension LoadableViewController where Self: UIViewController {
  // MARK: - Public methods
  /**
   Instanciate and returns a viewController using storyboardFileName and storyboardID
   */
  static func instantiate() -> Self {
    let storyboard = Self.storyboardFileName
    guard let vc = UIStoryboard.instanceofViewController(with: storyboardID, from: storyboardFileName) as? Self else {
      fatalError("The viewController '\(self.storyboardID)' of '\(storyboard)' is not of class '\(self)'")
    }

    return vc
  }
}
