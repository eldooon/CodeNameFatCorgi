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
    
    func fetchRecipes(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void) {
        var recipes: [Recipe] = []
        let url = "https://cryptic-springs-90053.herokuapp.com/recipes"
        Alamofire.request(url).responseJSON { (response) in
            
            if let result = response.result.value {
                let recipesAPI = result as! [Dictionary<String, Any>]
                
                for item in recipesAPI {
                    let recipe = Recipe(image: #imageLiteral(resourceName: "chicken"), name: item["name"] as! String, description: item["description"] as! String)
                    print(recipe)
                    recipes.append(recipe)
                }
                completionHandler(recipes, nil)
            }
        }
    }
    
    func addToMyRecipes(recipeToAdd: Recipe, completionHandler: @escaping (Recipe?, RecipesStoreError?) -> Void) {
        //
    }
}
