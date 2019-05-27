//
//  DisplayCVWireframe.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import UIKit

class DisplayCVWireFrame: DisplayCVWireFrameProtocol {

  class func createDisplayCVViewController() -> DisplayCVViewController {
    return DisplayCVViewController.instantiate()
  }

  class func createDisplayCVDetailViewController() -> DisplayCVDetailViewController {
    return DisplayCVDetailViewController.instantiate()
  }

  class func presentDisplayCVModule() {
    // Generating module components
    let view = createDisplayCVViewController()
    let presenter: DisplayCVPresenterProtocol & DisplayCVInteractorOutputProtocol = DisplayCVPresenter()
    let interactor: DisplayCVInteractorInputProtocol = DisplayCVInteractor()
    let APIDataManager: DisplayCVAPIDataManagerInputProtocol = DisplayCVAPIDataManager()
    let wireFrame: DisplayCVWireFrameProtocol = DisplayCVWireFrame()

    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.APIDataManager = APIDataManager

    let navigationController = UINavigationController(rootViewController: view)
    UIApplication.shared.keyWindow?.rootViewController = navigationController
  }

  class func presentSelected(_ section: Section) {
    // Generating module components
    let view = createDisplayCVDetailViewController()

    // Connecting
    view.section = section

    if let rootView = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
      rootView.pushViewController(view, animated: true)
    }
  }
}
