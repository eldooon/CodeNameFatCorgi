//
//  MyRecipeMemStore.swift
//  Milo
//
//  Created by Eldon Chan on 4/6/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class MyRecipeMemStore: RecipesStoreProtocol {
    
    static var recipes: [Recipe] = []
    
    func fetchOrders(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void) {
        completionHandler(type(of: self).recipes, nil)
    }
    
    static func addRecipe(recipe: Recipe) -> Void {
        MyRecipeMemStore.recipes.append(recipe)
    }
    
}
