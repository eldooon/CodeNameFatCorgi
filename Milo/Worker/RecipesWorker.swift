//
//  RecipesWorker.swift
//  Milo
//
//  Created by Eldon Chan on 3/29/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import Foundation

//Recipe Workers

protocol RecipesStoreProtocol {
    func fetchOrders(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void)
}

class RecipesWorkers {
    
    var recipesStore: RecipesStoreProtocol
    
    init(recipesStore: RecipesStoreProtocol) {
        self.recipesStore = recipesStore
    }
    
    func fetchRecipes(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void) {
        //Temporary Test Data
        let testData = TestRecipe.testRecipeData
        completionHandler(testData, nil)
    }
    
    func fetchMyRecipes(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void) {
        //Temporary Test Data
        let myRecipes = MyRecipeMemStore.recipes
        completionHandler(myRecipes, nil)
    }
    
}

enum RecipesStoreError: Equatable, Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}

func ==(lhs: RecipesStoreError, rhs: RecipesStoreError) -> Bool
{
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
    case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
    case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
    default: return false
    }
}
