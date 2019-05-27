//
//  UIStoryboardExtensions.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import UIKit

typealias StoryboardID = String

extension UIStoryboard {

  // MARK: - Public methods
  /**
   Instanciate and returns a viewController in specific storyboard

   - Parameter storyboardID: a valid storyboard id.
   - Parameter storyboardFileName: name of the storyboard file.
   */
  class func instanceofViewController(with storyboardID: String, from storyboardFileName: String) -> UIViewController? {
    let storyboard = UIStoryboard(
      name: storyboardFileName,
      bundle: nil
    )

    return storyboard.instantiateViewController(withIdentifier: storyboardID)
  }
}
