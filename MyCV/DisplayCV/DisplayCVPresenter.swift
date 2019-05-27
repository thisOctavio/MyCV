//
//  DisplayCVPresenter.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import UIKit

class DisplayCVPresenter: DisplayCVPresenterProtocol {

  weak var view: DisplayCVViewProtocol?
  var interactor: DisplayCVInteractorInputProtocol?
  var wireFrame: DisplayCVWireFrameProtocol?

  private let commonLocalizable = CommonLocalizable()

  init() { }

  func viewReady() {
    self.interactor?.fetchMyCVInfo()
  }

  func select(_ section: Section) {
    DisplayCVWireFrame.presentSelected(section)
  }
}

extension DisplayCVPresenter: DisplayCVInteractorOutputProtocol {
  func loadMyCVData(_ data: MyCVModel) {
    if data.sections.isEmpty {
      view?.showError(title: commonLocalizable.errorTitle, message: commonLocalizable.errorMsgEmptySections)
    } else {
      view?.loadMyCVData(data)
    }
  }

  func handleError(_ error: APIError) {
    var message = commonLocalizable.errorMsgDefault
    switch error {
    case .badResponse:
      message = commonLocalizable.errorMsgBadResponse
    case .badURL:
      message = commonLocalizable.errorMsgBadURL
    case .noNetworkConnection:
      message = commonLocalizable.errorMsgNoConnection
    case .timeout:
      message = commonLocalizable.errorMsgTimeout
    case .unkown(let msg):
      message = msg
    }
    view?.showError(title: commonLocalizable.errorTitle, message: message)
  }
}
