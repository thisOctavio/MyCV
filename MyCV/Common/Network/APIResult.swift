//
//  APIResult.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

/**
 Enlists the different kind of response errors handled by the library.

 - badResponse: Throwed when the response couldn't be deserialized into an object
 - badURL: Throwed when the URL couldn't be builded
 - noNetworkConnection: Throwed when there's no outgoing connection
 - timeout: Throwed when the time reaches the limit to response
 */
public enum APIError: Error {
  case badResponse
  case badURL
  case noNetworkConnection
  case timeout
  case unkown(String)
}

/**
 Represents the kind of result obtanied form a Web API request call.
 - success: A successful response, containing the resultant object.
 - failure: An unsuccessful response, including the specific kind of error.
 */
enum APIResult<T, APIError> {
  case success(T)
  case failure(APIError)
}
