//
//  MyCVTests.swift
//  MyCVTests
//
//  Created by User on 5/25/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import XCTest
@testable import MyCV

class MyCVTests: XCTestCase {

  override func setUp() {
    continueAfterFailure = false
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testMyCVSuccessResponse() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify MyCV JSON response", comment: ""))

    let completion: (APIResult<MyCVModel,APIError>) -> Void = { (result) in
      switch result {
      case .success(_):
        expectation.fulfill()
      case .failure(_):
        XCTFail()
      }

    }
    BaseRepository.callService(url: Endpoints.MyCV.fetchSuccess.url, completion: completion)

    wait(for: [expectation], timeout: 3.0)
  }

  func testMyCVFailResponseIntegrity() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify MyCV JSON integrity", comment: ""))

    let completion: (APIResult<MyCVModel,APIError>) -> Void = { (result) in
      switch result {
      case .success(_):
        XCTFail()
      case .failure(_):
        expectation.fulfill()
      }

    }
    BaseRepository.callService(url: Endpoints.MyCV.fetchFail.url, completion: completion)

    wait(for: [expectation], timeout: 3.0)
  }

  func testMyCVSections() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify sections from JSON response", comment: ""))

    let completion: (APIResult<MyCVModel,APIError>) -> Void = { (result) in
      switch result {
      case .success(let myCVInfo):
        if myCVInfo.sections.count == 3 {
          expectation.fulfill() }
        else {
          XCTFail()
        }
      case .failure(_):
        XCTFail()
      }

    }
    BaseRepository.callService(url: Endpoints.MyCV.fetchSuccess.url, completion: completion)

    wait(for: [expectation], timeout: 3.0)
  }
}
