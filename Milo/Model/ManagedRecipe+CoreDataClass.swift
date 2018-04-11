//
//  ManagedRecipe+CoreDataClass.swift
//  Milo
//
//  Created by Eldon Chan on 4/9/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

public class ManagedRecipe: NSManagedObject {

    func toRecipe() -> Recipe {
        
        let data = Data(referencing: image!)
        let newImage = UIImage(data: data)

        return Recipe(image: newImage!, name: name!, description: descriptions!)
    }
    
    func fromRecipe(recipe: Recipe) {
        let data = UIImagePNGRepresentation(recipe.image)
        image = NSData(data: data!)
        name = recipe.name
        descriptions = recipe.description
    }
}
