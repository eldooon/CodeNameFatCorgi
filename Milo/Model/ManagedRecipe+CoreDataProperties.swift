//
//  ManagedRecipe+CoreDataProperties.swift
//  Milo
//
//  Created by Eldon Chan on 4/9/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedRecipe> {
        return NSFetchRequest<ManagedRecipe>(entityName: "ManagedRecipe")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: NSData?
    @NSManaged public var descriptions: String?

}
