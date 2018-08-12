//
//  NetworkManager.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 12/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import Alamofire

class NetworkManager {
  
  //shared instance
  static let shared = NetworkManager()
  
  public let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
  public var isReachable: Bool {
    if reachabilityManager != nil {
      return reachabilityManager!.isReachable
    }
    else {
      // If we're unable to get the reachability manager then return true
      // Let the Networking api hit the server and return the error when there is no
      // internet.
      Log.error("Unable to get the reachability manager")
      return true
    }
  }
  
  /// Starts observing reachability
  func startNetworkReachabilityObserver() {
    reachabilityManager?.listener = { status in
      switch status {
        
      case .notReachable:
        Log.error("The network is not reachable")
        
      case .unknown :
        Log.warning("It is unknown whether the network is reachable")
        
      case .reachable(.ethernetOrWiFi):
        Log.info("The network is reachable over the WiFi connection")
        
      case .reachable(.wwan):
        Log.info("The network is reachable over the WWAN connection")
      }
    }
    
    // start listening
    reachabilityManager?.startListening()
  }
}
