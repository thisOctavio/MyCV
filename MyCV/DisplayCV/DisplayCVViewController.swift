//
//  DisplayCVViewController.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import UIKit

class DisplayCVViewController: UIViewController {
  @IBOutlet var tableView: UITableView!
  
  static var storyboardFileName: String = "DisplayCV"
  var presenter: DisplayCVPresenterProtocol?

  // MARK: - Attributes
  public var myCVModel: MyCVModel?

  // MARK: - Private attributes
  private let commonLocalizable = CommonLocalizable()

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTable()
    tableView.refreshControl?.beginRefreshing()
    presenter?.viewReady()
  }

  // MARK: - Private methods
  private func setupTable() {
    self.tableView.register(UITableViewCell.self,
                            forCellReuseIdentifier: Constants.CellIdentifier.information.rawValue)
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
    self.tableView.refreshControl = refreshControl
  }

  @objc public func pullToRefresh(_ sender: UIRefreshControl) {
    tableView.refreshControl?.beginRefreshing()
    presenter?.viewReady()
  }
}

extension DisplayCVViewController: DisplayCVViewProtocol {
  
  func loadMyCVData(_ data: MyCVModel) {
    tableView.refreshControl?.endRefreshing()
    myCVModel = data
    self.title = data.fullName
    tableView.reloadData()
  }

  func showError(title: String, message: String) {
    let alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: commonLocalizable.errorAcceptButton,
                                            style: .cancel,
                                            handler: nil))
    self.present(alertController, animated: true, completion: { [unowned self] in
      self.tableView.refreshControl?.endRefreshing()
    })
  }
}

extension DisplayCVViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.myCVModel?.sections.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = self.myCVModel?.sections[indexPath.row] else {
      fatalError(commonLocalizable.errorMsgEmptySections)
    }

    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.information.rawValue, for: indexPath)
    cell.accessoryType = .disclosureIndicator
    cell.textLabel?.text = section.title
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    guard let section = self.myCVModel?.sections[indexPath.row] else {
      fatalError(commonLocalizable.errorMsgEmptySections)
    }

    presenter?.select(section)
  }
}
