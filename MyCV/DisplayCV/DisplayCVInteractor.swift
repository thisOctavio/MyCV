//
//  DisplayCVInteractor.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

class DisplayCVInteractor: DisplayCVInteractorInputProtocol {

  weak var presenter: DisplayCVInteractorOutputProtocol?
  var APIDataManager: DisplayCVAPIDataManagerInputProtocol?

  init() { }

  func fetchMyCVInfo() {
    APIDataManager?.fetchMyCVInfo(completion: { [unowned self] (result) in
      switch result {
      case .success(let myCVInfo):
        self.presenter?.loadMyCVData(myCVInfo)
      case .failure(let error):
        self.presenter?.handleError(error)
      }
    })
  }
}
