//
//  FriendListInteractor.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

protocol FriendListBusinessLogic {
  func fetchOrders()
}

protocol FriendListDataStore: class {
  var orders: [FriendMO]? { get }
}

class FriendListInteractor: FriendListDataStore, FriendListBusinessLogic {
  var orders: [FriendMO]?
  var presenter: FriendListPresentationLogic?
  
  //FriendListBusinessLogic
  func fetchOrders() {
    FriendListApi().getFriendList(success: { (data) in
      Log.debug("API Success started")
      let appDelegate = Utility.getAppDelegate()
      appDelegate.persistentContainer.performBackgroundTask({ (context) in
        Log.debug("Background task")
      })
      Log.debug("API Success ended")
    }, failed: ({ (statusCode, error) in
      
    }))
  }
}
