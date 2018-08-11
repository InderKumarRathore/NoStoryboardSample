//
//  FriendMO+CoreDataClass.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//
//

import Foundation
import CoreData

@objc(FriendMO)
public class FriendMO: NSManagedObject {
  /// FriendMO managed object from service object
  ///
  /// - Parameters:
  ///   - dict: dict containing the keys and value
  ///   - context: context in which mo has to be inserted
  /// - Returns: managed object
  static func createEntityFromDictionary(dict: [String: String], context: NSManagedObjectContext) -> FriendMO {
    let friend = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! FriendMO
    // Set the properties
    friend.name = dict["name"]
    friend.email = dict["email"]
    friend.imgUrl = dict["picture"]
    friend.id = dict["_id"]
    return friend
  }
}
