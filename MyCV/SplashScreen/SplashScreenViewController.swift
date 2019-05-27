//
//  SplashScreenViewController.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    performNextScreen()
  }

  // MARK: - Functions

  /// Function to show the next screen after 2 seconds
  func performNextScreen() {
    performAfter(Constants.Animation.duration) {
      DisplayCVWireFrame.presentDisplayCVModule()
    }
  }
}
