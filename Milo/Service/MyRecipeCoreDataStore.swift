//
//  MyRecipeCoreDataStore.swift
//  Milo
//
//  Created by Eldon Chan on 4/10/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import Foundation
import CoreData

class MyRecipeCoreDataStore: RecipesStoreProtocol {
    
    //MOC
    
    var mainManagedObjectContext: NSManagedObjectContext
    var privateManagedObjectContext: NSManagedObjectContext
    
    init() {
        
        guard let modelURL = Bundle.main.url(forResource: "Milo", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        mainManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainManagedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeURL = docURL.appendingPathComponent("Milo.sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
        privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateManagedObjectContext.parent = mainManagedObjectContext
    }
    
    deinit {
        do {
            try self.mainManagedObjectContext.save()
        } catch {
            fatalError("Error deinitializing main managed object context")
        }
    }
    
    func fetchRecipes(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void) {
        privateManagedObjectContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedRecipe")
                let results = try self.privateManagedObjectContext.fetch(fetchRequest) as! [ManagedRecipe]
                let recipes = results.map { $0.toRecipe()}
                completionHandler(recipes, nil)

            } catch {
                completionHandler([], RecipesStoreError.CannotFetch("Cannot Fetch Recipes"))
            }
        }
    }
    
    func addToMyRecipes(recipeToAdd: Recipe, completionHandler: @escaping (Recipe?, RecipesStoreError?) -> Void) {
        privateManagedObjectContext.perform {
            do {
                let managedRecipe = NSEntityDescription.insertNewObject(forEntityName: "ManagedRecipe", into: self.privateManagedObjectContext) as! ManagedRecipe
                let recipe = recipeToAdd
                managedRecipe.fromRecipe(recipe: recipe)
                try self.privateManagedObjectContext.save()
                completionHandler(recipe, nil)
            } catch {
                completionHandler(nil, RecipesStoreError.CannotCreate("Cannot create order wih name \(String(describing: recipeToAdd.name))"))
            }
        }
    }
    
    
}
