//
//  BaseRepository.swift
//  MyCV
//
//  Created by User on 5/25/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

class BaseRepository {

  // MARK: - Public methods
  /**
   Call a generic service defined by url and completion APIResult type

   - Parameter url: a valid URL to get JSON response.
   - Parameter completion: a closure for call back.
   */
  static func callService<T: Decodable>(url: String, completion: @escaping (APIResult<T, APIError>) -> ()) {
    guard let url = URL(string: url) else {
      completion(.failure(.badURL))
      return
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    let sessionConfig = URLSessionConfiguration.default
    sessionConfig.timeoutIntervalForResource = Constants.Request.defaultTimeoutInterval
    
    let session = URLSession(configuration: sessionConfig)
    let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in

      if let error = error {  // Check for the error
        performAsync {
          completion(APIResult.failure(.unkown(error.localizedDescription)))
        }
      } else if let data = data,
        let response = response as? HTTPURLResponse,
        response.statusCode == 200 {  // Check for the data

        do {
          // The data is returned in JSON format and we are converting it into a model of decodable type
          let responseModel = try JSONDecoder().decode(T.self, from: data)
          performAsync {
            completion(.success(responseModel))
          }

        } catch {
          performAsync {
            completion(APIResult.failure(.badResponse))
          }
        }
      }
    })

    task.resume()
  }
}
