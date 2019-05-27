//
//  CommonLocalizable.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

class CommonLocalizable {

  // Common
  var appTitle: String {
    get {
      return "app_title".localized
    }
  }

  // Error messages
  var errorTitle: String {
    get {
      return "error_title".localized
    }
  }

  var errorMsgDefault: String {
    get {
      return "error_msg_default".localized
    }
  }

  var errorMsgBadResponse: String {
    get {
      return "error_msg_badResponse".localized
    }
  }

  var errorMsgBadURL: String {
    get {
      return "error_msg_badURL".localized
    }
  }

  var errorMsgNoConnection: String {
    get {
      return "error_msg_noNetworkConnection".localized
    }
  }

  var errorMsgTimeout: String {
    get {
      return "error_msg_timeout".localized
    }
  }

  var errorMsgEmptySections :String {
    get {
      return "error_msg_emptySections".localized
    }
  }
  
  var errorAcceptButton: String {
    get {
      return "error_accept_button".localized
    }
  }
}
