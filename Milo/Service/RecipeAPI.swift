//
//  RecipeAPI.swift
//  Milo
//
//  Created by Eldon Chan on 4/18/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import Alamofire
import UIKit

class RecipeAPI: RecipesStoreProtocol {

    func fetchRecipesfromAPI() {
        let url =
            Alamofire.request("localhost:3002/recipes").responseJSON { (response) in
                print(response)
        }
    }
    
    func fetchRecipes(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void) {
        //
    }
    
    func addToMyRecipes(recipeToAdd: Recipe, completionHandler: @escaping (Recipe?, RecipesStoreError?) -> Void) {
        //
    }
}
