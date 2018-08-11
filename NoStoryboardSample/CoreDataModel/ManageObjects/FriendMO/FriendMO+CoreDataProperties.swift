//
//  FriendMO+CoreDataProperties.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//
//

import Foundation
import CoreData


extension FriendMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendMO> {
        return NSFetchRequest<FriendMO>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var imgUrl: String?
    @NSManaged public var email: String?

}
