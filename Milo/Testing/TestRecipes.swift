//
//  File.swift
//  Milo
//
//  Created by Eldon Chan on 3/29/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit


let turkey = Recipe(name: "Turkey", description: "Turkey w/ Rice")
let chicken = Recipe(name: "Chicken", description: "Chicken w/ Rice")
let beef = Recipe(name: "Beef", description: "Beef w/ Pasta")

class TestRecipe: RecipesStoreProtocol {
    
    static let testRecipeData = [turkey, chicken, beef]
    
    func fetchOrders(completionHandler: @escaping ([Recipe], RecipesStoreError?) -> Void) {
        completionHandler(type(of: self).testRecipeData, nil)
    }
}
