//
//  DisplayCVAPIDataManager.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

class DisplayCVAPIDataManager: DisplayCVAPIDataManagerInputProtocol {

  init() { }

  func fetchMyCVInfo(completion: @escaping (APIResult<MyCVModel,APIError>) -> Void) {
    BaseRepository.callService(url: Endpoints.MyCV.fetchSuccess.url,
                               completion: completion)
  }
}
