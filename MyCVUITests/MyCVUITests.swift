//
//  MyCVUITests.swift
//  MyCVUITests
//
//  Created by User on 5/25/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import XCTest

class MyCVUITests: XCTestCase {

  // MARK: - Attributes
  let app = XCUIApplication()

  // MARK: - Super class methods
  override func setUp() {
    continueAfterFailure = false
    app.launch()
    let label = app.staticTexts["Interest"]
    while !label.exists {
      sleep(1)
    }
  }

  // MARK: - Tests methods
  func testHeaderSections() {
    XCTAssertTrue(app.tables.staticTexts["Interest"].exists)
    XCTAssertTrue(app.tables.staticTexts["Experience"].exists)
    XCTAssertTrue(app.tables.staticTexts["Contact"].exists)
  }

  // Method to test tableview's pull to refresh functionality
  func testPullToRefresh() {
    let firstCell = app.staticTexts["Interest"]
    let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
    let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 12))
    start.press(forDuration: 0.1, thenDragTo: finish)
  }

  // Method to test tableview's number of sections
  func testNumberOfSections() {
    let numberOfCells = app.tables.cells.count
    XCTAssertEqual(numberOfCells, 3)
  }
}
