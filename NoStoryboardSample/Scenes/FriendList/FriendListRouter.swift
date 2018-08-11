//
//  FriendListRouter.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import Foundation
import UIKit

protocol FriendListRoutingLogic {
  func routeToShowOrder(indexPath: IndexPath)
}

protocol FriendListDataPassing {
  var dataStore: FriendListDataStore? { get }
}

class FriendListRouter: FriendListRoutingLogic, FriendListDataPassing {
  weak var dataStore: FriendListDataStore?
  weak var viewController: UIViewController?
  
  func routeToShowOrder(indexPath: IndexPath) {
    
  }
}
