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
    // Convert the MO into view model
    var viewModels = [FriendViewModel]()
    for friend in friends {
      let viewModel = FriendViewModel(name: friend.name ?? "",
                                      email: friend.email ?? "",
                                      url: friend.imgUrl ?? "")
      viewModels.append(viewModel)
    }
    
    self.viewController?.displayFetchedFriends(viewModels: viewModels)

  }
  
  func fetchingFriendsFailed(statusCode: Int, error: Error) {
    
  }
  // ~ ~ ~ ~ FriendListPresentationLogic Ends ~ ~ ~ ~
}
