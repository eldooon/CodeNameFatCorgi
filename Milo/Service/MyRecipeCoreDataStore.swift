//
//  MyRecipeCoreDataStore.swift
//  Milo
//
//  Created by Eldon Chan on 4/10/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MyRecipeCoreDataStore: RecipesStoreProtocol {
    
    static let shared = MyRecipeCoreDataStore()
    
    //Persistent Container
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Milo")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        return container
    }()
    
    func fetchRecipes(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void) {
        
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<ManagedRecipe>(entityName: "ManagedRecipe")
        do {
            let results = try context.fetch(fetchRequest)
            let recipes = results.map{ $0.toRecipe()}
            completionHandler(recipes, nil)
        } catch let fetchErr {
            print("Failed to fetch recipes:", fetchErr)
        }

    }
    
    func addToMyRecipes(recipeToAdd: Recipe, completionHandler: @escaping (Recipe?, RecipesStoreError?) -> Void) {
        print("Attempting to save")
        
        let context = persistentContainer.viewContext
        
        let managedRecipe = NSEntityDescription.insertNewObject(forEntityName: "ManagedRecipe", into: context) as! ManagedRecipe
        let recipe = recipeToAdd
        let imageData = NSData(data: UIImagePNGRepresentation(recipe.image)!)
        managedRecipe.setValue(recipe.name, forKey: "name")
        managedRecipe.setValue(recipe.description, forKey: "descriptions")
        managedRecipe.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
        } catch let err {
            print("Failed to add recipe:", err)
        }
    
    
    
}
