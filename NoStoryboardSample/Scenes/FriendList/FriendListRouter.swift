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
  func routeToFriendDetail(indexPath: IndexPath)
}

protocol FriendListDataPassing {
  var dataStore: FriendListDataStore? { get }
}

class FriendListRouter: FriendListRoutingLogic, FriendListDataPassing {
  weak var dataStore: FriendListDataStore?
  weak var viewController: UIViewController?
  
  func routeToFriendDetail(indexPath: IndexPath) {
    // Get the friend
    if let friend = self.dataStore?.friends[indexPath.row] {
      let detailFriendVC = FriendDetailVC(nibName: nil, bundle: nil)
      // Set the friend
      detailFriendVC.friendMO = friend
      self.viewController?.navigationController?.pushViewController(detailFriendVC, animated: true)
    }
  }
}
