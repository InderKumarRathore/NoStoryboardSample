//
//  FriendListPresenter.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

protocol FriendListPresentationLogic {
  func presentFetchedFriends(friends: [FriendMO])
  func fetchingFriendsFailed(statusCode: Int, error: Error)
}

class FriendListPresenter: FriendListPresentationLogic {
  weak var viewController: FriendListDisplayLogic?
  
  // MARK: FriendListPresentationLogic
  func presentFetchedFriends(friends: [FriendMO]) {

  }
  
  func fetchingFriendsFailed(statusCode: Int, error: Error) {
    
  }
  // ~ ~ ~ ~ FriendListPresentationLogic Ends ~ ~ ~ ~
}
