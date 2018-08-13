//
//  FriendListCoreData.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import CoreData

class FriendListCoreData {
  
  /// Fetches all the friends from the core data
  ///
  /// - Parameter context: Managed object contex
  /// - Returns: list of friend or nil if some error occurs
  func getFriendList(context: NSManagedObjectContext) -> [FriendMO]? {
    //TODO: Fetch all friends from core data
    let fetchRequest: NSFetchRequest<FriendMO> = FriendMO.fetchRequest()
    let sort = NSSortDescriptor(key: #keyPath(FriendMO.createdAt), ascending: true)
    fetchRequest.sortDescriptors = [sort]
    do {
      let friends = try context.fetch(fetchRequest)
      return friends
    }
    catch {
      Log.error("Failure to save context: \(error)")
      return nil
    }
  }
}
