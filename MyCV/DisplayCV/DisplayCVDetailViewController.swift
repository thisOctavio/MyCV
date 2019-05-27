//
//  DisplayCVDetailViewController.swift
//  MyCV
//
//  Created by User on 5/25/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import UIKit

class DisplayCVDetailViewController: UIViewController, LoadableViewController {

  @IBOutlet var descriptionLabel: UILabel!

  static var storyboardFileName: String = "DisplayCV"

  // MARK: - Attributes
  public var section: Section?

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }

  // MARK: - Private methods
  private func setupUI() {
    self.title = section?.title
    self.descriptionLabel.text = section?.description
  }
}
