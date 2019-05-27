//
//  DisplayCVProtocols.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import UIKit

protocol DisplayCVViewProtocol: LoadableViewController {
  var presenter: DisplayCVPresenterProtocol? { get set }

  // MARK: Methods for communication PRESENTER -> VIEW
  /**
   Load MyCVModel data feched by service

   - Parameter data: a valid MyCVModel.
   */
  func loadMyCVData(_ data: MyCVModel)
  /**
   Present a custom error alert with title and message

   - Parameter title: error title.
   - Parameter message: error description.
   */
  func showError(title: String, message: String)
}

protocol DisplayCVWireFrameProtocol: class {
  // MARK: Methods for communication PRESENTER -> WIREFRAME
  /**
   Present DisplayCV module
   */
  static func presentDisplayCVModule()
  /**
   Present a selected section

   - Parameter section: a valid section.
   */
  static func presentSelected(_ section: Section)
}

protocol DisplayCVPresenterProtocol: class {
  var view: DisplayCVViewProtocol? { get set }
  var interactor: DisplayCVInteractorInputProtocol? { get set }
  var wireFrame: DisplayCVWireFrameProtocol? { get set }
  // MARK: Methods for communication VIEW -> PRESENTER
  /**
   Inform that the view is ready and loaded
   */
  func viewReady()
  /**
   Inform that the user select a specific section

   - Parameter section: a valid section in the table.
   */
  func select(_ section: Section)
}

protocol DisplayCVInteractorOutputProtocol: class {
  // MARK: Methods for communication INTERACTOR -> PRESENTER
  /**
   Load MyCVModel data feched by service

   - Parameter data: a valid MyCVModel.
   */
  func loadMyCVData(_ data: MyCVModel)
  /**
   Handle an especific APIError

   - Parameter error: an especific APIError.
   */
  func handleError(_ error: APIError)
}

protocol DisplayCVInteractorInputProtocol: class {
  var presenter: DisplayCVInteractorOutputProtocol? { get set }
  var APIDataManager: DisplayCVAPIDataManagerInputProtocol? { get set }
  // MARK: Methods for communication PRESENTER -> INTERACTOR
  /**
   Order to fetch MyCV info
   */
  func fetchMyCVInfo()
}

protocol DisplayCVAPIDataManagerInputProtocol: class {
  // MARK: Methods for communication INTERACTOR -> APIDATAMANAGER
  /**
   Fetch MyCV info calling a service

   - Parameter completion: a closure with MyCVModel reponse for call back.
   */
  func fetchMyCVInfo(completion: @escaping (APIResult<MyCVModel,APIError>) -> Void)
}
