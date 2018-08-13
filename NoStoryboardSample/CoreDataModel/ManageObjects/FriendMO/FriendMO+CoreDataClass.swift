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
  static func createEntityFromDictionary(dict: [String: AnyObject], context: NSManagedObjectContext) -> FriendMO {
    let friend = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! FriendMO
    // Set the properties
    friend.name = dict["name"] as? String
    friend.email = dict["email"]  as? String
    friend.imgUrl = dict["picture"]  as? String
    friend.id = dict["_id"]  as? String
    if let location = dict["location"] as? [String: Double] {
      friend.latitude = location["latitude"] ?? 0.0
      friend.longitude = location["longitude"] ?? 0.0
    }
    return friend
  }
}
