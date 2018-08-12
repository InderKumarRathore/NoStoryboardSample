//
//  FriendListInteractor.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import Foundation
import CoreData

protocol FriendListBusinessLogic {
  func fetchFriends()
}

protocol FriendListDataStore: class {
  var friends: [FriendMO] { get }
}

class FriendListInteractor: FriendListDataStore, FriendListBusinessLogic {
  var friends: [FriendMO] = []
  var presenter: FriendListPresentationLogic?
  
  
  //MARK: FriendListBusinessLogic
  func fetchFriends() {
    // Check whether internet is present or not
    if NetworkManager.shared.isReachable {
      // Tell presenter to show the loading
      // TODO:
      FriendListApi().getFriendList(success: { [weak self] (data) in
        Log.debug("API Success started")
        
        // Check whether we've data or not
        if let friendsArray = data {
          // We have the data now we can cache it and give it to presenter
          let appDelegate = Utility.getAppDelegate()
          appDelegate.persistentContainer.performBackgroundTask({ (context) in
            Log.debug("Background task")
            self?.friends.removeAll() // Empty the array
            //Remove existing friends from the core data
            // Create Fetch Request
            let fetchRequest:NSFetchRequest<FriendMO> = FriendMO.fetchRequest()
            
            // Create Batch Delete Request
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
            
            do {
              let result = try context.execute(batchDeleteRequest)
              Log.debug(result)
            } catch {
              // Error Handling
            }
            
            // Create new friends and add them into core data
            for dict in friendsArray {
              let friendMO = FriendMO.createEntityFromDictionary(dict: dict, context: context)
              self?.friends.append(friendMO)
            }
            
            // Save the context
            do {
              try context.save()
              // Notify presenter that we've data to show
              DispatchQueue.main.async {
                self?.presenter?.presentFetchedFriends(friends: self!.friends) // self! exists if this is being called
              }
            } catch {
              Log.error("Failure to save context: \(error)")
              // Show cache result
              DispatchQueue.main.async {
                self?.presenter?.presentFetchedFriends(friends: self!.friends)
                self?.presenter?.showError("Unable to save data locally")
              }
            }
          })
        }
        else {
          // Show cache data
          self?.showCachedDataAndError(msg: "Unable to fetch data from the server", statusCode: nil)
        }
      }, failed: ({ [weak self] (statusCode, error) in
        // Show cached data
        self?.showCachedDataAndError(msg: nil, statusCode: statusCode)
      }))
    }
    else { // Internet is not active
      // Show cached data
      showCachedDataAndError(msg: "Internet not available", statusCode: nil)
    }
  }
  
  private func showCachedDataAndError(msg: String? = nil, statusCode: Int? = nil) {
    let context = Utility.getAppDelegate().persistentContainer.viewContext
    let friendCD =  FriendListCoreData()
    if let friends = friendCD.getFriendList(context:context) {
      self.presenter?.presentFetchedFriends(friends: friends)
      // Show error as well
      if let errorMsg = msg {
        DispatchQueue.main.async {
          self.presenter?.showError(errorMsg)
        }
      }
      else {
        // Depending upon the status code we can send the different error messages
        DispatchQueue.main.async {
          self.presenter?.showError("Unable to fech data from the server")
        }
      }
      
    }
    else {
      // Core data fetching has also failed
      DispatchQueue.main.async {
        self.presenter?.showError("Unable to fech data from the server and local db")
      }
    }
  }
  
}
